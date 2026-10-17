import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}
import google_youtube_api_v3/youtube/thumbnail.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

pub type SearchListResponse {
  SearchListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(SearchResult)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    region_code: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn search_list_response_decoder() -> Decoder(SearchListResponse) {
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
    decode.optional(decode.list(search_result_decoder())),
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
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use region_code <- decode.optional_field(
    "regionCode",
    option.None,
    decode.optional(decode.string),
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
    SearchListResponse(
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
      region_code,
      token_pagination,
      visitor_id,
    ),
  )
}

pub fn search_list_response_to_json(value: SearchListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, search_result_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
      #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
      #("regionCode", json.nullable(value.region_code, json.string)),
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

/// A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
pub type SearchResult {
  SearchResult(
    etag: Option(String),
    id: Option(ResourceId),
    kind: Option(String),
    snippet: Option(SearchResultSnippet),
  )
}

pub fn search_result_decoder() -> Decoder(SearchResult) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(search_result_snippet_decoder()),
  )
  decode.success(SearchResult(etag, id, kind, snippet))
}

pub fn search_result_to_json(value: SearchResult) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, resource_id.resource_id_to_json)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, search_result_snippet_to_json)),
    ],
  )
}

/// Basic details about a search result, including title, description and thumbnails of the item referenced by the search result.
pub type SearchResultSnippet {
  SearchResultSnippet(
    channel_id: Option(String),
    channel_title: Option(String),
    description: Option(String),
    live_broadcast_content: Option(LiveBroadcastContent),
    published_at: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn search_result_snippet_decoder() -> Decoder(SearchResultSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_title <- decode.optional_field(
    "channelTitle",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use live_broadcast_content <- decode.optional_field(
    "liveBroadcastContent",
    option.None,
    decode.optional(live_broadcast_content_decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail.thumbnail_details_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    SearchResultSnippet(
      channel_id,
      channel_title,
      description,
      live_broadcast_content,
      published_at,
      thumbnails,
      title,
    ),
  )
}

pub fn search_result_snippet_to_json(value: SearchResultSnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("channelTitle", json.nullable(value.channel_title, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #(
        "liveBroadcastContent",
        json.nullable(
          value.live_broadcast_content,
          fn(e)
          { json.string(live_broadcast_content_to_string(e)) },
        ),
      ),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}

/// It indicates if the resource (video or channel) has upcoming/active live broadcast content. Or it's "none" if there is not any upcoming/active live broadcasts.
pub type LiveBroadcastContent {
  LiveBroadcastContentNone
  LiveBroadcastContentUpcoming
  LiveBroadcastContentLive
  LiveBroadcastContentCompleted
}

pub fn live_broadcast_content_to_string(value: LiveBroadcastContent) -> String {
  case value {
    LiveBroadcastContentNone -> "none"
    LiveBroadcastContentUpcoming -> "upcoming"
    LiveBroadcastContentLive -> "live"
    LiveBroadcastContentCompleted -> "completed"
  }
}

pub fn live_broadcast_content_decoder() -> Decoder(LiveBroadcastContent) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(LiveBroadcastContentNone)
    "upcoming" -> decode.success(LiveBroadcastContentUpcoming)
    "live" -> decode.success(LiveBroadcastContentLive)
    "completed" -> decode.success(LiveBroadcastContentCompleted)
    _ -> decode.failure(
      LiveBroadcastContentNone,
      "a valid LiveBroadcastContent",
    )
  }
}