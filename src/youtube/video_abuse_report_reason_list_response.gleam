//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/video_abuse_report_reason.{type VideoAbuseReportReason}

pub type VideoAbuseReportReasonListResponse {
  VideoAbuseReportReasonListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(VideoAbuseReportReason)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReportReasonListResponse) {
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
    decode.optional(decode.list(video_abuse_report_reason.decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoAbuseReportReasonListResponse(
    etag,
    event_id,
    items,
    kind,
    visitor_id,
  ))
}

pub fn to_json(value: VideoAbuseReportReasonListResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, video_abuse_report_reason.to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}
