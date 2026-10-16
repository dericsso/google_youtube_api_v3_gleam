//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/third_party_link.{type ThirdPartyLink}

pub type ThirdPartyLinkListResponse {
  ThirdPartyLinkListResponse(
    etag: Option(String),
    items: Option(List(ThirdPartyLink)),
    kind: Option(String),
  )
}

pub fn decoder() -> Decoder(ThirdPartyLinkListResponse) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(third_party_link.decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ThirdPartyLinkListResponse(etag, items, kind))
}

pub fn to_json(value: ThirdPartyLinkListResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, third_party_link.to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
  ])
}
