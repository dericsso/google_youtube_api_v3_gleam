//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type VideoAbuseReport {
  VideoAbuseReport(
    comments: option.Option(String),
    language: option.Option(String),
    reason_id: option.Option(String),
    secondary_reason_id: option.Option(String),
    video_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReport) {
  use comments <- optional_field("comments", option.None, optional(string))
  use language <- optional_field("language", option.None, optional(string))
  use reason_id <- optional_field("reasonId", option.None, optional(string))
  use secondary_reason_id <- optional_field(
    "secondaryReasonId",
    option.None,
    optional(string),
  )
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(
    VideoAbuseReport(
      comments,
      language,
      reason_id,
      secondary_reason_id,
      video_id,
    ),
  )
}