//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Basic details about an i18n region, such as region code and human-readable name.
pub type I18nRegionSnippet {
  I18nRegionSnippet(gl: option.Option(String), name: option.Option(String))
}

pub fn decoder() -> Decoder(I18nRegionSnippet) {
  use gl <- optional_field("gl", option.None, optional(string))
  use name <- optional_field("name", option.None, optional(string))
  success(I18nRegionSnippet(gl, name))
}