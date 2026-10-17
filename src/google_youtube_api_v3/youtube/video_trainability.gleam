//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Specifies who is allowed to train on the video.
pub type VideoTrainability {
  VideoTrainability(
    etag: Option(String),
    kind: Option(String),
    permitted: Option(List(String)),
    video_id: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoTrainability) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use permitted <- decode.optional_field(
    "permitted",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoTrainability(etag, kind, permitted, video_id))
}

pub fn to_json(value: VideoTrainability) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "permitted",
        json.nullable(
          value.permitted,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #("videoId", json.nullable(value.video_id, json.string)),
    ],
  )
}