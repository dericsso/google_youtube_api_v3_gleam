//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/caption.{type Caption}

pub type CaptionListResponse {
  CaptionListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(Caption)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(CaptionListResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use event_id <- optional_field("eventId", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(caption.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  use visitor_id <- optional_field("visitorId", option.None, optional(string))
  success(CaptionListResponse(etag, event_id, items, kind, visitor_id))
}