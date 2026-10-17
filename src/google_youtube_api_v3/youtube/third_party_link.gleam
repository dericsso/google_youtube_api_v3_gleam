//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/third_party_link_snippet.{type ThirdPartyLinkSnippet}
import google_youtube_api_v3/youtube/third_party_link_status.{type ThirdPartyLinkStatus}

/// A *third party account link* resource represents a link between a YouTube account or a channel and an account on a third-party service.
pub type ThirdPartyLink {
  ThirdPartyLink(
    etag: Option(String),
    kind: Option(String),
    linking_token: Option(String),
    snippet: Option(ThirdPartyLinkSnippet),
    status: Option(ThirdPartyLinkStatus),
  )
}

pub fn decoder() -> Decoder(ThirdPartyLink) {
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
  use linking_token <- decode.optional_field(
    "linkingToken",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(third_party_link_snippet.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(third_party_link_status.decoder()),
  )
  decode.success(ThirdPartyLink(etag, kind, linking_token, snippet, status))
}

pub fn to_json(value: ThirdPartyLink) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("linkingToken", json.nullable(value.linking_token, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, third_party_link_snippet.to_json),
      ),
      #("status", json.nullable(value.status, third_party_link_status.to_json)),
    ],
  )
}