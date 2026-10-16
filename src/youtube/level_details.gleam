//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LevelDetails {
  LevelDetails(display_name: Option(String))
}

pub fn decoder() -> Decoder(LevelDetails) {
  use display_name <- decode.optional_field(
    "displayName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LevelDetails(display_name))
}

pub fn to_json(value: LevelDetails) -> Json {
  json.object([#("displayName", json.nullable(value.display_name, json.string))])
}
