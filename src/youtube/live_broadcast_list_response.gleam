//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_broadcast.{type LiveBroadcast}
import youtube/page_info.{type PageInfo}
import youtube/token_pagination.{type TokenPagination}

pub type LiveBroadcastListResponse {
  LiveBroadcastListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(LiveBroadcast)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    prev_page_token: option.Option(String),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}
