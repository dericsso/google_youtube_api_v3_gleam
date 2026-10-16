//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
pub type ChannelContentOwnerDetails {
  ChannelContentOwnerDetails(
    content_owner: option.Option(String),
    time_linked: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelContentOwnerDetails) {
  use content_owner <- optional_field(
    "contentOwner",
    option.None,
    optional(string),
  )
  use time_linked <- optional_field("timeLinked", option.None, optional(string))
  success(ChannelContentOwnerDetails(content_owner, time_linked))
}