//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/playlist_image.{type PlaylistImage}

pub type PlaylistImageListResponse {
  PlaylistImageListResponse(
    items: Option(List(PlaylistImage)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
  )
}

pub fn decoder() -> Decoder(PlaylistImageListResponse) {
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(playlist_image.decoder())),
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
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistImageListResponse(
    items,
    kind,
    next_page_token,
    page_info,
    prev_page_token,
  ))
}

pub fn to_json(value: PlaylistImageListResponse) -> Json {
  json.object([
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, playlist_image.to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("nextPageToken", json.nullable(value.next_page_token, json.string)),
    #("pageInfo", json.nullable(value.page_info, page_info.to_json)),
    #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
  ])
}
