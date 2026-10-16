//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/video_stat.{type VideoStat}

/// Response for the Videos.stats API. Returns VideoStat information about a batch of videos. VideoStat contains a subset of the information in Video that is relevant to statistics and content details. BatchGetStats is intentionally not atomic to provide a better user experience. BatchGetStatsResponse returns a summary to help users understand the outcome of the operation.
pub type BatchGetStatsResponse {
  BatchGetStatsResponse(
    etag: Option(String),
    items: Option(List(VideoStat)),
    kind: Option(String),
  )
}

pub fn decoder() -> Decoder(BatchGetStatsResponse) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(video_stat.decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(BatchGetStatsResponse(etag, items, kind))
}

pub fn to_json(value: BatchGetStatsResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, video_stat.to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
  ])
}
