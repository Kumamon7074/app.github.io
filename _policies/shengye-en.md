---
layout: policy
title: Shengye Privacy Policy
app: shengye
app_name: Shengye
lang: en
permalink: /en/app/shengye/privacy/
translation_group: shengye-privacy
sections: shengye_policy_sections
updated: "2026-09-18"
policy_version: "1.3"
description: How Shengye handles recordings, transcription, sync, ads, and deletion.
---
<div class="summary-box" markdown="1">
**In brief:** Recordings and text stay on your device by default. Transcription runs on-device. You choose whether to enable iCloud or share content. Non-Pro users receive ads. We do not operate a recording-content server.
</div>

## 1. Scope {#scope}

This policy covers **Shengye / 声页 / 聲頁**, provided by the Vanto team (App Store ID **1241562587**, app identifier `com.mac.zhou.artrecorder.first`), based on the current 5.0.0 implementation. Earlier versions may differ in advertising, analytics, and purchases. Disabling a service now does not erase data sent previously. Reading this policy does not grant consent or system permissions.

## 2. Local data and protection {#local}

- **Recording data:** Audio, titles, dates, durations, tags, text and timing, highlights, notes, clips, listening positions, and task progress are stored locally, along with preferences and purchase entitlements.
- **App lock:** iOS verifies biometrics or your device passcode. The app does not receive biometric templates. The lock controls access; it is not per-file encryption.
- **Widgets and Live Activities:** On-device shared storage or system activities display recording and playback status. Control identifiers, timing, and highlight-segment information are shared, not full audio or transcripts. Enabling the app lock hides the relevant content; unprotected screen information may be visible to others.

## 3. Transcription and permissions {#speech}

Recording requires microphone permission. Transcription uses Apple's on-device speech recognition; some languages need an initial model download from Apple. The app does not upload audio to a recognition server operated by us. Results depend on language, device, and model availability.

Import and export use system file-selection and sharing features. Manage microphone and biometric permissions in iOS Settings; denying them affects the related features.

## 4. Sync, sharing, and backups {#cloud}

**iCloud sync is off by default and requires Pro.** When enabled, recording data, including audio, text, tags, highlights, and deletion markers, syncs to your Apple account's private CloudKit database. Local-only recordings are not uploaded. Turning sync off does not clear existing cloud data; requests already submitted may finish. Deletions and restores require devices to connect and finish syncing. See [Apple Privacy Policy](https://www.apple.com/legal/privacy/).

When you export audio, text, subtitles, or backups, content goes to your chosen recipient or storage service. **.shengye backups are not encrypted.** They include saved recordings and their organization data, but exclude Trash, unfinished tasks, purchase entitlements, and transcription credits. Import requires confirmation and does not overwrite existing recordings. Keep backup files safe.

Apple device backups may also include app data, depending on system settings. Deleting content in the app does not recall shared or separately backed-up copies.

## 5. Ads, purchases, and analytics {#services}

- **Ads:** Non-Pro users see banners on the recording screen and can choose rewarded ads for transcription credits. Pro removes both placements. Google AdMob provides ads; UMP handles applicable regional privacy choices. Ads wait for required choices, and Settings shows privacy options when required. The app requests non-personalized ads and does not request ATT tracking permission.
- **Ad data:** Google's SDK may process IP addresses and inferred approximate location, device or app identifiers, ad and app interactions, and crash and performance information for advertising, measurement, security, and operation. Non-personalized does not mean no collection. The app does not add audio, recording titles, transcripts, tags, or notes to ad requests. See [Google's data disclosure](https://developers.google.com/admob/ios/privacy/data-disclosure) and [Google Privacy Policy](https://policies.google.com/privacy).
- **Purchases and credits:** Apple StoreKit handles Pro purchases and restoration; we do not receive card details. The app stores verified entitlements. Transcription balances, task reservations, and ad-reward receipts stay locally and are excluded from library backups and iCloud sync. Valid earlier purchases remain recognized. Buying lifetime Pro does not cancel an older subscription.
- **Optional analytics and diagnostics:** The current version disables app usage analytics and crash diagnostics, revokes earlier opt-ins, does not start Firebase Analytics or Crashlytics, and does not integrate Performance. The advertising SDK's own processing remains separate.

## 6. Retention and deletion {#retention}

Local data generally remains until you delete the content or app data. **Trash is enabled by default and never empties automatically.** Items can be restored. Turning Trash off makes new deletions permanent after confirmation, without clearing existing Trash items. With sync enabled, deletion must also finish syncing.

Storage cleanup removes unused temporary files, not saved recordings or original files retained from an earlier version. Manage migration backups, exports, device backups, cloud copies, and Apple transaction records separately. Deleting or uninstalling the app does not guarantee their removal.

## 7. Choices and rights {#choices}

You control permissions, app locking, sync, ad privacy choices, sharing, and deletion. Depending on applicable law, you may have rights to access, correct, delete, obtain a copy, withdraw consent, or complain. Contact us below. We cannot remotely read or delete data stored only on your device.

Third-party services may process data outside your region; retention and processing follow their policies and applicable law. Protect your device, Apple account, and backups; no storage or transmission is completely secure. Visits to this page are covered by our [website privacy notice]({{ '/en/site-privacy/' | relative_url }}).

## 8. Contact and updates {#contact}

**Provider and privacy contact: Vanto team**<br>
Email: [{{ site.contact_email }}](mailto:{{ site.contact_email }})

We use your email address and submitted information only to handle your request, follow up as needed, and meet applicable obligations, retaining it as necessary for those purposes. Include the app version, not private recordings, transcripts, passwords, or payment details. Material changes update this page's date and version, with notice or consent where required.
