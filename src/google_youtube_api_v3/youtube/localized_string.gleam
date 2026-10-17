//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LocalizedString {
  LocalizedString(language: Option(String), value: Option(String))
}

pub fn decoder() -> Decoder(LocalizedString) {
  use language <- decode.optional_field(
    "language",
    option.None,
    decode.optional(decode.string),
  )
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LocalizedString(language, value))
}

pub fn to_json(value: LocalizedString) -> Json {
  json.object(
    [
      #("language", json.nullable(value.language, json.string)),
      #("value", json.nullable(value.value, json.string)),
    ],
  )
}