//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
