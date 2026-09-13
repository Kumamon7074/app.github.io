---
title: Software privacy policies
lang: en
translation: /zh/privacy/
---
<header class="page-heading">
  <p class="eyebrow">PRIVACY DIRECTORY</p>
  <h1>Choose your app.</h1>
  <p class="lede">This address is shared by older app links. The policy below applies only to Smart Calculator.</p>
</header>
{% include app-directory.html %}
<div class="prose">
  <p>For the other app, read the <a href="{{ '/en/app/folder/privacy/' | relative_url }}">Folder privacy policy</a>. The calculator policy below does not apply to it.</p>
</div>
{% assign policies = site.policies | where: "lang", "en" | where: "app", "calculator" %}
{% for policy in policies %}
<section class="legacy-policy">
  <h2>{{ policy.app_name }} · Privacy policy</h2>
  <p class="version-note">Effective & updated: {{ policy.updated }} · Policy {{ policy.policy_version }} · <a href="{{ policy.url | relative_url }}">Open the app-specific policy</a></p>
  <article class="prose">{{ policy.content | markdownify }}</article>
</section>
{% endfor %}
