#!/usr/bin/env python3
"""Validate the generated Vanto site after Jekyll, without external dependencies."""
import hashlib
import json
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urljoin, urlsplit, unquote
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "_site"
ORIGIN = "https://apps.vanto.space"
BASE = ORIGIN + "/vanto/"
LOCALES = "zh zh-Hant en ja ko es de fr th vi pt-BR it ru id tr pl nl pt-PT ms hi uk ar he".split()
DOCUMENTS = ("", "media-guide/", "privacy/", "terms/")


class Page(HTMLParser):
    def __init__(self, markup):
        super().__init__()
        self.tags = []
        self.feed(markup)

    def handle_starttag(self, tag, attrs):
        self.tags.append((tag, dict(attrs)))

    def matching(self, tag, **attrs):
        return [a for t, a in self.tags if t == tag and all(a.get(k.replace("_", "-")) == v for k, v in attrs.items())]


def check():
    manifest = json.loads((ROOT / "vanto/deployment.json").read_text())
    assert manifest["schemaVersion"] == 1 and manifest["publicURL"] == BASE
    for relative, digest in manifest["files"].items():
        file = OUTPUT / "vanto" / relative
        assert file.is_file(), f"missing export: {relative}"
        assert hashlib.sha256(file.read_bytes()).hexdigest() == digest, f"Jekyll changed export: {relative}"
        if "/versioned/" in relative:
            assert f".{digest[:12]}." in file.name, f"asset fingerprint mismatch: {relative}"
    assert not (OUTPUT / "vanto/CNAME").exists()
    for forbidden in ("scripts", "content", "README.md", ".git", "证书", ".nojekyll"):
        assert not (OUTPUT / "vanto" / forbidden).exists(), f"private/source output: {forbidden}"
    urls = {BASE} | {BASE + locale + "/" + document for locale in LOCALES for document in DOCUMENTS}
    sitemap = ET.parse(OUTPUT / "vanto/sitemap.xml")
    assert {node.text for node in sitemap.findall(".//{*}loc")} == urls, "incomplete Vanto sitemap"
    pages = {}
    for url in sorted(urls):
        file = OUTPUT / urlsplit(url).path.lstrip("/") / "index.html"
        markup = file.read_text()
        assert "{{" not in markup and "{%" not in markup, f"unrendered source: {url}"
        assert "粤ICP备" not in markup and "https://vanto.space/" not in markup, f"old origin or filing: {url}"
        page = Page(markup)
        pages[url] = page
        assert page.matching("link", rel="canonical")[0]["href"] == url, f"canonical: {url}"
        assert len(page.matching("h1")) == 1 and page.matching("main"), f"structure: {url}"
        assert page.matching("html")[0].get("data-site-base") == "/vanto/", f"site base: {url}"
        if "/ar/" in url or "/he/" in url:
            assert page.matching("html")[0].get("dir") == "rtl", f"RTL: {url}"
        assert len(page.matching("option")) == 23, f"language options: {url}"
        alternates = page.matching("link", rel="alternate")
        assert len(alternates) == 24 and all(a["href"] in urls for a in alternates), f"hreflang: {url}"
        assert page.matching("meta", name="apple-itunes-app")[0]["content"] == "app-id=6794951510"
        assert any(tag == "a" and "data-app-directory" in attrs for tag, attrs in page.tags), f"platform navigation: {url}"
        scripts = page.matching("script")
        assert len(scripts) == 1 and scripts[0].get("src", "").startswith("/vanto/assets/versioned/js/site."), f"unexpected runtime: {url}"
        for tag, attrs in page.tags:
            if "data-app-store-link" in attrs:
                assert attrs["href"].startswith("https://apps.apple.com/") and attrs["href"].endswith("/app/id6794951510")
            values = [attrs[key] for key in ("href", "src", "value") if key in attrs and tag != "meta"]
            values += [v.strip().split()[0] for v in attrs.get("srcset", "").split(",") if v.strip()]
            for value in values:
                resolved = urlsplit(urljoin(url, value))
                if resolved.netloc != urlsplit(ORIGIN).netloc:
                    continue
                destination = OUTPUT / unquote(resolved.path).lstrip("/")
                if resolved.path.endswith("/"):
                    destination /= "index.html"
                assert destination.is_file(), f"broken resource/link: {url} -> {value}"
                if resolved.fragment and resolved.path.startswith("/vanto/"):
                    target = Page(destination.read_text())
                    assert any(a.get("id") == resolved.fragment for _, a in target.tags), f"broken anchor: {url} -> {value}"
    for home in ("index.html", "zh/index.html"):
        page = Page((OUTPUT / home).read_text())
        assert page.matching("a", href="/vanto/zh/" if home.startswith("zh/") else "/vanto/en/"), "Vanto missing from directory"
    print(f"Vanto checks passed: {len(urls)} pages, 23 locales, assets, links, RTL, metadata, App Store and source isolation.")


if __name__ == "__main__":
    check()
