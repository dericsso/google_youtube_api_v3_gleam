//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about an i18n region, such as region code and human-readable name.
pub type I18nRegionSnippet {
  I18nRegionSnippet(gl: Option(String), name: Option(String))
}

pub fn decoder() -> Decoder(I18nRegionSnippet) {
  use gl <- decode.optional_field(
    "gl",
    option.None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field(
    "name",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(I18nRegionSnippet(gl, name))
}

pub fn to_json(value: I18nRegionSnippet) -> Json {
  json.object([
    #("gl", json.nullable(value.gl, json.string)),
    #("name", json.nullable(value.name, json.string)),
  ])
}
