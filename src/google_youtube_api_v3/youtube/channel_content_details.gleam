//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about the content of a channel.
pub type ChannelContentDetails {
  ChannelContentDetails(related_playlists: Option(Dict(String, String)))
}

pub fn decoder() -> Decoder(ChannelContentDetails) {
  use related_playlists <- decode.optional_field(
    "relatedPlaylists",
    option.None,
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  decode.success(ChannelContentDetails(related_playlists))
}

pub fn to_json(value: ChannelContentDetails) -> Json {
  json.object(
    [
      #(
        "relatedPlaylists",
        json.nullable(
          value.related_playlists,
          fn(d)
          { json.dict(d, fn(k) { k }, json.string) },
        ),
      ),
    ],
  )
}