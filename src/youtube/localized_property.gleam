//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/language_tag.{type LanguageTag}
import youtube/localized_string.{type LocalizedString}

pub type LocalizedProperty {
  LocalizedProperty(
    default: option.Option(String),
    default_language: option.Option(LanguageTag),
    localized: option.Option(List(LocalizedString)),
  )
}

pub fn decoder() -> Decoder(LocalizedProperty) {
  use default <- optional_field("default", option.None, optional(string))
  use default_language <- optional_field(
    "defaultLanguage",
    option.None,
    optional(language_tag.decoder()),
  )
  use localized <- optional_field(
    "localized",
    option.None,
    optional(list(localized_string.decoder())),
  )
  success(LocalizedProperty(default, default_language, localized))
}