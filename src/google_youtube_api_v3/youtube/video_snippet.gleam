//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/thumbnail_details.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/video_localization.{type VideoLocalization}

/// Basic details about a video, including title, description, uploader, thumbnails and category.
pub type VideoSnippet {
  VideoSnippet(
    category_id: Option(String),
    channel_id: Option(String),
    channel_title: Option(String),
    default_audio_language: Option(String),
    default_language: Option(String),
    description: Option(String),
    live_broadcast_content: Option(LiveBroadcastContent),
    localized: Option(VideoLocalization),
    published_at: Option(String),
    tags: Option(List(String)),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoSnippet) {
  use category_id <- decode.optional_field(
    "categoryId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_title <- decode.optional_field(
    "channelTitle",
    option.None,
    decode.optional(decode.string),
  )
  use default_audio_language <- decode.optional_field(
    "defaultAudioLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use live_broadcast_content <- decode.optional_field(
    "liveBroadcastContent",
    option.None,
    decode.optional(live_broadcast_content_decoder()),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(video_localization.decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use tags <- decode.optional_field(
    "tags",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail_details.decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
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

pub fn to_json(value: VideoSnippet) -> Json {
  json.object(
    [
      #("categoryId", json.nullable(value.category_id, json.string)),
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("channelTitle", json.nullable(value.channel_title, json.string)),
      #(
        "defaultAudioLanguage",
        json.nullable(value.default_audio_language, json.string),
      ),
      #("defaultLanguage", json.nullable(value.default_language, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #(
        "liveBroadcastContent",
        json.nullable(
          value.live_broadcast_content,
          fn(e)
          { json.string(live_broadcast_content_to_string(e)) },
        ),
      ),
      #("localized", json.nullable(value.localized, video_localization.to_json)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "tags",
        json.nullable(value.tags, fn(items) { json.array(items, json.string) }),
      ),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail_details.to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(LiveBroadcastContentNone)
    "upcoming" -> decode.success(LiveBroadcastContentUpcoming)
    "live" -> decode.success(LiveBroadcastContentLive)
    "completed" -> decode.success(LiveBroadcastContentCompleted)
    _ -> decode.failure(
      LiveBroadcastContentNone,
      "a valid LiveBroadcastContent",
    )
  }
}