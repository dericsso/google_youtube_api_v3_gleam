//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Video processing progress and completion time estimate.
pub type VideoProcessingDetailsProcessingProgress {
  VideoProcessingDetailsProcessingProgress(
    parts_processed: Option(String),
    parts_total: Option(String),
    time_left_ms: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoProcessingDetailsProcessingProgress) {
  use parts_processed <- decode.optional_field(
    "partsProcessed",
    option.None,
    decode.optional(decode.string),
  )
  use parts_total <- decode.optional_field(
    "partsTotal",
    option.None,
    decode.optional(decode.string),
  )
  use time_left_ms <- decode.optional_field(
    "timeLeftMs",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    VideoProcessingDetailsProcessingProgress(
      parts_processed,
      parts_total,
      time_left_ms,
    ),
  )
}

pub fn to_json(value: VideoProcessingDetailsProcessingProgress) -> Json {
  json.object(
    [
      #("partsProcessed", json.nullable(value.parts_processed, json.string)),
      #("partsTotal", json.nullable(value.parts_total, json.string)),
      #("timeLeftMs", json.nullable(value.time_left_ms, json.string)),
    ],
  )
}