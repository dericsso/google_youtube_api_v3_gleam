//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, dict, success}
import gleam/option

/// Details about the content of a channel.
pub type ChannelContentDetails {
  ChannelContentDetails(related_playlists: option.Option(Dict(String, String)))
}

pub fn decoder() -> Decoder(ChannelContentDetails) {
  use related_playlists <- optional_field(
    "relatedPlaylists",
    option.None,
    optional(dict(string, string)),
  )
  success(ChannelContentDetails(related_playlists))
}