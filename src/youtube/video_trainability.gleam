//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
