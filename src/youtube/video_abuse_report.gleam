//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type VideoAbuseReport {
  VideoAbuseReport(
    comments: Option(String),
    language: Option(String),
    reason_id: Option(String),
    secondary_reason_id: Option(String),
    video_id: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReport) {
  use comments <- decode.optional_field(
    "comments",
    option.None,
    decode.optional(decode.string),
  )
  use language <- decode.optional_field(
    "language",
    option.None,
    decode.optional(decode.string),
  )
  use reason_id <- decode.optional_field(
    "reasonId",
    option.None,
    decode.optional(decode.string),
  )
  use secondary_reason_id <- decode.optional_field(
    "secondaryReasonId",
    option.None,
    decode.optional(decode.string),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoAbuseReport(
    comments,
    language,
    reason_id,
    secondary_reason_id,
    video_id,
  ))
}

pub fn to_json(value: VideoAbuseReport) -> Json {
  json.object([
    #("comments", json.nullable(value.comments, json.string)),
    #("language", json.nullable(value.language, json.string)),
    #("reasonId", json.nullable(value.reason_id, json.string)),
    #(
      "secondaryReasonId",
      json.nullable(value.secondary_reason_id, json.string),
    ),
    #("videoId", json.nullable(value.video_id, json.string)),
  ])
}
