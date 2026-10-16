//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a search result, including title, description and thumbnails of the item referenced by the search result.
pub type SearchResultSnippet {
  SearchResultSnippet(
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    description: option.Option(String),
    live_broadcast_content: option.Option(String),
    published_at: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}
