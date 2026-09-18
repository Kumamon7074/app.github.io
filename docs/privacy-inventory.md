# 隐私事实与发布边界

## 声页：2026-09-18 可选上报

基于 Recorder 当前源码：Telemetry / FirebaseTelemetrySink / TelemetryLegacyMigration、TelemetrySettingsView 与 Info.plist。主应用恢复 Firebase 12.19.2 AnalyticsCore、Crashlytics；两个选择独立默认关闭，旧一体化偏好不继承；Performance 不接入，Widget 不链接。自定义事件只接受固定枚举与时长区间，实际携带中文事件和结果名称，无音频、正文、标题、标签名、搜索词、文件路径或录音 ID。

故障诊断首次开启下次启动生效，自动上传一直关闭，当前与上次会话资格都允许才发送待处理报告；SDK 本地缓存与已提交请求的撤回限制须披露。使用分析不作匿名承诺。广告 UMP、永久专业版与次数账本独立。本轮不调整 Firebase 控制台留存 / 账号或 App Store Connect 数据标签；仅更新声页中英文政策，不改其他应用正文。

核对日期：2026-09-13。计算器基于本地 5.0.0 实现；文件夹基于本地 3.0.0 实现及历史源码。功能可能晚于当前线上版本，政策按版本区分。

## 计算器

| 数据/功能 | 已核实实现 | 对应来源 |
|---|---|---|
| 算式、备注、存档 | Realm 本地保存，计算引擎本地求值；无自建记录云服务 | CalculationRecordStore、CalculatorEngine、AppDelegate |
| 设置 | UserDefaults；不提供独立 Analytics 开关 | AppSettings |
| 小组件 | 独立算式、格式、权益；本地 App Group 文件；锁屏显示默认关；文件排除备份 | QuickCalculationStore、QuickCalculationState |
| 分享 | 用户发起生成图片，可能含备注及存档信息，交给系统分享 | CalculationImageShare、CalculationImageRenderer |
| 声音 | 内置语音片段本地拼接和播放，不录音 | SoundEffectManager、VoiceAudioRenderer |
| 广告 | Google Mobile Ads 10.6.0；免费用户请求 ATT 后启动；专业版权益控制加载 | Podfile.lock、AppDelegate、ProStore |
| 分析 | Firebase Analytics 10.10.0 启动初始化，未关闭自动采集 | Podfile.lock、AppDelegate |
| 购买 | StoreKit 验证并缓存权益；付款由 Apple 处理 | ProStore、ProEntitlementReader |

不能写“完全离线 / 零数据收集 / 购买后全部统计停止”。不能声称已经实现 UMP、分析选择或远端删除按钮。第三方保留期限和跨境地点没有后台核对，不编造具体天数、地区或法律机制。

发布网页不会修复：缺失的主 App PrivacyInfo.xcprivacy、老广告/分析 SDK、UMP/分析同意流程、商店隐私数据类型、App 内政策入口。这些需要计算器工程与后台的独立变更。

## Folder

App Store ID 1563518405，bundle ID `com.macrzhou.folder`。应用工程 `/Users/macrzhou/Documents/lockalbum` 的 3.0.0 源码已核验；历史提交 `deabf2c` 保留 Google Drive、旧广告/分析初始化和订阅实现，但不能仅凭历史提交断言每个已发布 2.x 构建的确切设置。

| 数据/功能 | 3.0.0 已核实实现 | 对应来源 |
|---|---|---|
| 文件和阅读状态 | App Group 工作区直接扫描；Core Data 只存稀疏状态；不提供开发者云文件账号 | `FileSystem.swift`、`MetadataStore.swift`、`README.md` |
| Wi‑Fi 传输 | 用户主动启动的局域网 HTTP 服务，无登录；可选浏览下载，进入后台或空闲后停止 | `WiFiService.swift`、`WiFiController.swift`、`WiFiWebPage.swift` |
| 分享与备份 | 选中文件交系统分享；密码加密备份由用户保存到所选位置 | `AppServices.swift`、`BackupService.swift` |
| 广告与同意 | 免费版 Google Mobile Ads，UMP 可请求状态时启动；ATT 另行申请；专业版不加载广告 | `AppServices.swift`、`WorkspaceBrowser.swift` |
| 诊断 | Firebase Analytics/Crashlytics 依赖保留，但应用不初始化、不提供开关或事件上报；`Info.plist` 禁止采集 | `AppServices.swift`、`Info.plist` |
| 购买 | StoreKit 2 一次买断；退役订阅只用于既有权益识别 | `AppServices.swift`、`MembershipController.swift` |

旧版政策段只写能从历史代码和已发布功能说明确认的类别：Google Drive、媒体投送、月/年订阅，以及启动时的 Firebase/广告行为。OAuth 令牌实际留存、第三方后台保留期限、各版本精确 SDK 配置未经核实，不编造承诺。3.0.0 的“不启用 Firebase”不得覆盖旧版。App Store Connect 的隐私 URL、隐私标签和商品文案须在发布新版时另行核对；网页发布不等于商店后台已更新。

## 网站

保留 GitHub Pages 托管与既有搜索验证文件。删除旧主题及未使用的分析注入模板；系统字体、本地 CSS、无主动统计、无表单/账户。GitHub 托管的安全日志与开发者主动统计分开说明。

## 商店 URL

- 中文：https://apps.vanto.space/zh/app/calculator/privacy/
- 英文：https://apps.vanto.space/en/app/calculator/privacy/
- 文件夹中文：https://apps.vanto.space/zh/app/folder/privacy/
- 文件夹英文：https://apps.vanto.space/en/app/folder/privacy/

不改隐私选择 URL、不代填未核实的数据类型、不提交 App 版本审核。
