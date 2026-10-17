//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A single tag suggestion with its relevance information.
pub type VideoSuggestionsTagSuggestion {
  VideoSuggestionsTagSuggestion(
    category_restricts: Option(List(String)),
    tag: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoSuggestionsTagSuggestion) {
  use category_restricts <- decode.optional_field(
    "categoryRestricts",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use tag <- decode.optional_field(
    "tag",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoSuggestionsTagSuggestion(category_restricts, tag))
}

pub fn to_json(value: VideoSuggestionsTagSuggestion) -> Json {
  json.object(
    [
      #(
        "categoryRestricts",
        json.nullable(
          value.category_restricts,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #("tag", json.nullable(value.tag, json.string)),
    ],
  )
}