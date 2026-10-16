//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/thumbnail_details.{type ThumbnailDetails}

pub type ThumbnailSetResponse {
  ThumbnailSetResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(ThumbnailDetails)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn decoder() -> Decoder(ThumbnailSetResponse) {
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
    decode.optional(decode.list(thumbnail_details.decoder())),
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
  decode.success(ThumbnailSetResponse(etag, event_id, items, kind, visitor_id))
}

pub fn to_json(value: ThumbnailSetResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, thumbnail_details.to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}
