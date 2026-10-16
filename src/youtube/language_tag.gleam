//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LanguageTag {
  LanguageTag(value: Option(String))
}

pub fn decoder() -> Decoder(LanguageTag) {
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LanguageTag(value))
}

pub fn to_json(value: LanguageTag) -> Json {
  json.object([#("value", json.nullable(value.value, json.string))])
}
