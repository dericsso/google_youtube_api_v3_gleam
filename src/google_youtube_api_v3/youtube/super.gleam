import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel.{type ChannelProfileDetails}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

/// A `__superChatEvent__` resource represents a Super Chat purchase on a YouTube channel.
pub type SuperChatEvent {
  SuperChatEvent(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(SuperChatEventSnippet),
  )
}

pub fn super_chat_event_decoder() -> Decoder(SuperChatEvent) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(super_chat_event_snippet_decoder()),
  )
  decode.success(SuperChatEvent(etag, id, kind, snippet))
}

pub fn super_chat_event_to_json(value: SuperChatEvent) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, super_chat_event_snippet_to_json),
      ),
    ],
  )
}

pub type SuperChatEventListResponse {
  SuperChatEventListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(SuperChatEvent)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn super_chat_event_list_response_decoder() -> Decoder(
  SuperChatEventListResponse,
) {
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
    decode.optional(decode.list(super_chat_event_decoder())),
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
    decode.optional(page_info.page_info_decoder()),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    SuperChatEventListResponse(
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      page_info,
      token_pagination,
      visitor_id,
    ),
  )
}

pub fn super_chat_event_list_response_to_json(value: SuperChatEventListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, super_chat_event_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
      #(
        "tokenPagination",
        json.nullable(
          value.token_pagination,
          token_pagination.token_pagination_to_json,
        ),
      ),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

pub type SuperChatEventSnippet {
  SuperChatEventSnippet(
    amount_micros: Option(String),
    channel_id: Option(String),
    comment_text: Option(String),
    created_at: Option(String),
    currency: Option(String),
    display_string: Option(String),
    is_super_sticker_event: Option(Bool),
    message_type: Option(Int),
    super_sticker_metadata: Option(SuperStickerMetadata),
    supporter_details: Option(ChannelProfileDetails),
  )
}

pub fn super_chat_event_snippet_decoder() -> Decoder(SuperChatEventSnippet) {
  use amount_micros <- decode.optional_field(
    "amountMicros",
    option.None,
    decode.optional(decode.string),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use comment_text <- decode.optional_field(
    "commentText",
    option.None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "createdAt",
    option.None,
    decode.optional(decode.string),
  )
  use currency <- decode.optional_field(
    "currency",
    option.None,
    decode.optional(decode.string),
  )
  use display_string <- decode.optional_field(
    "displayString",
    option.None,
    decode.optional(decode.string),
  )
  use is_super_sticker_event <- decode.optional_field(
    "isSuperStickerEvent",
    option.None,
    decode.optional(decode.bool),
  )
  use message_type <- decode.optional_field(
    "messageType",
    option.None,
    decode.optional(decode.int),
  )
  use super_sticker_metadata <- decode.optional_field(
    "superStickerMetadata",
    option.None,
    decode.optional(super_sticker_metadata_decoder()),
  )
  use supporter_details <- decode.optional_field(
    "supporterDetails",
    option.None,
    decode.optional(channel.channel_profile_details_decoder()),
  )
  decode.success(
    SuperChatEventSnippet(
      amount_micros,
      channel_id,
      comment_text,
      created_at,
      currency,
      display_string,
      is_super_sticker_event,
      message_type,
      super_sticker_metadata,
      supporter_details,
    ),
  )
}

pub fn super_chat_event_snippet_to_json(value: SuperChatEventSnippet) -> Json {
  json.object(
    [
      #("amountMicros", json.nullable(value.amount_micros, json.string)),
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("commentText", json.nullable(value.comment_text, json.string)),
      #("createdAt", json.nullable(value.created_at, json.string)),
      #("currency", json.nullable(value.currency, json.string)),
      #("displayString", json.nullable(value.display_string, json.string)),
      #(
        "isSuperStickerEvent",
        json.nullable(value.is_super_sticker_event, json.bool),
      ),
      #("messageType", json.nullable(value.message_type, json.int)),
      #(
        "superStickerMetadata",
        json.nullable(
          value.super_sticker_metadata,
          super_sticker_metadata_to_json,
        ),
      ),
      #(
        "supporterDetails",
        json.nullable(
          value.supporter_details,
          channel.channel_profile_details_to_json,
        ),
      ),
    ],
  )
}

pub type SuperStickerMetadata {
  SuperStickerMetadata(
    alt_text: Option(String),
    alt_text_language: Option(String),
    sticker_id: Option(String),
  )
}

pub fn super_sticker_metadata_decoder() -> Decoder(SuperStickerMetadata) {
  use alt_text <- decode.optional_field(
    "altText",
    option.None,
    decode.optional(decode.string),
  )
  use alt_text_language <- decode.optional_field(
    "altTextLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use sticker_id <- decode.optional_field(
    "stickerId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(SuperStickerMetadata(alt_text, alt_text_language, sticker_id))
}

pub fn super_sticker_metadata_to_json(value: SuperStickerMetadata) -> Json {
  json.object(
    [
      #("altText", json.nullable(value.alt_text, json.string)),
      #("altTextLanguage", json.nullable(value.alt_text_language, json.string)),
      #("stickerId", json.nullable(value.sticker_id, json.string)),
    ],
  )
}