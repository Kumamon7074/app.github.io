---
layout: policy
title: 文件匣隐私政策
app: folder
app_name: 文件匣 / FileNook
lang: zh
permalink: /zh/app/folder/privacy/
translation_group: folder-privacy
sections: folder_policy_sections
updated: "2026-09-19"
policy_version: "1.3"
description: 文件匣如何处理本地文件、使用统计、广告与购买。
---
<div class="summary-box" markdown="1">
**简要说明**：文件内容主要在本机处理，不会自动上传到开发者的文件服务器。3.0.0 正式版默认向 Firebase 发送使用统计与崩溃报告；免费版使用 Google 广告。专业版移除广告，但不关闭统计与诊断。
</div>

## 1. 适用范围 {#scope}

本政策适用于 Vanto 团队的**文件匣**（FileNook，旧名“文件夹 / Folder”，App Store ID **1563518405**），不适用于本站其他应用。下文 3.0.0 的说明依据当前实现；你实际安装的版本可能不同。

## 2. 本地文件与访问 {#local}

导入的文件、扫描与转换结果、阅读进度、收藏、垃圾桶、设置及必要的文件状态保存在设备上。应用没有开发者运营的文件同步账号，不会自动上传文件正文、照片、音视频、OCR 结果或密码。设备备份是否包含应用数据取决于你的系统设置。

相机、照片、系统文件、生物识别和本地网络仅在使用相应功能时访问。应用锁用于限制进入应用，不等于逐文件加密；你可自行创建加密备份并保管密码。

## 3. 传输与分享 {#transfer}

你开启“从电脑传文件”后，同一局域网内知道地址的设备可通过**未加密的 HTTP** 上传；启用下载时，还可访问所选范围内的文件。请只在可信网络使用，用毕关闭。文件不经开发者服务器中转。

你主动分享、导出或用其他应用打开文件时，所选内容会交给接收方；其保存的副本与处理方式由该服务负责，删除应用内原件不会删除外部副本。

## 4. 统计、广告与购买 {#services}

3.0.0 正式版默认启用 Firebase Analytics，并在下次启动发送符合条件的 Crashlytics 崩溃报告，用于了解功能使用和排查故障。自定义事件仅记录固定操作类别、结果、耗时及数量／体积分档，**不发送文件内容、文件名、路径、搜索词、识别文字、字幕或密码**。Firebase SDK 仍可能处理应用实例标识、设备与系统信息及自动会话数据；应用不设置用户 ID，端内没有统计关闭开关。参见 [Firebase 隐私说明](https://firebase.google.com/support/privacy)。

免费版使用 Google Mobile Ads（横幅及激励广告）。广告 SDK 可能处理 IP 地址、设备或广告标识符、广告互动与诊断信息。适用地区先通过 Google UMP 处理广告同意，系统 ATT 权限另行请求；拒绝跟踪不等于不显示广告。识别专业版权益后不加载广告，但统计与诊断仍按上文运行。参见 [Google 隐私政策](https://policies.google.com/privacy)及 [Mobile Ads 数据披露](https://developers.google.com/admob/ios/privacy/data-disclosure)。

专业版的一次买断及恢复购买由 Apple StoreKit 处理；开发者不接收银行卡资料。参见 [Apple 隐私政策](https://www.apple.com/legal/privacy/)。

## 5. 旧版本差异 {#legacy}

旧版可能提供 Google Drive、媒体投送及月／年订阅，其授权、广告和 Firebase 启动方式也可能不同。Google Drive 操作会把你选择的数据交给 Google。上述 3.0.0 行为不能作为旧版保证；请以安装版本及其权限提示为准。

## 6. 保存、删除与选择 {#retention}

本地数据通常保留到你删除内容或应用数据；开启垃圾桶时可在应用内恢复已删除项目。手动备份、系统备份、已分享副本、广告／Firebase 数据及 Apple 交易记录须分别在相应位置管理，卸载应用不一定清除这些副本。

你可管理系统权限、广告同意、分享和局域网传输；当前没有端内统计关闭开关。对于仅在设备上的文件，开发者无法代为读取或删除。其他数据的访问、删除或撤回请求可按适用法律联系我们；第三方数据的保存期限依其政策而定。

## 7. 联系与更新 {#contact}

服务与隐私联系人：Vanto 团队 · [{{ site.contact_email }}](mailto:{{ site.contact_email }})。请注明应用版本，不要发送密码或私人文件。来信仅用于处理请求及必要沟通。数据处理发生重要变化时，我们会更新本页并按适用要求另行通知或取得同意。
