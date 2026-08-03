---
title: Vanto 媒体整理指南
description: 兼容 Vanto、Jellyfin 与 Kodi 的电影、剧集、NFO、图片和外挂字幕整理方式
---

本指南适用于 Vanto 的 SMB 与 WebDAV 文件来源。目标不是覆盖每个软件的全部扩展，而是提供一套可同时被 Vanto、Jellyfin 与 Kodi 稳定识别的保守结构。

## 快速规则

- 电影使用 `片名 (年份)` 文件夹，并让视频、NFO 与字幕使用相同主文件名。
- 剧集使用 `剧名 (年份)/Season 01/剧名 - S01E01`。
- NFO 不是扫描或播放的前置条件；没有 NFO 时，Vanto 会从目录名和文件名建立媒体结构。
- 图片与对应媒体放在约定目录。只有缺少可用图片时，Vanto 才会生成视频帧封面。
- 修改 NFO、图片或字幕后，在 Vanto 首页刷新当前来源。

## 无 NFO 的最小结构

```text
Media/
├── Movies/
│   └── Arrival (2016)/
│       └── Arrival (2016).mkv
└── TV Shows/
    └── Example Show (2026)/
        ├── Season 01/
        │   ├── Example Show - S01E01.mkv
        │   └── Example Show - S01E02.mkv
        └── Season 02/
            └── Example Show - S02E01.mkv
```

一个电影目录只保留一个主视频版本。花絮建议放入 `Extras` 子目录，避免被识别成正片。

## 完整电影示例

```text
Movies/
└── Arrival (2016)/
    ├── Arrival (2016).mkv
    ├── Arrival (2016).nfo
    ├── poster.jpg
    ├── fanart.jpg
    └── Arrival (2016).zh-Hans.forced.srt
```

电影优先使用与视频同名的 NFO。Vanto 也能读取已有的 `movie.nfo`，但新建文件建议使用同名方式，以便多个视频版本保持归属清晰。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<movie>
  <title>降临</title>
  <originaltitle>Arrival</originaltitle>
  <year>2016</year>
  <plot>影片简介</plot>
  <genre>科幻</genre>
  <rating>7.9</rating>
  <uniqueid type="tmdb" default="true">329865</uniqueid>
  <actor>
    <name>Amy Adams</name>
    <role>Louise Banks</role>
    <thumb>amy-adams.jpg</thumb>
  </actor>
</movie>
```

## 完整剧集示例

```text
TV Shows/
└── Example Show (2026)/
    ├── tvshow.nfo
    ├── poster.jpg
    ├── fanart.jpg
    ├── season01-poster.jpg
    ├── season01-fanart.jpg
    └── Season 01/
        ├── season.nfo
        ├── poster.jpg
        ├── fanart.jpg
        ├── Example Show - S01E01.mkv
        ├── Example Show - S01E01.nfo
        ├── Example Show - S01E01-thumb.jpg
        └── Example Show - S01E01.zh-Hans.forced.ass
```

这里同时保留两种季约定：

- Jellyfin 与 Vanto 可读取季目录内的 `season.nfo`、`poster.jpg` 和 `fanart.jpg`。
- Kodi 的季名称与简介写在剧根目录的 `tvshow.nfo`，季图片放在剧根目录并命名为 `season01-poster.jpg`、`season01-fanart.jpg`。Kodi 不依赖 `season.nfo`。

为同时兼容三者，建议保留两套季文件；它们描述的是同一个季，不应写入互相冲突的内容。

### 整部剧：`tvshow.nfo`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<tvshow>
  <title>示例剧</title>
  <originaltitle>Example Show</originaltitle>
  <year>2026</year>
  <plot>整部剧简介</plot>
  <genre>剧情</genre>
  <uniqueid type="tvdb" default="true">123456</uniqueid>
  <namedseason number="1">第一季</namedseason>
  <seasonplot season="1">第一季简介</seasonplot>
</tvshow>
```

### 当前季：`Season 01/season.nfo`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<season>
  <title>第一季</title>
  <seasonnumber>1</seasonnumber>
  <plot>第一季简介</plot>
</season>
```

### 单集：与视频同名的 NFO

```xml
<?xml version="1.0" encoding="UTF-8"?>
<episodedetails>
  <title>第一集</title>
  <showtitle>示例剧</showtitle>
  <season>1</season>
  <episode>1</episode>
  <aired>2026-01-01</aired>
  <plot>本集简介</plot>
</episodedetails>
```

季号、集号和所属剧由目录与文件关系确定。请勿为了修改显示文案而改变这些结构事实。

## 图片命名

| 对象 | 推荐文件 | 位置 |
| --- | --- | --- |
| 电影 | `poster.jpg`、`fanart.jpg` | 电影目录 |
| 整部剧 | `poster.jpg`、`fanart.jpg` | 剧根目录 |
| 季（Jellyfin / Vanto） | `poster.jpg`、`fanart.jpg` | `Season 01` 目录 |
| 季（Kodi） | `season01-poster.jpg`、`season01-fanart.jpg` | 剧根目录 |
| 单集 | `Example Show - S01E01-thumb.jpg` | 与单集视频同目录 |

建议使用 JPG 或 PNG。NFO 中的相对图片文件名必须与同目录真实文件精确一致；Vanto 不会按相似文件名猜图，宁可留空也不会展示可能错误的图片。

## 外挂字幕

字幕与视频放在同一目录，并使用完全相同的主文件名：

```text
Arrival (2016).mkv
Arrival (2016).zh-Hans.srt
Arrival (2016).en.forced.ass
Arrival (2016).zh-Hant.vtt
```

可在主文件名后追加语言与用途：

- 语言：`zh-Hans`、`zh-Hant`、`en`、`ja` 等。
- 可保留 `forced` 等常见用途后缀以便人工识别；是否自动启用仍由播放器中的字幕选择决定。
- Vanto 支持的文本字幕格式：SRT、ASS、SSA、VTT、SMI。

外挂字幕不写入 NFO。NFO 负责描述媒体，字幕始终是与具体视频绑定的独立文件。

## 检查与限制

- NFO 使用 UTF-8 XML，根节点必须与对象一致：`movie`、`tvshow`、`season` 或 `episodedetails`。
- 单个 NFO 最大 2 MB；Vanto 最多读取 32 位人物。
- 未识别的 XML 元素会被忽略，不会阻止视频扫描和播放。
- 如果信息没有更新，请先检查文件名、XML、大小写及图片位置，再刷新当前来源。
- Vanto 的“编辑信息”只写回当前选择的电影、整部剧、当前季或当前集，不会级联重写其它 NFO。

## 兼容范围

本页只承诺 Vanto 当前实现与 Jellyfin、Kodi 公共约定的交集。Jellyfin 与 Kodi 各自还支持更多标签、图片类型和命名变体；若需要使用扩展能力，请同时参考其官方文档：

- [Jellyfin NFO](https://jellyfin.org/docs/general/server/metadata/nfo/)
- [Jellyfin Movies](https://jellyfin.org/docs/general/server/media/movies/)
- [Jellyfin Shows](https://jellyfin.org/docs/general/server/media/shows/)
- [Kodi NFO files](https://kodi.wiki/view/NFO_files)
- [Kodi Artwork](https://kodi.wiki/view/Artwork)
