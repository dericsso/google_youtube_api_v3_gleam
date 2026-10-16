//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/channel_conversion_ping.{type ChannelConversionPing}

/// The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
pub type ChannelConversionPings {
  ChannelConversionPings(pings: Option(List(ChannelConversionPing)))
}

pub fn decoder() -> Decoder(ChannelConversionPings) {
  use pings <- decode.optional_field(
    "pings",
    option.None,
    decode.optional(decode.list(channel_conversion_ping.decoder())),
  )
  decode.success(ChannelConversionPings(pings))
}

pub fn to_json(value: ChannelConversionPings) -> Json {
  json.object([
    #(
      "pings",
      json.nullable(value.pings, fn(items) {
        json.array(items, channel_conversion_ping.to_json)
      }),
    ),
  ])
}
