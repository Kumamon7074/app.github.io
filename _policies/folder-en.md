---
layout: policy
title: FileNook Privacy Policy
app: folder
app_name: FileNook
lang: en
permalink: /en/app/folder/privacy/
translation_group: folder-privacy
sections: folder_policy_sections
updated: "2026-09-19"
policy_version: "1.3"
description: How FileNook handles local files, analytics, ads, and purchases.
---
<div class="summary-box" markdown="1">
**In brief:** File content is mainly processed on your device and is not automatically uploaded to a developer file server. The 3.0.0 release sends usage analytics and crash reports to Firebase by default. The free version shows Google ads. Pro removes ads, not analytics or diagnostics.
</div>

## 1. Scope and versions {#scope}

This policy applies to **FileNook** (formerly “Folder” / “文件夹”, App Store ID **1563518405**) from the Vanto team, not to other apps on this site. The 3.0.0 description reflects the current implementation; your installed version may differ.

## 2. Local files and access {#local}

Imported files, scans and converted results, reading progress, favorites, trash, settings, and necessary file state are stored on your device. The app has no developer-operated file-sync account and does not automatically upload file content, photos, media, OCR results, or passwords. Your system settings determine whether device backups include app data.

Camera, photos, system files, biometrics, and local-network access are used when you invoke the relevant feature. The app lock restricts access to the app; it is not per-file encryption. You can create an encrypted backup and keep its password safe.

## 3. Transfer and sharing {#transfer}

When you start computer transfer, a device on the same network that knows the address can upload via **unencrypted HTTP**. If you enable downloads, it can also access files within the selected scope. Use a trusted network and stop transfer when finished. Files are not relayed through a developer server.

When you choose to share, export, or open a file in another app, the selected content goes to that recipient. Its copies and practices are governed by that service; deleting the original in FileNook does not delete external copies.

## 4. Analytics, ads, and purchases {#services}

The 3.0.0 release enables Firebase Analytics by default and sends eligible Crashlytics crash reports on the next launch to understand feature use and diagnose failures. Custom events contain only fixed action and result categories, duration, and count or size bands—**not file content, names, paths, search terms, recognized text, subtitles, or passwords**. The Firebase SDK may still process app instance identifiers, device and system information, and automatic session data. The app does not set a user ID or offer an in-app analytics switch. See [Firebase privacy information](https://firebase.google.com/support/privacy).

The free version uses Google Mobile Ads (banners and rewarded ads). The ad SDK may process IP addresses, device or advertising identifiers, ad interactions, and diagnostics. Google UMP handles applicable regional ad consent; the system ATT request is separate. Declining tracking does not necessarily remove ads. Ads stop after a Pro entitlement is recognized, but analytics and diagnostics continue as described above. See the [Google Privacy Policy](https://policies.google.com/privacy) and [Mobile Ads data disclosure](https://developers.google.com/admob/ios/privacy/data-disclosure).

Apple StoreKit handles the one-time Pro purchase and restoration. The developer does not receive your payment-card details. See the [Apple Privacy Policy](https://www.apple.com/legal/privacy/).

## 5. Earlier versions {#legacy}

Older versions may include Google Drive, casting, and monthly or yearly subscriptions, with different authorization, ad, and Firebase startup behavior. Google Drive operations pass data you select to Google. Do not assume the 3.0.0 behavior applies to an older build; check your installed version and permission prompts.

## 6. Retention and choices {#retention}

Local data generally remains until you remove it or the app data; items in an enabled trash can be restored in the app. Manage manual and device backups, shared copies, ad and Firebase data, and Apple transactions separately. Uninstalling the app does not necessarily remove those copies.

You can manage system permissions, ad consent, sharing, and local transfer. There is currently no in-app analytics switch. The developer cannot access or delete files held only on your device. Contact us about access, deletion, or withdrawal requests where applicable; third-party retention follows their own policies.

## 7. Contact and updates {#contact}

Provider and privacy contact: Vanto team · [{{ site.contact_email }}](mailto:{{ site.contact_email }}). Include the app version, but do not send passwords or private files. We use your message only to handle your request and necessary follow-up. We will update this page for material changes and provide further notice or seek consent where required.
