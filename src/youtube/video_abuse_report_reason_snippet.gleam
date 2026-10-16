//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/video_abuse_report_secondary_reason.{type VideoAbuseReportSecondaryReason}

/// Basic details about a video category, such as its localized title.
pub type VideoAbuseReportReasonSnippet {
  VideoAbuseReportReasonSnippet(
    label: option.Option(String),
    secondary_reasons: option.Option(List(VideoAbuseReportSecondaryReason)),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReportReasonSnippet) {
  use label <- optional_field("label", option.None, optional(string))
  use secondary_reasons <- optional_field(
    "secondaryReasons",
    option.None,
    optional(list(video_abuse_report_secondary_reason.decoder())),
  )
  success(VideoAbuseReportReasonSnippet(label, secondary_reasons))
}