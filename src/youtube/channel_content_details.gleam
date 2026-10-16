//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/option

/// Details about the content of a channel.
pub type ChannelContentDetails {
  ChannelContentDetails(related_playlists: option.Option(Dict(String, String)))
}
