//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/live_chat_message.{type LiveChatMessage}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

pub type LiveChatMessageListResponse {
  LiveChatMessageListResponse(
    active_poll_item: Option(LiveChatMessage),
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(LiveChatMessage)),
    kind: Option(String),
    next_page_token: Option(String),
    offline_at: Option(String),
    page_info: Option(PageInfo),
    polling_interval_millis: Option(Int),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMessageListResponse) {
  use active_poll_item <- decode.optional_field(
    "activePollItem",
    option.None,
    decode.optional(live_chat_message.decoder()),
  )
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
    decode.optional(decode.list(live_chat_message.decoder())),
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
  use offline_at <- decode.optional_field(
    "offlineAt",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.decoder()),
  )
  use polling_interval_millis <- decode.optional_field(
    "pollingIntervalMillis",
    option.None,
    decode.optional(decode.int),
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
  decode.success(
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

pub fn to_json(value: LiveChatMessageListResponse) -> Json {
  json.object(
    [
      #(
        "activePollItem",
        json.nullable(value.active_poll_item, live_chat_message.to_json),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, live_chat_message.to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("offlineAt", json.nullable(value.offline_at, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.to_json)),
      #(
        "pollingIntervalMillis",
        json.nullable(value.polling_interval_millis, json.int),
      ),
      #(
        "tokenPagination",
        json.nullable(value.token_pagination, token_pagination.to_json),
      ),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}