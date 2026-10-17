//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic broadcast information.
pub type LiveBroadcastSnippet {
  LiveBroadcastSnippet(
    actual_end_time: Option(String),
    actual_start_time: Option(String),
    category_id: Option(String),
    channel_id: Option(String),
    description: Option(String),
    is_default_broadcast: Option(Bool),
    live_chat_id: Option(String),
    published_at: Option(String),
    scheduled_end_time: Option(String),
    scheduled_start_time: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveBroadcastSnippet) {
  use actual_end_time <- decode.optional_field(
    "actualEndTime",
    option.None,
    decode.optional(decode.string),
  )
  use actual_start_time <- decode.optional_field(
    "actualStartTime",
    option.None,
    decode.optional(decode.string),
  )
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
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use is_default_broadcast <- decode.optional_field(
    "isDefaultBroadcast",
    option.None,
    decode.optional(decode.bool),
  )
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use scheduled_end_time <- decode.optional_field(
    "scheduledEndTime",
    option.None,
    decode.optional(decode.string),
  )
  use scheduled_start_time <- decode.optional_field(
    "scheduledStartTime",
    option.None,
    decode.optional(decode.string),
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
    LiveBroadcastSnippet(
      actual_end_time,
      actual_start_time,
      category_id,
      channel_id,
      description,
      is_default_broadcast,
      live_chat_id,
      published_at,
      scheduled_end_time,
      scheduled_start_time,
      thumbnails,
      title,
    ),
  )
}

pub fn to_json(value: LiveBroadcastSnippet) -> Json {
  json.object(
    [
      #("actualEndTime", json.nullable(value.actual_end_time, json.string)),
      #("actualStartTime", json.nullable(value.actual_start_time, json.string)),
      #("categoryId", json.nullable(value.category_id, json.string)),
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #(
        "isDefaultBroadcast",
        json.nullable(value.is_default_broadcast, json.bool),
      ),
      #("liveChatId", json.nullable(value.live_chat_id, json.string)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "scheduledEndTime",
        json.nullable(value.scheduled_end_time, json.string),
      ),
      #(
        "scheduledStartTime",
        json.nullable(value.scheduled_start_time, json.string),
      ),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail_details.to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}