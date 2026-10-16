//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a search result, including title, description and thumbnails of the item referenced by the search result.
pub type SearchResultSnippet {
  SearchResultSnippet(
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    description: option.Option(String),
    live_broadcast_content: option.Option(LiveBroadcastContent),
    published_at: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(SearchResultSnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use channel_title <- optional_field(
    "channelTitle",
    option.None,
    optional(string),
  )
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use live_broadcast_content <- optional_field(
    "liveBroadcastContent",
    option.None,
    optional(live_broadcast_content_decoder()),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
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
  use value <- then(string)
  case value {
    "none" -> success(LiveBroadcastContentNone)
    "upcoming" -> success(LiveBroadcastContentUpcoming)
    "live" -> success(LiveBroadcastContentLive)
    "completed" -> success(LiveBroadcastContentCompleted)
    _ -> failure(LiveBroadcastContentNone, "a valid LiveBroadcastContent")
  }
}