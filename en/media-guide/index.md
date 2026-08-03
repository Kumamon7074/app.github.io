---
title: Vanto Media Organization Guide
description: Organize movies, shows, NFO metadata, artwork, and external subtitles for Vanto, Jellyfin, and Kodi
---

This guide applies to SMB and WebDAV file sources in Vanto. It documents a conservative structure that Vanto, Jellyfin, and Kodi can all identify reliably, rather than every extension supported by each product.

## Quick rules

- Store each movie in a `Title (Year)` folder and give the video, NFO, and subtitles the same base name.
- Store episodes as `Show (Year)/Season 01/Show - S01E01`.
- NFO is optional. Without NFO, Vanto builds the media hierarchy from folder and file names.
- Keep artwork with the media it describes. Vanto generates a video-frame placeholder only when no usable artwork exists.
- Refresh the current source in Vanto after changing NFO, artwork, or subtitles.

## Minimum structure without NFO

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

Keep one primary video edition in each movie folder. Put bonus material in an `Extras` subfolder so it is not mistaken for the feature.

## Complete movie example

```text
Movies/
└── Arrival (2016)/
    ├── Arrival (2016).mkv
    ├── Arrival (2016).nfo
    ├── poster.jpg
    ├── fanart.jpg
    └── Arrival (2016).en.forced.srt
```

Prefer an NFO with the same base name as the movie video. Vanto can also read an existing `movie.nfo`, but same-name files keep ownership clear when multiple video editions exist.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<movie>
  <title>Arrival</title>
  <originaltitle>Arrival</originaltitle>
  <year>2016</year>
  <plot>Movie overview</plot>
  <genre>Science Fiction</genre>
  <rating>7.9</rating>
  <uniqueid type="tmdb" default="true">329865</uniqueid>
  <actor>
    <name>Amy Adams</name>
    <role>Louise Banks</role>
    <thumb>amy-adams.jpg</thumb>
  </actor>
</movie>
```

## Complete TV example

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
        └── Example Show - S01E01.en.forced.ass
```

This structure intentionally carries two season conventions:

- Jellyfin and Vanto can read `season.nfo`, `poster.jpg`, and `fanart.jpg` inside the season folder.
- Kodi stores season names and plots in the series-level `tvshow.nfo`; season artwork is stored at series level as `season01-poster.jpg` and `season01-fanart.jpg`. Kodi does not depend on `season.nfo`.

Keep both when the same library must work in all three products. They describe the same season and should not contain conflicting facts.

### Series: `tvshow.nfo`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<tvshow>
  <title>Example Show</title>
  <originaltitle>Example Show</originaltitle>
  <year>2026</year>
  <plot>Series overview</plot>
  <genre>Drama</genre>
  <uniqueid type="tvdb" default="true">123456</uniqueid>
  <namedseason number="1">Season One</namedseason>
  <seasonplot season="1">Season one overview</seasonplot>
</tvshow>
```

### Season: `Season 01/season.nfo`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<season>
  <title>Season One</title>
  <seasonnumber>1</seasonnumber>
  <plot>Season one overview</plot>
</season>
```

### Episode: same-name NFO

```xml
<?xml version="1.0" encoding="UTF-8"?>
<episodedetails>
  <title>Episode One</title>
  <showtitle>Example Show</showtitle>
  <season>1</season>
  <episode>1</episode>
  <aired>2026-01-01</aired>
  <plot>Episode overview</plot>
</episodedetails>
```

Season number, episode number, and series ownership are structural facts. Do not change them only to alter display text.

## Artwork names

| Item | Recommended files | Location |
| --- | --- | --- |
| Movie | `poster.jpg`, `fanart.jpg` | Movie folder |
| Series | `poster.jpg`, `fanart.jpg` | Series root |
| Season (Jellyfin / Vanto) | `poster.jpg`, `fanart.jpg` | `Season 01` folder |
| Season (Kodi) | `season01-poster.jpg`, `season01-fanart.jpg` | Series root |
| Episode | `Example Show - S01E01-thumb.jpg` | Beside the episode video |

Use JPG or PNG. A relative artwork name in NFO must exactly match a real file in the same folder. Vanto does not guess from similar names; missing artwork is safer than incorrect artwork.

## External subtitles

Place subtitles beside the video and use exactly the same base name:

```text
Arrival (2016).mkv
Arrival (2016).en.srt
Arrival (2016).zh-Hans.forced.ass
Arrival (2016).fr.vtt
```

Optional suffixes may describe language and purpose:

- Language: `en`, `zh-Hans`, `zh-Hant`, `ja`, and similar language tags.
- Conventional role suffixes such as `forced` may be retained for identification; automatic activation still follows the subtitle selection in the player.
- Text subtitle formats supported by Vanto: SRT, ASS, SSA, VTT, and SMI.

External subtitles are not stored in NFO. NFO describes the media item; each subtitle remains a separate file bound to one video.

## Validation and limits

- Save NFO as UTF-8 XML with the correct root: `movie`, `tvshow`, `season`, or `episodedetails`.
- An NFO file may be up to 2 MB. Vanto reads up to 32 people entries.
- Unknown XML elements are ignored and do not block scanning or playback.
- If changes do not appear, verify names, XML, letter case, and artwork locations, then refresh the current source.
- Vanto's Edit Info action writes only the selected movie, series, current season, or current episode. It does not cascade changes into other NFO files.

## Compatibility scope

This page promises only the intersection implemented by Vanto and commonly supported by Jellyfin and Kodi. Both products support additional fields, artwork roles, and naming variants. Refer to their official documentation for extensions:

- [Jellyfin NFO](https://jellyfin.org/docs/general/server/metadata/nfo/)
- [Jellyfin Movies](https://jellyfin.org/docs/general/server/media/movies/)
- [Jellyfin Shows](https://jellyfin.org/docs/general/server/media/shows/)
- [Kodi NFO files](https://kodi.wiki/view/NFO_files)
- [Kodi Artwork](https://kodi.wiki/view/Artwork)
