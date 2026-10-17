//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
pub type ChannelContentOwnerDetails {
  ChannelContentOwnerDetails(
    content_owner: Option(String),
    time_linked: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelContentOwnerDetails) {
  use content_owner <- decode.optional_field(
    "contentOwner",
    option.None,
    decode.optional(decode.string),
  )
  use time_linked <- decode.optional_field(
    "timeLinked",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelContentOwnerDetails(content_owner, time_linked))
}

pub fn to_json(value: ChannelContentOwnerDetails) -> Json {
  json.object(
    [
      #("contentOwner", json.nullable(value.content_owner, json.string)),
      #("timeLinked", json.nullable(value.time_linked, json.string)),
    ],
  )
}