//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, int, success}
import gleam/option

pub type PlaylistContentDetails {
  PlaylistContentDetails(item_count: option.Option(Int))
}

pub fn decoder() -> Decoder(PlaylistContentDetails) {
  use item_count <- optional_field("itemCount", option.None, optional(int))
  success(PlaylistContentDetails(item_count))
}