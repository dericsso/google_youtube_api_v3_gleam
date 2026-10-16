//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/page_info.{type PageInfo}
import youtube/subscription.{type Subscription}
import youtube/token_pagination.{type TokenPagination}

pub type SubscriptionListResponse {
  SubscriptionListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(Subscription)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    prev_page_token: option.Option(String),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(SubscriptionListResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use event_id <- optional_field("eventId", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(subscription.decoder())),
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
  use token_pagination <- optional_field(
    "tokenPagination",
    option.None,
    optional(token_pagination.decoder()),
  )
  use visitor_id <- optional_field("visitorId", option.None, optional(string))
  success(
    SubscriptionListResponse(
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
      token_pagination,
      visitor_id,
    ),
  )
}