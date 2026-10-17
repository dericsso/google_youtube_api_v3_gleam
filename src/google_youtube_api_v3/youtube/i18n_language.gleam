//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/i18n_language_snippet.{type I18nLanguageSnippet}

/// An *i18nLanguage* resource identifies a UI language currently supported by YouTube.
pub type I18nLanguage {
  I18nLanguage(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(I18nLanguageSnippet),
  )
}

pub fn decoder() -> Decoder(I18nLanguage) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(i18n_language_snippet.decoder()),
  )
  decode.success(I18nLanguage(etag, id, kind, snippet))
}

pub fn to_json(value: I18nLanguage) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, i18n_language_snippet.to_json)),
    ],
  )
}