//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_abuse_report_reason.{type VideoAbuseReportReason}

pub type VideoAbuseReportReasonListResponse {
  VideoAbuseReportReasonListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(VideoAbuseReportReason)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
