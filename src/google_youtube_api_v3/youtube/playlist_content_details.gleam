//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type PlaylistContentDetails {
  PlaylistContentDetails(item_count: Option(Int))
}

pub fn decoder() -> Decoder(PlaylistContentDetails) {
  use item_count <- decode.optional_field(
    "itemCount",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(PlaylistContentDetails(item_count))
}

pub fn to_json(value: PlaylistContentDetails) -> Json {
  json.object([#("itemCount", json.nullable(value.item_count, json.int))])
}
