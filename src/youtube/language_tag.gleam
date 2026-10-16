//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LanguageTag {
  LanguageTag(value: option.Option(String))
}

pub fn decoder() -> Decoder(LanguageTag) {
  use value <- optional_field("value", option.None, optional(string))
  success(LanguageTag(value))
}