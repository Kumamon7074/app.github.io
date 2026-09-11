---
title: 软件隐私政策
lang: zh
translation: /en/privacy/
---
<header class="page-heading">
  <p class="eyebrow">隐私政策目录</p>
  <h1>请先确认软件</h1>
  <p class="lede">部分旧版软件共用此地址。下方政策仅适用于超级计算器。</p>
</header>
{% include app-directory.html %}
<div class="prose">
  <p>如需了解 Folder 的隐私事项，请<a href="mailto:{{ site.contact_email }}?subject=Folder%20privacy">联系开发者</a>。计算器政策不适用于 Folder。</p>
</div>
{% assign policies = site.policies | where: "lang", "zh" %}
{% for policy in policies %}
<section class="legacy-policy">
  <h2>{{ policy.app_name }} · 隐私政策</h2>
  <p class="version-note">生效与更新：{{ policy.updated }} · 政策版本 {{ policy.policy_version }} · <a href="{{ policy.url | relative_url }}">打开该软件的独立政策</a></p>
  <article class="prose">{{ policy.content | markdownify }}</article>
</section>
{% endfor %}
