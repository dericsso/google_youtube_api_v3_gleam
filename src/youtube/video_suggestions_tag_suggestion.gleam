//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option

/// A single tag suggestion with its relevance information.
pub type VideoSuggestionsTagSuggestion {
  VideoSuggestionsTagSuggestion(
    category_restricts: option.Option(List(String)),
    tag: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoSuggestionsTagSuggestion) {
  use category_restricts <- optional_field(
    "categoryRestricts",
    option.None,
    optional(list(string)),
  )
  use tag <- optional_field("tag", option.None, optional(string))
  success(VideoSuggestionsTagSuggestion(category_restricts, tag))
}