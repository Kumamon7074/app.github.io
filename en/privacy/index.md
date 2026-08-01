---
title: Vanto Privacy Policy
description: How Vanto handles and protects your data
---

**Effective date: August 1, 2026**<br>
**Last updated: August 1, 2026**

Vanto is a personal media player provided by independent developer Mac Zhou. This policy explains how Vanto handles data on iPhone, iPad, Apple TV, and Mac, and the choices available to you.

Vanto does not provide media content or operate a cloud media server that receives your media files. Your local media files, media contents, full file paths, and media server passwords are not sent to the Vanto developer.

## 1. Data handled by Vanto

### 1.1 Data stored only on your device

To provide media browsing, playback, downloads, and preferences, Vanto stores the following on your device:

- Local media indexes, metadata, artwork caches, and playback preferences;
- Configuration for media sources you add;
- Offline downloads, external subtitles, and app-managed imported files;
- Playback progress, favorites, and watched status for Local sources;
- Access Lock settings. The Apple TV Access Lock PIN is stored only in the local Keychain.

Passwords, tokens, and other sensitive credentials for media servers and remote file sources are stored in the system Keychain and are used only to connect to services you configure.

### 1.2 Optional usage analytics

Vanto sends limited product usage data through Google Firebase Analytics only after you enable “Share Usage Analytics.” This may include:

- App version, device platform, and operating system version;
- Categorized results and duration buckets for sources, pages, or features;
- Aggregated buckets for playback, buffering, seeking, and downloads.

These events do not contain media titles, person names, file paths, server addresses, URLs, accounts, credentials, or raw error contents. Vanto does not use this data for advertising, user profiling, or cross-app tracking.

### 1.3 Optional crash diagnostics

Vanto sends crash diagnostics through Google Firebase Crashlytics only after you enable “Share Crash Diagnostics.” Reports may contain crash stacks, app and system versions, device type, runtime state, and restricted diagnostic categories. Vanto does not attach media titles, paths, server addresses, accounts, or credentials.

Turning this option off immediately stops Vanto from actively recording new non-fatal diagnostics. A Firebase change to automatic crash collection may take full effect on the next app launch. Reports already sent cannot be withdrawn from the device.

### 1.4 Private iCloud data

When you have the applicable Vanto Pro entitlement and enable remote-file user-state sync, Vanto uses your private Apple CloudKit database to sync playback progress, watched status, and favorites for SMB, WebDAV, and SFTP items.

Sync records contain only a digest derived from stable source and object facts, content revision and length, plus necessary numeric state. Vanto does not upload media titles, full paths, server addresses, usernames, passwords, tokens, or media files. The data remains in the private CloudKit container associated with your Apple Account.

### 1.5 Purchase information

Vanto uses Apple StoreKit for Vanto Pro purchases, purchase restoration, subscription status, and Family Sharing entitlements. Apple processes payment accounts, card information, and billing details. The Vanto developer does not receive those payment details.

## 2. Services you configure

Vanto can connect directly from your device to:

- Emby, Jellyfin, and Plex;
- SMB, WebDAV, and SFTP;
- Metadata or subtitle services such as TMDB, TVDB, and OpenSubtitles;
- Apple CloudKit, StoreKit, Firebase, and system media services.

Requests to these services may contain credentials, media identifiers, search terms, network addresses, or device network information required for the selected service to work. Requests travel directly from your device to the relevant service and do not pass through a Vanto-operated server. Each third party handles data under its own privacy policy and its relationship with you.

## 3. Why data is handled

Vanto handles data only to:

- Connect to, browse, and play media sources you choose;
- Save preferences, playback state, favorites, and offline content;
- Sync selected state across devices when you enable that feature;
- Verify and restore Vanto Pro entitlements;
- Analyze reliability and diagnose crashes after you authorize collection;
- Meet legal obligations and protect the app and its users.

## 4. Data sharing

Vanto does not sell or rent data and does not provide data to advertisers. Data is handled by Apple, Google Firebase, or services you configure only when necessary for the purposes above, or disclosed when legally required by a competent authority.

## 5. Retention and deletion

- Local settings, indexes, and caches remain until you delete them in the app, disconnect the source, clear the applicable data, or uninstall Vanto;
- Keychain credentials remain until you remove the source or Vanto clears stale credentials after a fresh installation;
- Offline files and imported copies remain until you delete them;
- Private CloudKit state remains until you disable sync and delete the relevant data, remove the Apple Account data, or delete the associated source state;
- Firebase data is collected only after authorization and retained under Vanto’s Firebase configuration and the applicable Google Firebase terms for no longer than needed for analytics or diagnostics.

You can disable usage analytics or crash diagnostics at any time under “Settings → Legal & Privacy.” You can also remove sources, clear caches and downloads, or disable remote-file user-state sync.

## 6. Your rights

Depending on applicable law, you may have the right to:

- Learn about, access, correct, or delete data concerning you;
- Withdraw permission for optional analytics and diagnostics;
- Restrict or object to certain processing;
- Request a portable copy of applicable data;
- Complain to your local data protection authority.

Vanto does not create a separate Vanto user account. Connecting a third-party media service does not create an account with the Vanto developer. To request access to or deletion of data controlled by the Vanto developer, contact the email address below. Reasonable verification may be required to avoid disclosing data to the wrong person.

## 7. Children’s privacy

Vanto is intended for general users who manage personal media sources and is not directed specifically to children. Vanto does not knowingly ask children to provide personal information to the developer. A parent or guardian who believes a child provided personal information may contact us to request appropriate action.

## 8. Security

Vanto uses the system Keychain, source identity isolation, and encrypted connections when supported by the selected service. No network transmission or electronic storage method is completely secure. You remain responsible for protecting your media servers, network, Apple Account, and third-party service credentials.

## 9. International processing

Apple, Google Firebase, or services you choose may process data outside your country or region. Vanto limits this processing through data minimization, user choice, and the applicable service terms, and uses appropriate safeguards where required by law.

## 10. Changes to this policy

If data categories, purposes, or third-party services change materially, Vanto will update this page and its effective date and obtain a new choice where required by law. Continued use does not constitute consent to new optional data collection.

## 11. Contact

Data controller: Mac Zhou (independent developer)<br>
Email: [death7074@gmail.com](mailto:death7074@gmail.com)

Contact the address above for access, deletion, consent withdrawal, or questions about this policy.

---

[中文版]({{ '/zh/privacy/' | relative_url }}) · [Apple Standard Terms of Use](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/)
