//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Contains the id of the author's YouTube channel, if any.
pub type CommentSnippetAuthorChannelId {
  CommentSnippetAuthorChannelId(value: Option(String))
}

pub fn decoder() -> Decoder(CommentSnippetAuthorChannelId) {
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(CommentSnippetAuthorChannelId(value))
}

pub fn to_json(value: CommentSnippetAuthorChannelId) -> Json {
  json.object([#("value", json.nullable(value.value, json.string))])
}
