//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/language_tag.{type LanguageTag}
import google_youtube_api_v3/youtube/localized_string.{type LocalizedString}

pub type LocalizedProperty {
  LocalizedProperty(
    default: Option(String),
    default_language: Option(LanguageTag),
    localized: Option(List(LocalizedString)),
  )
}

pub fn decoder() -> Decoder(LocalizedProperty) {
  use default <- decode.optional_field(
    "default",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(language_tag.decoder()),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(decode.list(localized_string.decoder())),
  )
  decode.success(LocalizedProperty(default, default_language, localized))
}

pub fn to_json(value: LocalizedProperty) -> Json {
  json.object([
    #("default", json.nullable(value.default, json.string)),
    #(
      "defaultLanguage",
      json.nullable(value.default_language, language_tag.to_json),
    ),
    #(
      "localized",
      json.nullable(value.localized, fn(items) {
        json.array(items, localized_string.to_json)
      }),
    ),
  ])
}
