//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/video_abuse_report_reason_snippet.{type VideoAbuseReportReasonSnippet}

/// A `__videoAbuseReportReason__` resource identifies a reason that a video could be reported as abusive. Video abuse report reasons are used with `video.ReportAbuse`.
pub type VideoAbuseReportReason {
  VideoAbuseReportReason(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(VideoAbuseReportReasonSnippet),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReportReason) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(video_abuse_report_reason_snippet.decoder()),
  )
  success(VideoAbuseReportReason(etag, id, kind, snippet))
}