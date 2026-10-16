//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type AbuseType {
  AbuseType(id: option.Option(String))
}

pub fn decoder() -> Decoder(AbuseType) {
  use id <- optional_field("id", option.None, optional(string))
  success(AbuseType(id))
}