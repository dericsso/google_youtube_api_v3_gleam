//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/invideo_position.{type InvideoPosition}
import youtube/invideo_timing.{type InvideoTiming}

/// Describes an invideo branding.
pub type InvideoBranding {
  InvideoBranding(
    image_bytes: option.Option(String),
    image_url: option.Option(String),
    position: option.Option(InvideoPosition),
    target_channel_id: option.Option(String),
    timing: option.Option(InvideoTiming),
  )
}

pub fn decoder() -> Decoder(InvideoBranding) {
  use image_bytes <- optional_field("imageBytes", option.None, optional(string))
  use image_url <- optional_field("imageUrl", option.None, optional(string))
  use position <- optional_field(
    "position",
    option.None,
    optional(invideo_position.decoder()),
  )
  use target_channel_id <- optional_field(
    "targetChannelId",
    option.None,
    optional(string),
  )
  use timing <- optional_field(
    "timing",
    option.None,
    optional(invideo_timing.decoder()),
  )
  success(
    InvideoBranding(image_bytes, image_url, position, target_channel_id, timing),
  )
}