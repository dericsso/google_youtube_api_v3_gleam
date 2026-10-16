//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Video processing progress and completion time estimate.
pub type VideoProcessingDetailsProcessingProgress {
  VideoProcessingDetailsProcessingProgress(
    parts_processed: option.Option(String),
    parts_total: option.Option(String),
    time_left_ms: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoProcessingDetailsProcessingProgress) {
  use parts_processed <- optional_field(
    "partsProcessed",
    option.None,
    optional(string),
  )
  use parts_total <- optional_field("partsTotal", option.None, optional(string))
  use time_left_ms <- optional_field(
    "timeLeftMs",
    option.None,
    optional(string),
  )
  success(
    VideoProcessingDetailsProcessingProgress(
      parts_processed,
      parts_total,
      time_left_ms,
    ),
  )
}