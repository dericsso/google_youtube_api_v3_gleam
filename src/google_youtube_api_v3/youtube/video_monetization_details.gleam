//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/access_policy.{type AccessPolicy}

/// Details about monetization of a YouTube Video.
pub type VideoMonetizationDetails {
  VideoMonetizationDetails(access: Option(AccessPolicy))
}

pub fn decoder() -> Decoder(VideoMonetizationDetails) {
  use access <- decode.optional_field(
    "access",
    option.None,
    decode.optional(access_policy.decoder()),
  )
  decode.success(VideoMonetizationDetails(access))
}

pub fn to_json(value: VideoMonetizationDetails) -> Json {
  json.object([#("access", json.nullable(value.access, access_policy.to_json))])
}
