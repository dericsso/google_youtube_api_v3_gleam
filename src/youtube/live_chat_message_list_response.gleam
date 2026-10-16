//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_chat_message.{type LiveChatMessage}
import youtube/page_info.{type PageInfo}
import youtube/token_pagination.{type TokenPagination}

pub type LiveChatMessageListResponse {
  LiveChatMessageListResponse(
    active_poll_item: option.Option(LiveChatMessage),
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(LiveChatMessage)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    offline_at: option.Option(String),
    page_info: option.Option(PageInfo),
    polling_interval_millis: option.Option(Int),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}
