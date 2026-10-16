//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Basic details about an i18n language, such as language code and human-readable name.
pub type I18nLanguageSnippet {
  I18nLanguageSnippet(hl: option.Option(String), name: option.Option(String))
}

pub fn decoder() -> Decoder(I18nLanguageSnippet) {
  use hl <- optional_field("hl", option.None, optional(string))
  use name <- optional_field("name", option.None, optional(string))
  success(I18nLanguageSnippet(hl, name))
}