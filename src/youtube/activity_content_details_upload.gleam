//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information about the uploaded video.
pub type ActivityContentDetailsUpload {
  ActivityContentDetailsUpload(video_id: Option(String))
}

pub fn decoder() -> Decoder(ActivityContentDetailsUpload) {
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ActivityContentDetailsUpload(video_id))
}

pub fn to_json(value: ActivityContentDetailsUpload) -> Json {
  json.object([#("videoId", json.nullable(value.video_id, json.string))])
}
