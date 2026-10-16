//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option

/// DEPRECATED Region restriction of the video.
pub type VideoContentDetailsRegionRestriction {
  VideoContentDetailsRegionRestriction(
    allowed: option.Option(List(String)),
    blocked: option.Option(List(String)),
  )
}

pub fn decoder() -> Decoder(VideoContentDetailsRegionRestriction) {
  use allowed <- optional_field("allowed", option.None, optional(list(string)))
  use blocked <- optional_field("blocked", option.None, optional(list(string)))
  success(VideoContentDetailsRegionRestriction(allowed, blocked))
}