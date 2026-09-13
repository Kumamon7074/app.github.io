# 软件与隐私中心

公开站点：https://apps.vanto.space/

## 内容范围

- 超级计算器 / Smart Calculator：独立中英文隐私政策，App Store ID 1322880549。
- 文件夹 / Folder：独立中英文隐私政策、使用条款、版本说明与支持，App Store ID 1563518405。区分已发布 2.x 与开发中的 3.0.0；不把新版的默认诊断设置归于旧版。
- 网站隐私：说明本站无主动广告/分析脚本，以及 GitHub Pages 的安全日志。
- 旧 /en/privacy/、/zh/privacy/ 保留为兼容页，明确适用软件，复用政策正文。
- 旧媒体指南与通用使用条款已移除；新的使用条款只放在本应用路径下，不将旧链接重定向到另一款软件。

## 单一内容源

| 文件 | 职责 |
|---|---|
| _policies/ | 各应用独立政策与条款正文、版本、日期、固定链接 |
| _data/apps.yml | 软件目录和对应语言链接 |
| _data/ui.yml、*_sections.yml | 公共界面翻译、各文档目录 |
| _layouts/、_includes/ | 页面结构；政策与旧兼容页复用同一正文 |
| assets/css/site.css | 响应式、深浅色、键盘焦点与打印样式 |

使用原有 GitHub Pages + Jekyll；发布源为 gh-pages 分支。自定义域名为 apps.vanto.space，baseurl 为空。正文用 Markdown，组件样式本地提供，无运行时 JavaScript、外部字体或统计 SDK。

## 修改与发布

1. 以软件实际实现为依据更新 docs/privacy-inventory.md，不把计划中的控制写成已实现。
2. 同时更新中英文正文、日期、政策版本和 CHANGELOG.md。版本功能变更先核对源码和线上版本，避免混写。
3. 使用现代 Ruby（建议 3.3+）运行 bundle install、bundle exec jekyll build 和 bundle exec ruby scripts/check_site.rb。
4. 只有获得部署授权才提交并推送 gh-pages；等待 GitHub Pages 构建成功。
5. 验证正式域名的所有政策及旧链接、语言切换、样式和 404 状态。
6. App Store Connect 的隐私网址使用相应软件的独立地址；未翻译语言回退英文版。App 内入口应指向同一地址。

正式 URL 不包含 /app.github.io。旧 GitHub Pages 项目地址由 GitHub 转向自定义域名，发布后需验证深层链接。网页政策、App 隐私清单、App Store 隐私标签和实际授权流程是不同事项，需分别核对。

## 域名配置

- 腾讯云 DNSPod：只新增 `apps` 的 CNAME，指向 `kumamon7074.github.io`，默认线路，TTL 600；不修改根域名、www、邮件或 API 解析。
- GitHub Pages：Custom domain 与仓库 `CNAME` 均为 `apps.vanto.space`；HTTPS 证书就绪后启用 Enforce HTTPS。
- `_config.yml` 的 `url` 与 CNAME 保持一致；站内链接使用 `relative_url`，canonical / hreflang / sitemap 使用 `absolute_url`，不单独硬编码域名。
- 更换商店地址前，确认正式 HTTPS 地址、中文/英文切换、CSS 和旧地址跳转正常。网页发布不会自动修改商店后台配置。

当前发布不修改计算器 SDK、权限流程或商店隐私数据类型。计算器自身的发布修复仍见 docs/privacy-inventory.md。
