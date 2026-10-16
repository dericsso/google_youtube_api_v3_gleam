//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/memberships_level.{type MembershipsLevel}

pub type MembershipsLevelListResponse {
  MembershipsLevelListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(MembershipsLevel)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(MembershipsLevelListResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use event_id <- optional_field("eventId", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(memberships_level.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  use visitor_id <- optional_field("visitorId", option.None, optional(string))
  success(MembershipsLevelListResponse(etag, event_id, items, kind, visitor_id))
}