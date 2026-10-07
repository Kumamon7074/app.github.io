(() => {
  // Only the root entry selects a language automatically. Deep links stay put.
  const supportedLocales = new Set([
    "zh", "zh-Hant", "en", "ja", "ko", "es", "de", "fr", "th", "vi",
    "pt-BR", "it", "ru", "id", "tr", "pl", "nl", "pt-PT", "ms", "hi", "uk", "ar", "he"
  ]);
  const localePreferenceKey = "vanto.site.locale";
  // The same static site is served at / on Tencent Cloud and /vanto/ on the app platform.
  const siteBase = document.documentElement.dataset?.siteBase || "/";
  const localeForLanguage = (languageTag) => {
    const tag = String(languageTag || "").replaceAll("_", "-").toLowerCase();
    const parts = tag.split("-");
    if (parts[0] === "zh") {
      return parts.includes("hant") || (!parts.includes("hans") && parts.some((p) => ["tw", "hk", "mo"].includes(p))) ? "zh-Hant" : "zh";
    }
    if (parts[0] === "pt") return parts.includes("br") ? "pt-BR" : "pt-PT";
    if (parts[0] === "iw") return "he";
    return supportedLocales.has(parts[0]) ? parts[0] : null;
  };
  if (document.documentElement.hasAttribute("data-locale-root") && [siteBase, `${siteBase}index.html`].includes(window.location.pathname)) {
    let preferred;
    try { preferred = localStorage.getItem(localePreferenceKey); } catch { /* Storage may be blocked. */ }
    const languages = navigator.languages?.length ? navigator.languages : [navigator.language];
    const locale = supportedLocales.has(preferred) ? preferred : languages.map(localeForLanguage).find(Boolean) || "en";
    window.location.replace(`${siteBase}${locale}/${window.location.search}${window.location.hash}`);
    return;
  }
  const appStoreId = "6794951510";
  const defaultStorefronts = {
    "zh-cn": "cn", "zh-hant": "tw", en: "us", ja: "jp", ko: "kr",
    es: "es", de: "de", fr: "fr", th: "th", vi: "vn",
    "pt-br": "br", it: "it", ru: "ru", id: "id", tr: "tr",
    pl: "pl", nl: "nl", "pt-pt": "pt", ms: "my", hi: "in",
    uk: "ua", ar: "sa", he: "il"
  };
  const labels = {
    "zh-CN": ["复制", "已复制"], "zh-Hant": ["複製", "已複製"],
    en: ["Copy", "Copied"], ja: ["コピー", "コピー済み"], ko: ["복사", "복사됨"],
    es: ["Copiar", "Copiado"], de: ["Kopieren", "Kopiert"], fr: ["Copier", "Copié"],
    th: ["คัดลอก", "คัดลอกแล้ว"], vi: ["Sao chép", "Đã sao chép"],
    "pt-BR": ["Copiar", "Copiado"], it: ["Copia", "Copiato"], ru: ["Копировать", "Скопировано"],
    id: ["Salin", "Disalin"], tr: ["Kopyala", "Kopyalandı"], pl: ["Kopiuj", "Skopiowano"],
    nl: ["Kopiëren", "Gekopieerd"], "pt-PT": ["Copiar", "Copiado"], ms: ["Salin", "Disalin"],
    hi: ["कॉपी करें", "कॉपी हो गया"], uk: ["Копіювати", "Скопійовано"],
    ar: ["نسخ", "تم النسخ"], he: ["העתקה", "הועתק"]
  };
  const language = document.documentElement.lang;
  const copyLabels = labels[language] || labels[language.split("-")[0]] || labels.en;

  const regionFromLanguage = (tag) => {
    const subtags = String(tag || "").replaceAll("_", "-").split("-").slice(1);
    const region = subtags.findLast((subtag) => /^[a-z]{2}$/i.test(subtag));
    return region ? region.toLowerCase() : null;
  };
  const defaultStorefront = (tag) => {
    const normalized = String(tag || "").toLowerCase();
    return defaultStorefronts[normalized]
      || defaultStorefronts[normalized.split("-")[0]]
      || "us";
  };
  const browserLanguages = navigator.languages?.length
    ? navigator.languages
    : [navigator.language];
  const storefront = browserLanguages
    .map(regionFromLanguage)
    .find(Boolean) || defaultStorefront(language);
  const appStoreURL = `https://apps.apple.com/${storefront}/app/id${appStoreId}`;

  document.querySelectorAll("[data-app-store-link]").forEach((link) => {
    link.href = appStoreURL;
  });

  document.querySelectorAll("[data-language-picker]").forEach((picker) => {
    picker.addEventListener("change", () => {
      if (!picker.value.startsWith(siteBase)) return;
      const locale = picker.value.slice(siteBase.length).split("/")[0];
      if (!supportedLocales.has(locale)) return;
      try { localStorage.setItem(localePreferenceKey, locale); } catch { /* Navigation still works. */ }
      window.location.assign(picker.value + window.location.hash);
    });
  });

  document.querySelectorAll("pre").forEach((block) => {
    if (!navigator.clipboard?.writeText) return; // The selectable code stays usable.
    const wrapper = document.createElement("div");
    wrapper.className = "code-wrap";
    block.parentNode.insertBefore(wrapper, block);
    wrapper.appendChild(block);

    const button = document.createElement("button");
    button.type = "button";
    button.className = "copy-button";
    button.textContent = copyLabels[0];
    button.addEventListener("click", async () => {
      try {
        await navigator.clipboard.writeText(block.innerText);
      } catch {
        // Leave selectable code visible when clipboard access is denied.
        return;
      }
      const original = button.textContent;
      button.textContent = copyLabels[1];
      window.setTimeout(() => { button.textContent = original; }, 1200);
    });
    wrapper.appendChild(button);
  });
})();
