//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_abuse_report_secondary_reason.{
  type VideoAbuseReportSecondaryReason,
}

/// Basic details about a video category, such as its localized title.
pub type VideoAbuseReportReasonSnippet {
  VideoAbuseReportReasonSnippet(
    label: option.Option(String),
    secondary_reasons: option.Option(List(VideoAbuseReportSecondaryReason)),
  )
}
