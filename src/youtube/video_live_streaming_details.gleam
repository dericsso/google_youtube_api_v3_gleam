//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Details about the live streaming metadata.
pub type VideoLiveStreamingDetails {
  VideoLiveStreamingDetails(
    active_live_chat_id: option.Option(String),
    actual_end_time: option.Option(String),
    actual_start_time: option.Option(String),
    concurrent_viewers: option.Option(String),
    scheduled_end_time: option.Option(String),
    scheduled_start_time: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoLiveStreamingDetails) {
  use active_live_chat_id <- optional_field(
    "activeLiveChatId",
    option.None,
    optional(string),
  )
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
  use concurrent_viewers <- optional_field(
    "concurrentViewers",
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
  success(
    VideoLiveStreamingDetails(
      active_live_chat_id,
      actual_end_time,
      actual_start_time,
      concurrent_viewers,
      scheduled_end_time,
      scheduled_start_time,
    ),
  )
}