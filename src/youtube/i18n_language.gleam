//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/i18n_language_snippet.{type I18nLanguageSnippet}

/// An *i18nLanguage* resource identifies a UI language currently supported by YouTube.
pub type I18nLanguage {
  I18nLanguage(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(I18nLanguageSnippet),
  )
}

pub fn decoder() -> Decoder(I18nLanguage) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(i18n_language_snippet.decoder()),
  )
  success(I18nLanguage(etag, id, kind, snippet))
}