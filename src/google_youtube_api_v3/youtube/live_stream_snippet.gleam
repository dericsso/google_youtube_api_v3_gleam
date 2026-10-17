//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveStreamSnippet {
  LiveStreamSnippet(
    channel_id: Option(String),
    description: Option(String),
    is_default_stream: Option(Bool),
    published_at: Option(String),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveStreamSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use is_default_stream <- decode.optional_field(
    "isDefaultStream",
    option.None,
    decode.optional(decode.bool),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveStreamSnippet(
      channel_id,
      description,
      is_default_stream,
      published_at,
      title,
    ),
  )
}

pub fn to_json(value: LiveStreamSnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #("isDefaultStream", json.nullable(value.is_default_stream, json.bool)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}