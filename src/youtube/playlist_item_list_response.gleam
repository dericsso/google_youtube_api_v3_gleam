//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/page_info.{type PageInfo}
import youtube/playlist_item.{type PlaylistItem}
import youtube/token_pagination.{type TokenPagination}

pub type PlaylistItemListResponse {
  PlaylistItemListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(PlaylistItem)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    prev_page_token: option.Option(String),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}
