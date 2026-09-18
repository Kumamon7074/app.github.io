---
layout: policy
title: Folder Privacy Policy
app: folder
app_name: Folder
lang: en
permalink: /en/app/folder/privacy/
translation: /zh/app/folder/privacy/
sections: folder_policy_sections
updated: "2026-09-18"
policy_version: "1.2"
description: How local files, Wi-Fi transfer, ads, and purchases are handled.
---
<div class="summary-box" markdown="1">
**In brief:** Version 3.0.0 centers on local files. Content leaves your device only when you choose to share, start local-network transfer, or use a system or third-party service. The free app uses ads. The app does not activate Firebase Analytics or Crashlytics. Earlier versions may include Google Drive and different collection behavior; see below.
</div>

## 1. Scope and versions {#scope}

This policy applies to **Folder** (also displayed as **文件夹** or **資料夾**, App Store ID **1563518405**) from the Vanto team. It does not apply to other apps on this site. The 3.0.0 description is based on that version's implementation; features depend on your installed version, permissions, and purchase entitlement. See section 5 for older versions. Reading this policy does not grant tracking or diagnostic consent.

## 2. Local files and access {#local}

Version 3.0.0 reads and stores imported files and folders, PDFs, reading state, favorites, recent items, trash records, settings, and an entitlement cache on your device. The workspace scans local directories; sparse metadata records necessary state rather than indexing the file tree. The app has no developer-operated file-sync account and does not automatically upload file content to a developer server. Apple device backups may include app data depending on your settings.

The app password, recovery code, and biometrics control access; app locking is not per-file encryption. You may create a separate password-protected local backup and are responsible for keeping its file and password safe. Camera scanning, photo import, biometrics, and local-network access use system permissions when needed. Turning off the app lock does not erase files.

## 3. Transfer and sharing {#transfer}

When you start computer transfer, the app temporarily serves an HTTP page on your local network. A device on that network that knows the address can upload without signing in; enabling downloads also exposes files in the selected scope. HTTP is not encrypted. Use only a trusted private network and stop transfer when finished. The service stops in the background or after inactivity; files are not relayed through a developer server.

You initiate sharing, opening in another app, and exports. The system passes selected content to the recipient you choose, whose own privacy rules apply. Copies saved by the recipient or through the web page are not automatically deleted when you delete the original in the app.

## 4. Ads and purchases {#services}

The free version of 3.0.0 integrates Google Mobile Ads. Its SDK may process IP addresses, device or advertising identifiers, ad interactions, and diagnostics. The app uses Google UMP for applicable regional ad consent and the system ATT prompt for tracking permission. Declining tracking does not remove all ads. Ad loading stops when a Pro entitlement is recognized. See [Google Privacy Policy](https://policies.google.com/privacy) and [Google Mobile Ads data disclosure](https://developers.google.com/admob/ios/privacy/data-disclosure).

Version 3.0.0 retains Firebase Analytics and Crashlytics SDK dependencies but does not initialize Firebase, offer an anonymous diagnostics switch, or actively send analytics events or crash reports. This does not describe Google Mobile Ads' own data processing; see the ad disclosure above.

Apple StoreKit handles Pro purchase and restoration. Apple processes payment accounts, cards, and transaction records; the developer does not receive card details. Version 3.0.0 sells a one-time purchase only; retired subscriptions remain entitlement-only for existing customers. See [Apple Privacy Policy](https://www.apple.com/legal/privacy/).

## 5. Earlier versions {#legacy}

Published 2.x versions differ from 3.0.0 in features, SDK startup, and consent handling. They may offer Google Drive authorization and file access, local-network media casting, and monthly or yearly subscriptions. Google Drive operations send selected files, file metadata, and authorization information directly to Google's service; this is not the behavior of the 3.0.0 local workspace. Historical source includes Firebase configuration at launch and ad startup for free users. **The 3.0.0 no-Firebase-activation statement does not apply to older versions.** Check your installed version and its permission prompts. Contact the developer below for questions about specific older-version processing.

## 6. Retention and choices {#retention}

Local files, metadata, and settings generally remain until you remove the relevant content or app data. With the trash option enabled, removed items can be recovered in the app; when disabled, deletion is immediate. Separately manage manually created backups, shared copies, Apple device backups, and third-party service records. Uninstalling the app does not necessarily delete Apple backups, Google service records, or Apple transactions.

You can manage system permissions, ad consent, sharing, and local transfer. Depending on applicable law, you may have rights to access, correct, delete, withdraw consent, or complain. The developer cannot access or delete files that exist only on your device. Contact us about service data we can control; third-party retention depends on their settings and policies, so this page does not assert a fixed period.

## 7. Contact and updates {#contact}

Provider and privacy contact: Vanto team<br>
Email: [{{ site.contact_email }}](mailto:{{ site.contact_email }})

Include the app name and version, but do not send passwords, recovery codes, or private files. Your email and submitted information are used to handle your request and necessary follow-up. Material changes will update this page's date and version, with further notice or consent where required.
