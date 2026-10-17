//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about the content of a YouTube Video. This is a subset of the information in VideoContentDetails specifically for the Videos.stats API.
pub type VideoStatsContentDetails {
  VideoStatsContentDetails(duration: Option(String))
}

pub fn decoder() -> Decoder(VideoStatsContentDetails) {
  use duration <- decode.optional_field(
    "duration",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoStatsContentDetails(duration))
}

pub fn to_json(value: VideoStatsContentDetails) -> Json {
  json.object([#("duration", json.nullable(value.duration, json.string))])
}