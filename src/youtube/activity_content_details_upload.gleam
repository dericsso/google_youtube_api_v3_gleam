//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Information about the uploaded video.
pub type ActivityContentDetailsUpload {
  ActivityContentDetailsUpload(video_id: option.Option(String))
}

pub fn decoder() -> Decoder(ActivityContentDetailsUpload) {
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(ActivityContentDetailsUpload(video_id))
}