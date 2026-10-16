//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LocalizedString {
  LocalizedString(language: option.Option(String), value: option.Option(String))
}

pub fn decoder() -> Decoder(LocalizedString) {
  use language <- optional_field("language", option.None, optional(string))
  use value <- optional_field("value", option.None, optional(string))
  success(LocalizedString(language, value))
}