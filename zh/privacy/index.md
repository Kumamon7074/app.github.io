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
  <p>另一款应用请阅读<a href="{{ '/zh/app/folder/privacy/' | relative_url }}">文件夹隐私政策</a>。下方计算器政策不适用于它。</p>
</div>
{% assign policies = site.policies | where: "lang", "zh" | where: "app", "calculator" %}
{% for policy in policies %}
<section class="legacy-policy">
  <h2>{{ policy.app_name }} · 隐私政策</h2>
  <p class="version-note">生效与更新：{{ policy.updated }} · 政策版本 {{ policy.policy_version }} · <a href="{{ policy.url | relative_url }}">打开该软件的独立政策</a></p>
  <article class="prose">{{ policy.content | markdownify }}</article>
</section>
{% endfor %}
