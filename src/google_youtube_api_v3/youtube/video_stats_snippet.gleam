//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about a video. This is a subset of the information in VideoSnippet specifically for the Videos.stats API.
pub type VideoStatsSnippet {
  VideoStatsSnippet(publish_time: Option(String))
}

pub fn decoder() -> Decoder(VideoStatsSnippet) {
  use publish_time <- decode.optional_field(
    "publishTime",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoStatsSnippet(publish_time))
}

pub fn to_json(value: VideoStatsSnippet) -> Json {
  json.object(
    [#("publishTime", json.nullable(value.publish_time, json.string))],
  )
}