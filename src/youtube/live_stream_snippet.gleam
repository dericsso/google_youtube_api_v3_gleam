//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
