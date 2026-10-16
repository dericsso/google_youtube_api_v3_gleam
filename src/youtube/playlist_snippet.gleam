//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/playlist_localization.{type PlaylistLocalization}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a playlist, including title, description and thumbnails.
pub type PlaylistSnippet {
  PlaylistSnippet(
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    default_language: option.Option(String),
    description: option.Option(String),
    localized: option.Option(PlaylistLocalization),
    published_at: option.Option(String),
    tags: option.Option(List(String)),
    thumbnail_video_id: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}
