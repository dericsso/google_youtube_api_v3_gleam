//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/access_policy.{type AccessPolicy}

/// Details about monetization of a YouTube Video.
pub type VideoMonetizationDetails {
  VideoMonetizationDetails(access: option.Option(AccessPolicy))
}

pub fn decoder() -> Decoder(VideoMonetizationDetails) {
  use access <- optional_field(
    "access",
    option.None,
    optional(access_policy.decoder()),
  )
  success(VideoMonetizationDetails(access))
}