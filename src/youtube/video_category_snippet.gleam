//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option

/// Basic details about a video category, such as its localized title.
pub type VideoCategorySnippet {
  VideoCategorySnippet(
    assignable: option.Option(Bool),
    channel_id: option.Option(String),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoCategorySnippet) {
  use assignable <- optional_field("assignable", option.None, optional(bool))
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use title <- optional_field("title", option.None, optional(string))
  success(VideoCategorySnippet(assignable, channel_id, title))
}