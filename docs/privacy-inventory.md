# 隐私事实与发布边界

核对日期：2026-09-11。计算器基于本地 5.0.0 实现；功能可能晚于当前线上版本。政策不承诺旧版本拥有新增功能。

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

仅核实原仓库公开介绍：Google Drive 文件管理、媒体播放、照片上传、访问锁、分享。App Store ID 1563518405。未取得源码；OAuth scopes、令牌存储、文件传输路径、广告/分析 SDK、删除方式均未验证。

当前只提供产品资料和联系入口，不发布未经核验的 Folder 政策。若其线上版本/OAuth 仍引用旧公共政策地址，需在核实 Folder 实现并发布专用政策后更新，不能改为计算器地址。

## 网站

保留 GitHub Pages 托管与既有搜索验证文件。删除旧主题及未使用的分析注入模板；系统字体、本地 CSS、无主动统计、无表单/账户。GitHub 托管的安全日志与开发者主动统计分开说明。

## 商店 URL

- 中文：https://kumamon7074.github.io/app.github.io/zh/app/calculator/privacy/
- 英文：https://kumamon7074.github.io/app.github.io/en/app/calculator/privacy/

只修改计算器隐私政策 URL；不改隐私选择 URL、不代填未核实的数据类型、不提交 App 版本审核。
