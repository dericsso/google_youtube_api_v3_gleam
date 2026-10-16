//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
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

pub fn decoder() -> Decoder(PlaylistSnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use channel_title <- optional_field(
    "channelTitle",
    option.None,
    optional(string),
  )
  use default_language <- optional_field(
    "defaultLanguage",
    option.None,
    optional(string),
  )
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use localized <- optional_field(
    "localized",
    option.None,
    optional(playlist_localization.decoder()),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use tags <- optional_field("tags", option.None, optional(list(string)))
  use thumbnail_video_id <- optional_field(
    "thumbnailVideoId",
    option.None,
    optional(string),
  )
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
    PlaylistSnippet(
      channel_id,
      channel_title,
      default_language,
      description,
      localized,
      published_at,
      tags,
      thumbnail_video_id,
      thumbnails,
      title,
    ),
  )
}