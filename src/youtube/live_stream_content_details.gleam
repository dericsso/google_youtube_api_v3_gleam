//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option

/// Detailed settings of a stream.
pub type LiveStreamContentDetails {
  LiveStreamContentDetails(
    closed_captions_ingestion_url: option.Option(String),
    is_reusable: option.Option(Bool),
  )
}

pub fn decoder() -> Decoder(LiveStreamContentDetails) {
  use closed_captions_ingestion_url <- optional_field(
    "closedCaptionsIngestionUrl",
    option.None,
    optional(string),
  )
  use is_reusable <- optional_field("isReusable", option.None, optional(bool))
  success(LiveStreamContentDetails(closed_captions_ingestion_url, is_reusable))
}