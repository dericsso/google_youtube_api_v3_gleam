//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LevelDetails {
  LevelDetails(display_name: option.Option(String))
}

pub fn decoder() -> Decoder(LevelDetails) {
  use display_name <- optional_field(
    "displayName",
    option.None,
    optional(string),
  )
  success(LevelDetails(display_name))
}