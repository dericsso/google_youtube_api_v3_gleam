//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success, then, failure}
import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}
import youtube/video_localization.{type VideoLocalization}

/// Basic details about a video, including title, description, uploader, thumbnails and category.
pub type VideoSnippet {
  VideoSnippet(
    category_id: option.Option(String),
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    default_audio_language: option.Option(String),
    default_language: option.Option(String),
    description: option.Option(String),
    live_broadcast_content: option.Option(LiveBroadcastContent),
    localized: option.Option(VideoLocalization),
    published_at: option.Option(String),
    tags: option.Option(List(String)),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoSnippet) {
  use category_id <- optional_field("categoryId", option.None, optional(string))
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use channel_title <- optional_field(
    "channelTitle",
    option.None,
    optional(string),
  )
  use default_audio_language <- optional_field(
    "defaultAudioLanguage",
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
  use live_broadcast_content <- optional_field(
    "liveBroadcastContent",
    option.None,
    optional(live_broadcast_content_decoder()),
  )
  use localized <- optional_field(
    "localized",
    option.None,
    optional(video_localization.decoder()),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use tags <- optional_field("tags", option.None, optional(list(string)))
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
    VideoSnippet(
      category_id,
      channel_id,
      channel_title,
      default_audio_language,
      default_language,
      description,
      live_broadcast_content,
      localized,
      published_at,
      tags,
      thumbnails,
      title,
    ),
  )
}

/// Indicates if the video is an upcoming/active live broadcast. Or it's "none" if the video is not an upcoming/active live broadcast.
pub type LiveBroadcastContent {
  LiveBroadcastContentNone
  LiveBroadcastContentUpcoming
  LiveBroadcastContentLive
  LiveBroadcastContentCompleted
}

pub fn live_broadcast_content_to_string(value: LiveBroadcastContent) -> String {
  case value {
    LiveBroadcastContentNone -> "none"
    LiveBroadcastContentUpcoming -> "upcoming"
    LiveBroadcastContentLive -> "live"
    LiveBroadcastContentCompleted -> "completed"
  }
}

pub fn live_broadcast_content_decoder() -> Decoder(LiveBroadcastContent) {
  use value <- then(string)
  case value {
    "none" -> success(LiveBroadcastContentNone)
    "upcoming" -> success(LiveBroadcastContentUpcoming)
    "live" -> success(LiveBroadcastContentLive)
    "completed" -> success(LiveBroadcastContentCompleted)
    _ -> failure(LiveBroadcastContentNone, "a valid LiveBroadcastContent")
  }
}