//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about the live streaming metadata.
pub type VideoLiveStreamingDetails {
  VideoLiveStreamingDetails(
    active_live_chat_id: Option(String),
    actual_end_time: Option(String),
    actual_start_time: Option(String),
    concurrent_viewers: Option(String),
    scheduled_end_time: Option(String),
    scheduled_start_time: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoLiveStreamingDetails) {
  use active_live_chat_id <- decode.optional_field(
    "activeLiveChatId",
    option.None,
    decode.optional(decode.string),
  )
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
  use concurrent_viewers <- decode.optional_field(
    "concurrentViewers",
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
  decode.success(VideoLiveStreamingDetails(
    active_live_chat_id,
    actual_end_time,
    actual_start_time,
    concurrent_viewers,
    scheduled_end_time,
    scheduled_start_time,
  ))
}

pub fn to_json(value: VideoLiveStreamingDetails) -> Json {
  json.object([
    #("activeLiveChatId", json.nullable(value.active_live_chat_id, json.string)),
    #("actualEndTime", json.nullable(value.actual_end_time, json.string)),
    #("actualStartTime", json.nullable(value.actual_start_time, json.string)),
    #("concurrentViewers", json.nullable(value.concurrent_viewers, json.string)),
    #("scheduledEndTime", json.nullable(value.scheduled_end_time, json.string)),
    #(
      "scheduledStartTime",
      json.nullable(value.scheduled_start_time, json.string),
    ),
  ])
}
