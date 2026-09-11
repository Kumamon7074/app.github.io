# 软件与隐私中心

公开站点：https://kumamon7074.github.io/app.github.io/

## 内容范围

- 超级计算器 / Smart Calculator：独立中英文隐私政策，App Store ID 1322880549。
- Folder：保留并整理软件介绍、截图、下载与联系入口。尚未核验其源码和 SDK，不发布推测性的隐私条款，也不套用计算器政策。
- 网站隐私：说明本站无主动广告/分析脚本，以及 GitHub Pages 的安全日志。
- 旧 /en/privacy/、/zh/privacy/ 保留为兼容页，明确适用软件，复用政策正文。
- 旧媒体指南与使用条款已移除，不将失效链接重定向到另一款软件。

## 单一内容源

| 文件 | 职责 |
|---|---|
| _policies/calculator-en.md、calculator-zh.md | 政策正文、版本、生效/更新日期、固定链接 |
| _data/apps.yml | 软件目录和对应语言链接 |
| _data/ui.yml、policy_sections.yml | 公共界面翻译、政策目录 |
| _layouts/、_includes/ | 页面结构；政策与旧兼容页复用同一正文 |
| assets/css/site.css | 响应式、深浅色、键盘焦点与打印样式 |

使用原有 GitHub Pages + Jekyll；发布源为 gh-pages 分支。保留 baseurl /app.github.io。正文用 Markdown，组件样式本地提供，无运行时 JavaScript、外部字体或统计 SDK。

## 修改与发布

1. 以软件实际实现为依据更新 docs/privacy-inventory.md，不把计划中的控制写成已实现。
2. 同时更新中英文正文、日期、政策版本和 CHANGELOG.md。新软件须核验数据去向后才能添加政策。
3. 使用现代 Ruby（建议 3.3+）运行 bundle install、bundle exec jekyll build 和 bundle exec ruby scripts/check_site.rb。
4. 只有获得部署授权才提交并推送 gh-pages；等待 GitHub Pages 构建成功。
5. 验证正式域名的所有政策及旧链接、语言切换、样式和 404 状态。
6. App Store Connect 的隐私网址使用软件独立地址；中文填写 /zh/app/calculator/privacy/，其他未翻译语言使用英文版并明确其语言。App 内入口也应使用相同地址。

完整 URL 必须包含 /app.github.io，不能链接到仓库根域名的 /zh/ 或 /en/。网页政策、App 隐私清单、App Store 隐私标签和实际授权流程是不同事项，需分别核对。

当前发布不新增 Folder 的数据承诺，不修改计算器 SDK、权限流程或商店隐私数据类型。计算器自身的发布修复仍见 docs/privacy-inventory.md。
