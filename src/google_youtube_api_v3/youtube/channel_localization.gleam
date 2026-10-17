//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Channel localization setting
pub type ChannelLocalization {
  ChannelLocalization(description: Option(String), title: Option(String))
}

pub fn decoder() -> Decoder(ChannelLocalization) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelLocalization(description, title))
}

pub fn to_json(value: ChannelLocalization) -> Json {
  json.object(
    [
      #("description", json.nullable(value.description, json.string)),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}