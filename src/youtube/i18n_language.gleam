//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
