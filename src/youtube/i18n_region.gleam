//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/i18n_region_snippet.{type I18nRegionSnippet}

/// A *i18nRegion* resource identifies a region where YouTube is available.
pub type I18nRegion {
  I18nRegion(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(I18nRegionSnippet),
  )
}

pub fn decoder() -> Decoder(I18nRegion) {
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
    decode.optional(i18n_region_snippet.decoder()),
  )
  decode.success(I18nRegion(etag, id, kind, snippet))
}

pub fn to_json(value: I18nRegion) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, i18n_region_snippet.to_json)),
  ])
}
