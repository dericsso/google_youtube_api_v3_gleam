//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel.{type ChannelProfileDetails}
import google_youtube_api_v3/youtube/memberships.{type MembershipsDetails}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

/// A *member* resource represents a member for a YouTube channel. A member provides recurring monetary support to a creator and receives special benefits.
pub type Member {
  Member(
    etag: Option(String),
    kind: Option(String),
    snippet: Option(MemberSnippet),
  )
}

pub fn member_decoder() -> Decoder(Member) {
  use etag <- decode.optional_field(
    "etag",
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
    decode.optional(member_snippet_decoder()),
  )
  decode.success(Member(etag, kind, snippet))
}

pub fn member_to_json(value: Member) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, member_snippet_to_json)),
    ],
  )
}

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

pub fn member_list_response_decoder() -> Decoder(MemberListResponse) {
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
    decode.optional(decode.list(member_decoder())),
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
    MemberListResponse(
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

pub fn member_list_response_to_json(value: MemberListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, member_to_json) },
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

pub type MemberSnippet {
  MemberSnippet(
    creator_channel_id: Option(String),
    member_details: Option(ChannelProfileDetails),
    memberships_details: Option(MembershipsDetails),
  )
}

pub fn member_snippet_decoder() -> Decoder(MemberSnippet) {
  use creator_channel_id <- decode.optional_field(
    "creatorChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use member_details <- decode.optional_field(
    "memberDetails",
    option.None,
    decode.optional(channel.channel_profile_details_decoder()),
  )
  use memberships_details <- decode.optional_field(
    "membershipsDetails",
    option.None,
    decode.optional(memberships.memberships_details_decoder()),
  )
  decode.success(
    MemberSnippet(creator_channel_id, member_details, memberships_details),
  )
}

pub fn member_snippet_to_json(value: MemberSnippet) -> Json {
  json.object(
    [
      #(
        "creatorChannelId",
        json.nullable(value.creator_channel_id, json.string),
      ),
      #(
        "memberDetails",
        json.nullable(
          value.member_details,
          channel.channel_profile_details_to_json,
        ),
      ),
      #(
        "membershipsDetails",
        json.nullable(
          value.memberships_details,
          memberships.memberships_details_to_json,
        ),
      ),
    ],
  )
}