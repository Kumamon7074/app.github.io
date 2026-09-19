# 隐私事实与发布边界

## 声页：2026-09-18 当前实现

App Store ID `1241562587`，应用标识 `com.mac.zhou.artrecorder.first`。核对 Recorder 5.0.0 当前源码及文档；不假定已安装旧版自动拥有新版行为。

| 数据/功能 | 已核实实现与来源 |
|---|---|
| 录音与整理 | 本地录音库保存音频、文字时间、标签、重点、备注、剪辑和回听进度；无团队运营的录音服务器 |
| 转文字 | `TranscriptionService` / `SpeechAudioReader` 使用设备端 SpeechAnalyzer 模块；`AssetInventory` 仅下载 Apple 模型 |
| 系统保护与共享 | `PrivacyLock` 使用系统身份验证；`AppModel` / `RecordingActivityController` / `WidgetSnapshot` 共享必要状态与控制元数据，应用锁启用时隐藏内容，不共享整段音频或正文 |
| iCloud 与备份 | 专业版可选私有 CloudKit，默认关闭；仅本地录音不上传；`.shengye` 导出不加密，排除垃圾桶、未完成任务、权益和次数，导入不覆盖现有录音 |
| 可选分析与诊断 | `Telemetry.environmentAllowsReporting` 固定为 `false`，撤销旧偏好，不创建 Firebase 传输端；Analytics / Crashlytics 不启动，Performance 不接入。不能再写存在使用分析/诊断开关 |
| 广告 | `AdvertisingService` / `ExternalServicesPolicy`：AdMob 13.9.0、UMP 3.1.0，非个性化请求，不请求 ATT；仍需披露广告 SDK 自身的数据处理；专业版无横幅和激励广告 |
| 购买与次数 | Apple StoreKit 验证和恢复，应用不接收银行卡；次数与奖励凭据存本机，不经 CloudKit 或备份；永久购买不取消旧订阅 |
| 删除 | 垃圾桶默认开启、不自动清空；关闭后新删除需确认并永久删除；临时清理保留正式录音和迁移原件；外部副本单独管理 |

1.1 曾描述可选上报；后续 1.2 已统一停用。本次 1.3 保持同一数据边界，精简重复实现细节，补齐中、英、日、韩、西五语言。关闭采集不代表远端历史数据已删除。第三方保留期限、处理地域及具体请求能力未经后台确认，不作固定承诺。

2026-09-18 的全站更新将服务提供者和隐私联系人统一为 Vanto 团队 / Vanto team，邮箱为 `support@vanto.space`；当时其他应用仅调整署名、联系方式、日期和政策版本，不推断它们的数据行为随声页改变。

计算器于 2026-09-13 按本地 5.0.0 实现核对；文件匣于 2026-09-19 按本地 3.0.0 实现复核。功能可能晚于当前线上版本，政策按版本区分。

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

## 文件匣 / FileNook

App Store ID 1563518405，bundle ID `com.macrzhou.folder`。应用工程 `/Users/macrzhou/Documents/lockalbum` 的 3.0.0 源码已核验；历史提交 `deabf2c` 保留 Google Drive、旧广告/分析初始化和订阅实现，但不能仅凭历史提交断言每个已发布 2.x 构建的确切设置。

| 数据/功能 | 3.0.0 已核实实现 | 对应来源 |
|---|---|---|
| 文件和阅读状态 | App Group 工作区直接扫描；Core Data 只存稀疏状态；不提供开发者云文件账号 | `FileSystem.swift`、`MetadataStore.swift`、`README.md` |
| Wi‑Fi 传输 | 用户主动启动的局域网 HTTP 服务，无登录；可选浏览下载，进入后台或空闲后停止 | `WiFiService.swift`、`WiFiController.swift`、`WiFiWebPage.swift` |
| 分享与备份 | 选中文件交系统分享；密码加密备份由用户保存到所选位置 | `AppServices.swift`、`BackupService.swift` |
| 广告与同意 | 免费版 Google Mobile Ads，UMP 可请求状态时启动；ATT 另行申请；专业版不加载广告 | `AppServices.swift`、`WorkspaceBrowser.swift` |
| 统计与诊断 | 正式版 `AppTelemetry.start()` 默认配置 Firebase，启用 Analytics；Crashlytics 关闭自动上传，由宿主于下次启动发送符合条件的报告。首次启用时删除旧待发报告；无端内统计开关。自定义事件仅固定类别及分档，不上传文件内容、路径、识别文字、密码等；SDK 仍可能处理实例标识、设备与系统信息及自动会话数据。专业版不关闭统计 | `AppTelemetry.swift`、`WorkspaceApp.swift`、`Documentation/Telemetry.md`、`Info.plist` |
| 购买 | StoreKit 2 一次买断；退役订阅只用于既有权益识别 | `AppServices.swift`、`MembershipController.swift` |

旧版政策段只写能从历史代码和已发布功能说明确认的类别：Google Drive、媒体投送、月/年订阅，以及可能不同的 Firebase/广告行为。OAuth 令牌实际留存、第三方后台保留期限、各版本精确 SDK 配置未经核实，不编造承诺。App Store Connect 的隐私 URL、隐私标签和商品文案须在发布新版时另行核对；网页发布不等于商店后台已更新。当前应用默认启用统计不等于已满足所有发行地区的同意要求，发布前须独立核查。

## 网站

保留 GitHub Pages 托管与既有搜索验证文件。删除旧主题及未使用的分析注入模板；系统字体、本地 CSS、无主动统计、无表单/账户。GitHub 托管的安全日志与开发者主动统计分开说明。

## 商店 URL

- 中文：https://apps.vanto.space/zh/app/calculator/privacy/
- 英文：https://apps.vanto.space/en/app/calculator/privacy/
- 文件匣中文：https://apps.vanto.space/zh/app/folder/privacy/
- 文件匣英文：https://apps.vanto.space/en/app/folder/privacy/
- 声页：`https://apps.vanto.space/{zh,en,ja,ko,es}/app/shengye/privacy/`（分别为五个实际地址）

不改隐私选择 URL、不代填未核实的数据类型、不提交 App 版本审核。
