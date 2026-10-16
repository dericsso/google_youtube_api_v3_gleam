//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// ChannelSection localization setting
pub type ChannelSectionLocalization {
  ChannelSectionLocalization(title: option.Option(String))
}

pub fn decoder() -> Decoder(ChannelSectionLocalization) {
  use title <- optional_field("title", option.None, optional(string))
  success(ChannelSectionLocalization(title))
}