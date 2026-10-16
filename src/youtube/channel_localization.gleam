//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Channel localization setting
pub type ChannelLocalization {
  ChannelLocalization(
    description: option.Option(String),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelLocalization) {
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(ChannelLocalization(description, title))
}