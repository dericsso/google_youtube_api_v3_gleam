//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/member.{type Member}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

pub type MemberListResponse {
  MemberListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(Member)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn decoder() -> Decoder(MemberListResponse) {
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
    decode.optional(decode.list(member.decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.decoder()),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(MemberListResponse(
    etag,
    event_id,
    items,
    kind,
    next_page_token,
    page_info,
    token_pagination,
    visitor_id,
  ))
}

pub fn to_json(value: MemberListResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) { json.array(items, member.to_json) }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("nextPageToken", json.nullable(value.next_page_token, json.string)),
    #("pageInfo", json.nullable(value.page_info, page_info.to_json)),
    #(
      "tokenPagination",
      json.nullable(value.token_pagination, token_pagination.to_json),
    ),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}
