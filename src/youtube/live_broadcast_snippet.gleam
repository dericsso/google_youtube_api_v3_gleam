//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic broadcast information.
pub type LiveBroadcastSnippet {
  LiveBroadcastSnippet(
    actual_end_time: option.Option(String),
    actual_start_time: option.Option(String),
    category_id: option.Option(String),
    channel_id: option.Option(String),
    description: option.Option(String),
    is_default_broadcast: option.Option(Bool),
    live_chat_id: option.Option(String),
    published_at: option.Option(String),
    scheduled_end_time: option.Option(String),
    scheduled_start_time: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveBroadcastSnippet) {
  use actual_end_time <- optional_field(
    "actualEndTime",
    option.None,
    optional(string),
  )
  use actual_start_time <- optional_field(
    "actualStartTime",
    option.None,
    optional(string),
  )
  use category_id <- optional_field("categoryId", option.None, optional(string))
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use is_default_broadcast <- optional_field(
    "isDefaultBroadcast",
    option.None,
    optional(bool),
  )
  use live_chat_id <- optional_field(
    "liveChatId",
    option.None,
    optional(string),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use scheduled_end_time <- optional_field(
    "scheduledEndTime",
    option.None,
    optional(string),
  )
  use scheduled_start_time <- optional_field(
    "scheduledStartTime",
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