//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_abuse_report_reason_snippet.{type VideoAbuseReportReasonSnippet}

/// A `__videoAbuseReportReason__` resource identifies a reason that a video could be reported as abusive. Video abuse report reasons are used with `video.ReportAbuse`.
pub type VideoAbuseReportReason {
  VideoAbuseReportReason(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(VideoAbuseReportReasonSnippet),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReportReason) {
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
    decode.optional(video_abuse_report_reason_snippet.decoder()),
  )
  decode.success(VideoAbuseReportReason(etag, id, kind, snippet))
}

pub fn to_json(value: VideoAbuseReportReason) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, video_abuse_report_reason_snippet.to_json),
      ),
    ],
  )
}