//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/i18n_region.{type I18nRegion}

pub type I18nRegionListResponse {
  I18nRegionListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(I18nRegion)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn decoder() -> Decoder(I18nRegionListResponse) {
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
    decode.optional(decode.list(i18n_region.decoder())),
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
  decode.success(I18nRegionListResponse(etag, event_id, items, kind, visitor_id))
}

pub fn to_json(value: I18nRegionListResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, i18n_region.to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}
