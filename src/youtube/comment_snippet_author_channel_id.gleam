//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Contains the id of the author's YouTube channel, if any.
pub type CommentSnippetAuthorChannelId {
  CommentSnippetAuthorChannelId(value: option.Option(String))
}

pub fn decoder() -> Decoder(CommentSnippetAuthorChannelId) {
  use value <- optional_field("value", option.None, optional(string))
  success(CommentSnippetAuthorChannelId(value))
}