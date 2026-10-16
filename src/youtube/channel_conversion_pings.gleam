//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_conversion_ping.{type ChannelConversionPing}

/// The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
pub type ChannelConversionPings {
  ChannelConversionPings(pings: option.Option(List(ChannelConversionPing)))
}
