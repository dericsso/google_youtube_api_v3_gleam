//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Details about the brand partner linked to the video for Creator Initiated Linking (CIL). Next ID: 6
pub type BrandPartner {
  BrandPartner(
    channel_handle: option.Option(String),
    channel_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(BrandPartner) {
  use channel_handle <- optional_field(
    "channelHandle",
    option.None,
    optional(string),
  )
  use channel_id <- optional_field("channelId", option.None, optional(string))
  success(BrandPartner(channel_handle, channel_id))
}