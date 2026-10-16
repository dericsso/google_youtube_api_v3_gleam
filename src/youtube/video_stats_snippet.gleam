//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Basic details about a video. This is a subset of the information in VideoSnippet specifically for the Videos.stats API.
pub type VideoStatsSnippet {
  VideoStatsSnippet(publish_time: option.Option(String))
}

pub fn decoder() -> Decoder(VideoStatsSnippet) {
  use publish_time <- optional_field(
    "publishTime",
    option.None,
    optional(string),
  )
  success(VideoStatsSnippet(publish_time))
}