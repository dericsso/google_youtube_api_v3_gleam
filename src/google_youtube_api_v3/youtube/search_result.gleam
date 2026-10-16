//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}
import google_youtube_api_v3/youtube/search_result_snippet.{
  type SearchResultSnippet,
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

pub fn decoder() -> Decoder(SearchResult) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(search_result_snippet.decoder()),
  )
  decode.success(SearchResult(etag, id, kind, snippet))
}

pub fn to_json(value: SearchResult) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, resource_id.to_json)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, search_result_snippet.to_json)),
  ])
}
