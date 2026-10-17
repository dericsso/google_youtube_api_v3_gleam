//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Localized versions of certain video properties (e.g. title).
pub type VideoLocalization {
  VideoLocalization(description: Option(String), title: Option(String))
}

pub fn decoder() -> Decoder(VideoLocalization) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoLocalization(description, title))
}

pub fn to_json(value: VideoLocalization) -> Json {
  json.object(
    [
      #("description", json.nullable(value.description, json.string)),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}