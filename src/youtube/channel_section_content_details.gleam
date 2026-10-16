//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option

/// Details about a channelsection, including playlists and channels.
pub type ChannelSectionContentDetails {
  ChannelSectionContentDetails(
    channels: option.Option(List(String)),
    playlists: option.Option(List(String)),
  )
}

pub fn decoder() -> Decoder(ChannelSectionContentDetails) {
  use channels <- optional_field(
    "channels",
    option.None,
    optional(list(string)),
  )
  use playlists <- optional_field(
    "playlists",
    option.None,
    optional(list(string)),
  )
  success(ChannelSectionContentDetails(channels, playlists))
}