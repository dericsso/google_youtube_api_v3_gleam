//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/page_info.{type PageInfo}
import youtube/playlist_image.{type PlaylistImage}

pub type PlaylistImageListResponse {
  PlaylistImageListResponse(
    items: option.Option(List(PlaylistImage)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    prev_page_token: option.Option(String),
  )
}

pub fn decoder() -> Decoder(PlaylistImageListResponse) {
  use items <- optional_field(
    "items",
    option.None,
    optional(list(playlist_image.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  use next_page_token <- optional_field(
    "nextPageToken",
    option.None,
    optional(string),
  )
  use page_info <- optional_field(
    "pageInfo",
    option.None,
    optional(page_info.decoder()),
  )
  use prev_page_token <- optional_field(
    "prevPageToken",
    option.None,
    optional(string),
  )
  success(
    PlaylistImageListResponse(
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
    ),
  )
}