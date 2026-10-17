//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// An *i18nLanguage* resource identifies a UI language currently supported by YouTube.
pub type I18nLanguage {
  I18nLanguage(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(I18nLanguageSnippet),
  )
}

pub fn i18n_language_decoder() -> Decoder(I18nLanguage) {
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
    decode.optional(i18n_language_snippet_decoder()),
  )
  decode.success(I18nLanguage(etag, id, kind, snippet))
}

pub fn i18n_language_to_json(value: I18nLanguage) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, i18n_language_snippet_to_json)),
    ],
  )
}

pub type I18nLanguageListResponse {
  I18nLanguageListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(I18nLanguage)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn i18n_language_list_response_decoder() -> Decoder(
  I18nLanguageListResponse,
) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(i18n_language_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    I18nLanguageListResponse(etag, event_id, items, kind, visitor_id),
  )
}

pub fn i18n_language_list_response_to_json(value: I18nLanguageListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, i18n_language_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

/// Basic details about an i18n language, such as language code and human-readable name.
pub type I18nLanguageSnippet {
  I18nLanguageSnippet(hl: Option(String), name: Option(String))
}

pub fn i18n_language_snippet_decoder() -> Decoder(I18nLanguageSnippet) {
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

pub fn i18n_language_snippet_to_json(value: I18nLanguageSnippet) -> Json {
  json.object(
    [
      #("hl", json.nullable(value.hl, json.string)),
      #("name", json.nullable(value.name, json.string)),
    ],
  )
}

/// A *i18nRegion* resource identifies a region where YouTube is available.
pub type I18nRegion {
  I18nRegion(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(I18nRegionSnippet),
  )
}

pub fn i18n_region_decoder() -> Decoder(I18nRegion) {
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
    decode.optional(i18n_region_snippet_decoder()),
  )
  decode.success(I18nRegion(etag, id, kind, snippet))
}

pub fn i18n_region_to_json(value: I18nRegion) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, i18n_region_snippet_to_json)),
    ],
  )
}

pub type I18nRegionListResponse {
  I18nRegionListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(I18nRegion)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn i18n_region_list_response_decoder() -> Decoder(I18nRegionListResponse) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(i18n_region_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    I18nRegionListResponse(etag, event_id, items, kind, visitor_id),
  )
}

pub fn i18n_region_list_response_to_json(value: I18nRegionListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, i18n_region_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

/// Basic details about an i18n region, such as region code and human-readable name.
pub type I18nRegionSnippet {
  I18nRegionSnippet(gl: Option(String), name: Option(String))
}

pub fn i18n_region_snippet_decoder() -> Decoder(I18nRegionSnippet) {
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

pub fn i18n_region_snippet_to_json(value: I18nRegionSnippet) -> Json {
  json.object(
    [
      #("gl", json.nullable(value.gl, json.string)),
      #("name", json.nullable(value.name, json.string)),
    ],
  )
}