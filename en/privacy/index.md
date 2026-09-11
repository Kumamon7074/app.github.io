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
  <p>For Folder privacy questions, <a href="mailto:{{ site.contact_email }}?subject=Folder%20privacy">contact the developer</a>. The calculator policy is not a Folder policy.</p>
</div>
{% assign policies = site.policies | where: "lang", "en" %}
{% for policy in policies %}
<section class="legacy-policy">
  <h2>{{ policy.app_name }} · Privacy policy</h2>
  <p class="version-note">Effective & updated: {{ policy.updated }} · Policy {{ policy.policy_version }} · <a href="{{ policy.url | relative_url }}">Open the app-specific policy</a></p>
  <article class="prose">{{ policy.content | markdownify }}</article>
</section>
{% endfor %}
