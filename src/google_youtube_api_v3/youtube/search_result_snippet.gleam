//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/thumbnail_details.{type ThumbnailDetails}

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

pub fn decoder() -> Decoder(SearchResultSnippet) {
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
    decode.optional(thumbnail_details.decoder()),
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

pub fn to_json(value: SearchResultSnippet) -> Json {
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
        json.nullable(value.thumbnails, thumbnail_details.to_json),
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