//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_abuse_report_secondary_reason.{
  type VideoAbuseReportSecondaryReason,
}

/// Basic details about a video category, such as its localized title.
pub type VideoAbuseReportReasonSnippet {
  VideoAbuseReportReasonSnippet(
    label: Option(String),
    secondary_reasons: Option(List(VideoAbuseReportSecondaryReason)),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReportReasonSnippet) {
  use label <- decode.optional_field(
    "label",
    option.None,
    decode.optional(decode.string),
  )
  use secondary_reasons <- decode.optional_field(
    "secondaryReasons",
    option.None,
    decode.optional(decode.list(video_abuse_report_secondary_reason.decoder())),
  )
  decode.success(VideoAbuseReportReasonSnippet(label, secondary_reasons))
}

pub fn to_json(value: VideoAbuseReportReasonSnippet) -> Json {
  json.object([
    #("label", json.nullable(value.label, json.string)),
    #(
      "secondaryReasons",
      json.nullable(value.secondary_reasons, fn(items) {
        json.array(items, video_abuse_report_secondary_reason.to_json)
      }),
    ),
  ])
}
