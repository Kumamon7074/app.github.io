# Vanto 软件与隐私中心

公开站点：https://apps.vanto.space/

服务与隐私联系：Vanto 团队 · [support@vanto.space](mailto:support@vanto.space)。全站联系方式由 `_config.yml` 的 `contact_email` 统一提供。

## 内容范围

- 超级计算器 / Smart Calculator：独立中英文隐私政策，App Store ID 1322880549。
- 文件匣 / FileNook（旧名文件夹 / Folder）：独立中英文隐私政策、使用条款、版本说明与支持，App Store ID 1563518405。区分已发布旧版与 3.0.0；3.0.0 正式版默认启用 Firebase 统计与崩溃诊断，免费版使用 Google 广告。
- 声页 / Shengye：中文、英文、日语、韩语、西班牙语隐私政策，App Store ID 1241562587。当前政策 1.3 按 5.0.0 实现精简说明本地录音、设备端转文字、可选 iCloud、广告、购买与删除；不将新版停用分析的状态套用于旧版。
- 网站隐私：说明本站无主动广告/分析脚本，以及 GitHub Pages 的安全日志。
- 旧 /en/privacy/、/zh/privacy/ 保留为兼容页，明确适用软件，复用政策正文。
- 旧媒体指南与通用使用条款已移除；新的使用条款只放在本应用路径下，不将旧链接重定向到另一款软件。

## 单一内容源

| 文件 | 职责 |
|---|---|
| _policies/ | 各应用独立政策与条款正文、版本、日期、固定链接 |
| _data/apps.yml | 软件目录和对应语言链接 |
| _data/ui.yml、*_sections.yml | 公共界面翻译、各文档目录 |
| _data/translations.yml | 多语言文档地址、语言菜单与 hreflang 的单一来源 |
| _layouts/、_includes/ | 页面结构；政策与旧兼容页复用同一正文 |
| assets/css/site.css | 响应式、深浅色、键盘焦点与打印样式 |

使用原有 GitHub Pages + Jekyll；发布源为 gh-pages 分支。自定义域名为 apps.vanto.space，baseurl 为空。正文用 Markdown，组件样式本地提供，无运行时 JavaScript、外部字体或统计 SDK。

## 修改与发布

1. 以软件实际实现为依据更新 docs/privacy-inventory.md，不把计划中的控制写成已实现。
2. 同时更新文档全部已支持语言的正文、日期、政策版本和 CHANGELOG.md。版本功能变更先核对源码和线上版本，避免混写。
3. 使用现代 Ruby（建议 3.3+）运行 bundle install、bundle exec jekyll build 和 bundle exec ruby scripts/check_site.rb。
4. 只有获得部署授权才提交并推送 gh-pages；等待 GitHub Pages 构建成功。
5. 验证正式域名的政策及旧链接、语言切换和 404 状态。默认不生成布局预览或执行布局检查。
6. App Store Connect 的隐私网址使用相应软件的独立地址；未翻译语言回退英文版。App 内入口应指向同一地址。

正式 URL 不包含 /app.github.io。旧 GitHub Pages 项目地址由 GitHub 转向自定义域名，发布后需验证深层链接。网页政策、App 隐私清单、App Store 隐私标签和实际授权流程是不同事项，需分别核对。

## 域名配置

- 腾讯云 DNSPod：只新增 `apps` 的 CNAME，指向 `kumamon7074.github.io`，默认线路，TTL 600；不修改根域名、www、邮件或 API 解析。
- GitHub Pages：Custom domain 与仓库 `CNAME` 均为 `apps.vanto.space`；HTTPS 证书就绪后启用 Enforce HTTPS。
- `_config.yml` 的 `url` 与 CNAME 保持一致；站内链接使用 `relative_url`，canonical / hreflang / sitemap 使用 `absolute_url`，不单独硬编码域名。
- 更换商店地址前，确认正式 HTTPS 地址、中文/英文切换、CSS 和旧地址跳转正常。网页发布不会自动修改商店后台配置。

当前发布不修改计算器 SDK、权限流程或商店隐私数据类型。计算器自身的发布修复仍见 docs/privacy-inventory.md。

## 声页多语言地址

- [中文](https://apps.vanto.space/zh/app/shengye/privacy/)
- [English](https://apps.vanto.space/en/app/shengye/privacy/)
- [日本語](https://apps.vanto.space/ja/app/shengye/privacy/)
- [한국어](https://apps.vanto.space/ko/app/shengye/privacy/)
- [Español](https://apps.vanto.space/es/app/shengye/privacy/)

五种语言相互切换时始终留在声页政策；页面的标题、目录和公共导航同步翻译。日/韩/西页面链接到尚未翻译的总目录和网站隐私时，明确标注“英语”，不伪造本地化入口。其他应用继续保留既有中英文切换及固定 URL。

本次仅更新政策站点，不改 App 客户端的语言路由、商店后台或第三方数据设置。检查脚本覆盖 20 页、全站署名和邮箱、旧政策正文复用、五语言一致版本与日期、内链与目录、双向 hreflang 和 sitemap。
