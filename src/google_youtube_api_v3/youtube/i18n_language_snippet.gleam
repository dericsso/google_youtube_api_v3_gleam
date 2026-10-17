//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about an i18n language, such as language code and human-readable name.
pub type I18nLanguageSnippet {
  I18nLanguageSnippet(hl: Option(String), name: Option(String))
}

pub fn decoder() -> Decoder(I18nLanguageSnippet) {
  use hl <- decode.optional_field(
    "hl",
    option.None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field(
    "name",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(I18nLanguageSnippet(hl, name))
}

pub fn to_json(value: I18nLanguageSnippet) -> Json {
  json.object(
    [
      #("hl", json.nullable(value.hl, json.string)),
      #("name", json.nullable(value.name, json.string)),
    ],
  )
}