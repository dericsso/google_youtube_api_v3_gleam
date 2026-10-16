//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/member_snippet.{type MemberSnippet}

/// A *member* resource represents a member for a YouTube channel. A member provides recurring monetary support to a creator and receives special benefits.
pub type Member {
  Member(
    etag: Option(String),
    kind: Option(String),
    snippet: Option(MemberSnippet),
  )
}

pub fn decoder() -> Decoder(Member) {
  use etag <- decode.optional_field(
    "etag",
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
    decode.optional(member_snippet.decoder()),
  )
  decode.success(Member(etag, kind, snippet))
}

pub fn to_json(value: Member) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, member_snippet.to_json)),
  ])
}
