//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_stats_content_details.{
  type VideoStatsContentDetails,
}
import google_youtube_api_v3/youtube/video_stats_snippet.{type VideoStatsSnippet}
import google_youtube_api_v3/youtube/video_stats_statistics.{
  type VideoStatsStatistics,
}

/// A *VideoStat* resource represents a YouTube video's stats.
pub type VideoStat {
  VideoStat(
    content_details: Option(VideoStatsContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(VideoStatsSnippet),
    statistics: Option(VideoStatsStatistics),
  )
}

pub fn decoder() -> Decoder(VideoStat) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(video_stats_content_details.decoder()),
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
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(video_stats_snippet.decoder()),
  )
  use statistics <- decode.optional_field(
    "statistics",
    option.None,
    decode.optional(video_stats_statistics.decoder()),
  )
  decode.success(VideoStat(content_details, etag, id, kind, snippet, statistics))
}

pub fn to_json(value: VideoStat) -> Json {
  json.object([
    #(
      "contentDetails",
      json.nullable(value.content_details, video_stats_content_details.to_json),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, video_stats_snippet.to_json)),
    #(
      "statistics",
      json.nullable(value.statistics, video_stats_statistics.to_json),
    ),
  ])
}
