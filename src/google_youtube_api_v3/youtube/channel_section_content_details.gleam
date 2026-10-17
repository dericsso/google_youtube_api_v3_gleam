//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about a channelsection, including playlists and channels.
pub type ChannelSectionContentDetails {
  ChannelSectionContentDetails(
    channels: Option(List(String)),
    playlists: Option(List(String)),
  )
}

pub fn decoder() -> Decoder(ChannelSectionContentDetails) {
  use channels <- decode.optional_field(
    "channels",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use playlists <- decode.optional_field(
    "playlists",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(ChannelSectionContentDetails(channels, playlists))
}

pub fn to_json(value: ChannelSectionContentDetails) -> Json {
  json.object(
    [
      #(
        "channels",
        json.nullable(
          value.channels,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #(
        "playlists",
        json.nullable(
          value.playlists,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
    ],
  )
}