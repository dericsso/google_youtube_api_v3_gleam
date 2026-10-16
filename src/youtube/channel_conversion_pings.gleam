//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, list, success}
import gleam/option
import youtube/channel_conversion_ping.{type ChannelConversionPing}

/// The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
pub type ChannelConversionPings {
  ChannelConversionPings(pings: option.Option(List(ChannelConversionPing)))
}

pub fn decoder() -> Decoder(ChannelConversionPings) {
  use pings <- optional_field(
    "pings",
    option.None,
    optional(list(channel_conversion_ping.decoder())),
  )
  success(ChannelConversionPings(pings))
}