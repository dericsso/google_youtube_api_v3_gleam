//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about the brand partner linked to the video for Creator Initiated Linking (CIL). Next ID: 6
pub type BrandPartner {
  BrandPartner(channel_handle: Option(String), channel_id: Option(String))
}

pub fn decoder() -> Decoder(BrandPartner) {
  use channel_handle <- decode.optional_field(
    "channelHandle",
    option.None,
    decode.optional(decode.string),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(BrandPartner(channel_handle, channel_id))
}

pub fn to_json(value: BrandPartner) -> Json {
  json.object(
    [
      #("channelHandle", json.nullable(value.channel_handle, json.string)),
      #("channelId", json.nullable(value.channel_id, json.string)),
    ],
  )
}