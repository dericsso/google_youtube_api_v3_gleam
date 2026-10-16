//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/memberships_level_snippet.{
  type MembershipsLevelSnippet,
}

/// A *membershipsLevel* resource represents an offer made by YouTube creators for their fans. Users can become members of the channel by joining one of the available levels. They will provide recurring monetary support and receives special benefits.
pub type MembershipsLevel {
  MembershipsLevel(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(MembershipsLevelSnippet),
  )
}

pub fn decoder() -> Decoder(MembershipsLevel) {
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
    decode.optional(memberships_level_snippet.decoder()),
  )
  decode.success(MembershipsLevel(etag, id, kind, snippet))
}

pub fn to_json(value: MembershipsLevel) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "snippet",
      json.nullable(value.snippet, memberships_level_snippet.to_json),
    ),
  ])
}
