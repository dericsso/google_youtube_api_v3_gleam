//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Details about the content of a YouTube Video. This is a subset of the information in VideoContentDetails specifically for the Videos.stats API.
pub type VideoStatsContentDetails {
  VideoStatsContentDetails(duration: option.Option(String))
}

pub fn decoder() -> Decoder(VideoStatsContentDetails) {
  use duration <- optional_field("duration", option.None, optional(string))
  success(VideoStatsContentDetails(duration))
}