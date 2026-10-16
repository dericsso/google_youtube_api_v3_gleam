//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
