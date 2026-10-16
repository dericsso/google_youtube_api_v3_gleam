//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/i18n_region.{type I18nRegion}

pub type I18nRegionListResponse {
  I18nRegionListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(I18nRegion)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(I18nRegionListResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use event_id <- optional_field("eventId", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(i18n_region.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  use visitor_id <- optional_field("visitorId", option.None, optional(string))
  success(I18nRegionListResponse(etag, event_id, items, kind, visitor_id))
}