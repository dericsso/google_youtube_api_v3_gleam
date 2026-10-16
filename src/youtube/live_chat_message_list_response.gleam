//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, list, success}
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

pub fn decoder() -> Decoder(LiveChatMessageListResponse) {
  use active_poll_item <- optional_field(
    "activePollItem",
    option.None,
    optional(live_chat_message.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use event_id <- optional_field("eventId", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(live_chat_message.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  use next_page_token <- optional_field(
    "nextPageToken",
    option.None,
    optional(string),
  )
  use offline_at <- optional_field("offlineAt", option.None, optional(string))
  use page_info <- optional_field(
    "pageInfo",
    option.None,
    optional(page_info.decoder()),
  )
  use polling_interval_millis <- optional_field(
    "pollingIntervalMillis",
    option.None,
    optional(int),
  )
  use token_pagination <- optional_field(
    "tokenPagination",
    option.None,
    optional(token_pagination.decoder()),
  )
  use visitor_id <- optional_field("visitorId", option.None, optional(string))
  success(
    LiveChatMessageListResponse(
      active_poll_item,
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      offline_at,
      page_info,
      polling_interval_millis,
      token_pagination,
      visitor_id,
    ),
  )
}