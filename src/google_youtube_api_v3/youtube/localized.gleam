//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LanguageTag {
  LanguageTag(value: Option(String))
}

pub fn language_tag_decoder() -> Decoder(LanguageTag) {
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LanguageTag(value))
}

pub fn language_tag_to_json(value: LanguageTag) -> Json {
  json.object([#("value", json.nullable(value.value, json.string))])
}

pub type LocalizedProperty {
  LocalizedProperty(
    default: Option(String),
    default_language: Option(LanguageTag),
    localized: Option(List(LocalizedString)),
  )
}

pub fn localized_property_decoder() -> Decoder(LocalizedProperty) {
  use default <- decode.optional_field(
    "default",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(language_tag_decoder()),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(decode.list(localized_string_decoder())),
  )
  decode.success(LocalizedProperty(default, default_language, localized))
}

pub fn localized_property_to_json(value: LocalizedProperty) -> Json {
  json.object(
    [
      #("default", json.nullable(value.default, json.string)),
      #(
        "defaultLanguage",
        json.nullable(value.default_language, language_tag_to_json),
      ),
      #(
        "localized",
        json.nullable(
          value.localized,
          fn(items)
          { json.array(items, localized_string_to_json) },
        ),
      ),
    ],
  )
}

pub type LocalizedString {
  LocalizedString(language: Option(String), value: Option(String))
}

pub fn localized_string_decoder() -> Decoder(LocalizedString) {
  use language <- decode.optional_field(
    "language",
    option.None,
    decode.optional(decode.string),
  )
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LocalizedString(language, value))
}

pub fn localized_string_to_json(value: LocalizedString) -> Json {
  json.object(
    [
      #("language", json.nullable(value.language, json.string)),
      #("value", json.nullable(value.value, json.string)),
    ],
  )
}