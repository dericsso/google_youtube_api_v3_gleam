//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_abuse_report_reason_snippet.{
  type VideoAbuseReportReasonSnippet,
}

/// A `__videoAbuseReportReason__` resource identifies a reason that a video could be reported as abusive. Video abuse report reasons are used with `video.ReportAbuse`.
pub type VideoAbuseReportReason {
  VideoAbuseReportReason(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(VideoAbuseReportReasonSnippet),
  )
}
