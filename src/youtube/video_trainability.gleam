//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option

/// Specifies who is allowed to train on the video.
pub type VideoTrainability {
  VideoTrainability(
    etag: option.Option(String),
    kind: option.Option(String),
    permitted: option.Option(List(String)),
    video_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoTrainability) {
  use etag <- optional_field("etag", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use permitted <- optional_field(
    "permitted",
    option.None,
    optional(list(string)),
  )
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(VideoTrainability(etag, kind, permitted, video_id))
}