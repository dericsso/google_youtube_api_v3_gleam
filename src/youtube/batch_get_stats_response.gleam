//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/video_stat.{type VideoStat}

/// Response for the Videos.stats API. Returns VideoStat information about a batch of videos. VideoStat contains a subset of the information in Video that is relevant to statistics and content details. BatchGetStats is intentionally not atomic to provide a better user experience. BatchGetStatsResponse returns a summary to help users understand the outcome of the operation.
pub type BatchGetStatsResponse {
  BatchGetStatsResponse(
    etag: option.Option(String),
    items: option.Option(List(VideoStat)),
    kind: option.Option(String),
  )
}

pub fn decoder() -> Decoder(BatchGetStatsResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(video_stat.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  success(BatchGetStatsResponse(etag, items, kind))
}