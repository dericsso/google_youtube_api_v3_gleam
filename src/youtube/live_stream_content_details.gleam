//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Detailed settings of a stream.
pub type LiveStreamContentDetails {
  LiveStreamContentDetails(
    closed_captions_ingestion_url: Option(String),
    is_reusable: Option(Bool),
  )
}

pub fn decoder() -> Decoder(LiveStreamContentDetails) {
  use closed_captions_ingestion_url <- decode.optional_field(
    "closedCaptionsIngestionUrl",
    option.None,
    decode.optional(decode.string),
  )
  use is_reusable <- decode.optional_field(
    "isReusable",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(LiveStreamContentDetails(
    closed_captions_ingestion_url,
    is_reusable,
  ))
}

pub fn to_json(value: LiveStreamContentDetails) -> Json {
  json.object([
    #(
      "closedCaptionsIngestionUrl",
      json.nullable(value.closed_captions_ingestion_url, json.string),
    ),
    #("isReusable", json.nullable(value.is_reusable, json.bool)),
  ])
}
