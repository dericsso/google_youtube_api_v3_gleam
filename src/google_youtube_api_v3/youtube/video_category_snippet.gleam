//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about a video category, such as its localized title.
pub type VideoCategorySnippet {
  VideoCategorySnippet(
    assignable: Option(Bool),
    channel_id: Option(String),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoCategorySnippet) {
  use assignable <- decode.optional_field(
    "assignable",
    option.None,
    decode.optional(decode.bool),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoCategorySnippet(assignable, channel_id, title))
}

pub fn to_json(value: VideoCategorySnippet) -> Json {
  json.object([
    #("assignable", json.nullable(value.assignable, json.bool)),
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("title", json.nullable(value.title, json.string)),
  ])
}
