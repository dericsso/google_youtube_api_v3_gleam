//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/invideo_position.{type InvideoPosition}
import google_youtube_api_v3/youtube/invideo_timing.{type InvideoTiming}

/// Describes an invideo branding.
pub type InvideoBranding {
  InvideoBranding(
    image_bytes: Option(String),
    image_url: Option(String),
    position: Option(InvideoPosition),
    target_channel_id: Option(String),
    timing: Option(InvideoTiming),
  )
}

pub fn decoder() -> Decoder(InvideoBranding) {
  use image_bytes <- decode.optional_field(
    "imageBytes",
    option.None,
    decode.optional(decode.string),
  )
  use image_url <- decode.optional_field(
    "imageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use position <- decode.optional_field(
    "position",
    option.None,
    decode.optional(invideo_position.decoder()),
  )
  use target_channel_id <- decode.optional_field(
    "targetChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use timing <- decode.optional_field(
    "timing",
    option.None,
    decode.optional(invideo_timing.decoder()),
  )
  decode.success(
    InvideoBranding(image_bytes, image_url, position, target_channel_id, timing),
  )
}

pub fn to_json(value: InvideoBranding) -> Json {
  json.object(
    [
      #("imageBytes", json.nullable(value.image_bytes, json.string)),
      #("imageUrl", json.nullable(value.image_url, json.string)),
      #("position", json.nullable(value.position, invideo_position.to_json)),
      #("targetChannelId", json.nullable(value.target_channel_id, json.string)),
      #("timing", json.nullable(value.timing, invideo_timing.to_json)),
    ],
  )
}