//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/live_broadcast_content_details.{type LiveBroadcastContentDetails}
import google_youtube_api_v3/youtube/live_broadcast_monetization_details.{type LiveBroadcastMonetizationDetails}
import google_youtube_api_v3/youtube/live_broadcast_snippet.{type LiveBroadcastSnippet}
import google_youtube_api_v3/youtube/live_broadcast_statistics.{type LiveBroadcastStatistics}
import google_youtube_api_v3/youtube/live_broadcast_status.{type LiveBroadcastStatus}

/// A *liveBroadcast* resource represents an event that will be streamed, via live video, on YouTube.
pub type LiveBroadcast {
  LiveBroadcast(
    content_details: Option(LiveBroadcastContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    monetization_details: Option(LiveBroadcastMonetizationDetails),
    snippet: Option(LiveBroadcastSnippet),
    statistics: Option(LiveBroadcastStatistics),
    status: Option(LiveBroadcastStatus),
  )
}

pub fn decoder() -> Decoder(LiveBroadcast) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(live_broadcast_content_details.decoder()),
  )
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
  use monetization_details <- decode.optional_field(
    "monetizationDetails",
    option.None,
    decode.optional(live_broadcast_monetization_details.decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_broadcast_snippet.decoder()),
  )
  use statistics <- decode.optional_field(
    "statistics",
    option.None,
    decode.optional(live_broadcast_statistics.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(live_broadcast_status.decoder()),
  )
  decode.success(
    LiveBroadcast(
      content_details,
      etag,
      id,
      kind,
      monetization_details,
      snippet,
      statistics,
      status,
    ),
  )
}

pub fn to_json(value: LiveBroadcast) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(
          value.content_details,
          live_broadcast_content_details.to_json,
        ),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "monetizationDetails",
        json.nullable(
          value.monetization_details,
          live_broadcast_monetization_details.to_json,
        ),
      ),
      #("snippet", json.nullable(value.snippet, live_broadcast_snippet.to_json)),
      #(
        "statistics",
        json.nullable(value.statistics, live_broadcast_statistics.to_json),
      ),
      #("status", json.nullable(value.status, live_broadcast_status.to_json)),
    ],
  )
}