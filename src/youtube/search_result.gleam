//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}
import youtube/search_result_snippet.{type SearchResultSnippet}

/// A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
pub type SearchResult {
  SearchResult(
    etag: option.Option(String),
    id: option.Option(ResourceId),
    kind: option.Option(String),
    snippet: option.Option(SearchResultSnippet),
  )
}
