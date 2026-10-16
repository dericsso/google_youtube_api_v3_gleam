//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option

pub type LiveStreamSnippet {
  LiveStreamSnippet(
    channel_id: option.Option(String),
    description: option.Option(String),
    is_default_stream: option.Option(Bool),
    published_at: option.Option(String),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveStreamSnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use is_default_stream <- optional_field(
    "isDefaultStream",
    option.None,
    optional(bool),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
    LiveStreamSnippet(
      channel_id,
      description,
      is_default_stream,
      published_at,
      title,
    ),
  )
}