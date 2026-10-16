//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/i18n_language.{type I18nLanguage}

pub type I18nLanguageListResponse {
  I18nLanguageListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(I18nLanguage)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(I18nLanguageListResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use event_id <- optional_field("eventId", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(i18n_language.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  use visitor_id <- optional_field("visitorId", option.None, optional(string))
  success(I18nLanguageListResponse(etag, event_id, items, kind, visitor_id))
}