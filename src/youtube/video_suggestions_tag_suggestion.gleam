//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// A single tag suggestion with its relevance information.
pub type VideoSuggestionsTagSuggestion {
  VideoSuggestionsTagSuggestion(
    category_restricts: option.Option(List(String)),
    tag: option.Option(String),
  )
}
