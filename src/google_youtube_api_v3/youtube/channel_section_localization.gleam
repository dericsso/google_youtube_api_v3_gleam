//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// ChannelSection localization setting
pub type ChannelSectionLocalization {
  ChannelSectionLocalization(title: Option(String))
}

pub fn decoder() -> Decoder(ChannelSectionLocalization) {
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSectionLocalization(title))
}

pub fn to_json(value: ChannelSectionLocalization) -> Json {
  json.object([#("title", json.nullable(value.title, json.string))])
}
