---
layout: policy
title: Shengye Privacy Policy
app: shengye
app_name: Shengye
lang: en
permalink: /en/app/shengye/privacy/
translation: /zh/app/shengye/privacy/
sections: shengye_policy_sections
updated: "2026-09-18"
policy_version: "1.0"
description: How Shengye handles recordings, transcripts, iCloud sync, diagnostics, and earlier purchases.
---
<div class="summary-box" markdown="1">
**In brief:** Shengye focuses on local recording, listening, and organization. Audio and transcripts stay on your device by default; enabling iCloud or choosing to share sends the relevant content through those features. The current 5.0.0 implementation offers optional Pro access, a free transcription allowance, and consent-gated advertising for non-Pro users. This policy distinguishes versions rather than extending development-version behavior to every earlier release.
</div>

## 1. Scope and versions {#scope}

This policy applies to **Shengye**, also displayed as **声页 / 聲頁**, from independent developer Mac Zhou (previous project name SmartRecorder, App Store ID **1241562587**, bundle identifier `com.mac.zhou.artrecorder.first`). It does not cover the calculator or Folder apps on this site.

The description below is based on the 5.0.0 implementation as of September 18, 2026. Available features depend on your installed version. Earlier releases or development builds may include advertising, different analytics startup behavior, and purchase offers; their exact behavior is not assumed to be identical. Reading this policy does not authorize permissions, tracking, or collection.

## 2. Recordings and local storage {#local}

The app stores recorded or imported audio, titles, dates, durations, pinned state, tags, transcript text and timing, highlights and notes, clip copies, listening positions, task recovery files, and preferences locally. There is no developer-operated recording account or audio relay server. Apple device backups may include local app data, depending on your backup settings.

The app lock uses system device-owner authentication. iOS handles biometrics or your device passcode; the app does not receive biometric templates. App locking is not separate per-file audio encryption and does not revoke shared copies.

The widget shares the latest recording's title, date, and duration with the app through an on-device App Group, not full audio or transcripts. Enabling the app lock clears that display snapshot. What others can see on your Home Screen still depends on your device environment.

## 3. Transcription and permissions {#speech}

Recording requires microphone permission. Version 5.0.0 processes selected audio with Apple's on-device SpeechAnalyzer and on-device transcription modules. Some languages require an initial model download from Apple. The app does not send audio to a developer-operated recognition service. The first completed transcription can be saved automatically; when text already exists, a new candidate replaces it only after you explicitly apply it.

Recognition depends on language, device capabilities, and model availability. Import and export use system file selection or sharing; app locking uses system authentication. You can manage microphone and biometric permissions in iOS Settings. Denying a permission may prevent the associated feature without preventing management of other existing content.

## 4. iCloud and sharing {#cloud}

iCloud sync is off by default and requires Pro access. When enabled, audio, recording metadata, transcripts, highlights, tags and associations, and sync deletion markers are sent to the private CloudKit database associated with your Apple account. Recordings explicitly marked local-only, and their related private classifications, are not uploaded. Apple provides CloudKit; this is not a developer-operated storage service. See [Apple Privacy Policy](https://www.apple.com/legal/privacy/).

Turning sync off stops subsequent scheduling, but system requests already submitted may finish; existing cloud data is not automatically deleted. Synced deletions and restores require the relevant devices to connect and finish syncing. Sync is not a complete immutable backup.

You initiate original-audio, clip, TXT/Markdown note, subtitle, and portable-library-backup exports. The system passes selected content to your chosen recipient; notes may include tags you explicitly select. Recipients and other apps follow their own policies. Deleting content in the app does not automatically erase recipient copies, files saved elsewhere, or backups.

## 5. Optional diagnostics, advertising, and purchases {#services}

This implementation removes the optional Firebase Analytics, Crashlytics, and Performance SDK integrations, their event calls, and the crash-symbol upload step. An earlier diagnostics preference no longer enables these services. This does not erase data previously processed by earlier versions, and it does not mean that an advertising SDK collects no operational data.

Non-Pro users may see a banner above the recording controls, and may explicitly choose a rewarded ad to add a transcription use. The library home screen has no banner. Pro users do not receive these ad placements. Google Mobile Ads (AdMob) and User Messaging Platform (UMP) handle advertising and applicable privacy choices; the app requests non-personalized ads and does not request App Tracking Transparency permission. Where UMP requires a privacy form, ads wait for the required choice. A privacy-options entry is shown in Settings when required by UMP.

Google describes possible processing of IP addresses (including approximate location), device or app-scoped identifiers, ad interactions, usage information, crash logs, and performance information for advertising, measurement, security, and SDK operation. Non-personalized advertising is not a promise of zero collection. The app does not add recording audio, titles, transcripts, tags, or note text to ad requests. See [Google's Mobile Ads data disclosure](https://developers.google.com/admob/ios/privacy/data-disclosure), [Google Privacy Policy](https://policies.google.com/privacy), and [Google partner-site information](https://policies.google.com/technologies/partner-sites).

A device-local ledger records the free transcription allowance, task reservations, completed uses, and earned-ad receipt identifiers to avoid duplicate charges or grants. It is not a developer account, is not synced through the app's CloudKit service, and is excluded from portable library backups. If settlement fails, a saved reward receipt can be retried; if device storage cannot save either record, the app cannot guarantee recovery after termination.

Apple StoreKit handles the permanent Pro purchase, verification, restoration, and management of existing subscriptions. Earlier valid monthly, annual, semiannual, and lifetime/remove-ads purchases continue to unlock the applicable Pro access. Pro provides unlimited transcription uses, optional iCloud sync, and removal of these ads. Apple handles payment details; the developer does not receive card details. Buying permanent Pro does not automatically cancel an earlier subscription. Review renewal status in Apple's subscription settings.

Portable .shengye backups contain saved library audio and organization metadata, including text timing, tags, highlights, notes, and clip origins. They do not contain purchase entitlements, transcription credits, unfinished tasks, Recently Deleted entries, or cloud account bindings. Backups are not encrypted by the app: choose a trusted destination and protect the resulting file. Import is explicitly confirmed, skips identical content, and keeps differing versions as new recordings rather than overwriting existing ones. Selecting a cloud-backed destination in Files sends that backup to that provider.

## 6. Retention and deletion {#retention}

Ordinary deletion moves a recording to Recently Deleted, where it can be restored. Permanent deletion removes its audio and related organization state from the current library; enabled sync handles the corresponding deletion. Transcript checkpoints support resuming transcription. There is no separate cross-launch recovery workflow for unfinished recordings. Legacy files retained from earlier builds are not silently reimported or removed by temporary-export cleanup.

Sharing, trimming, and sync may generate temporary copies protected while in use. Normal sharing completion has a short grace period. Unused copies from abnormal exits may be reclaimed during later startup or manual cleanup. Storage cleanup only handles unused temporary exports, not saved recordings, retained legacy audio, or legacy migration backups.

Upgrades preserve legacy database and original-audio migration sources. Deleting an item permanently from the current library therefore does not prove that legacy backups, Apple backups, not-yet-synced cloud copies, or exports were also erased. Manage each location separately. Uninstalling the app does not necessarily erase Apple backups, CloudKit data, or purchase records.

## 7. Your choices {#choices}

You can manage device permissions, app locking, iCloud sync, local-only recordings, sharing recipients, and local or cloud deletion. Applicable law may provide rights to access, correct, delete, withdraw consent, or complain. The developer cannot remotely read or delete files stored only on your device. Contact us to assess requests concerning service data the developer can control.

Third-party retention, processing locations, and request procedures depend on their policies and account settings; this policy does not invent fixed retention periods or unverified international-transfer guarantees. GitHub Pages processing for this website is described in the [website privacy notice](/en/site-privacy/).

## 8. Contact and updates {#contact}

Provider and privacy contact: Mac Zhou, independent developer<br>
Email: [death7074@gmail.com](mailto:death7074@gmail.com)

Include the app name and version, but do not send private audio, transcripts, passwords, or payment details. Your email and voluntarily supplied information are used to handle the request and necessary follow-up. Material changes update this page's date and version, with further notice or consent as required. Publishing this page does not automatically update App Store privacy labels or earlier installed builds.
