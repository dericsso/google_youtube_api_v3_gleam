//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// DEPRECATED Region restriction of the video.
pub type VideoContentDetailsRegionRestriction {
  VideoContentDetailsRegionRestriction(
    allowed: Option(List(String)),
    blocked: Option(List(String)),
  )
}

pub fn decoder() -> Decoder(VideoContentDetailsRegionRestriction) {
  use allowed <- decode.optional_field(
    "allowed",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use blocked <- decode.optional_field(
    "blocked",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(VideoContentDetailsRegionRestriction(allowed, blocked))
}

pub fn to_json(value: VideoContentDetailsRegionRestriction) -> Json {
  json.object([
    #(
      "allowed",
      json.nullable(value.allowed, fn(items) { json.array(items, json.string) }),
    ),
    #(
      "blocked",
      json.nullable(value.blocked, fn(items) { json.array(items, json.string) }),
    ),
  ])
}
