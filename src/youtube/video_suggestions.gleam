//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_suggestions_tag_suggestion.{
  type VideoSuggestionsTagSuggestion,
}

/// Specifies suggestions on how to improve video content, including encoding hints, tag suggestions, and editor suggestions.
pub type VideoSuggestions {
  VideoSuggestions(
    editor_suggestions: option.Option(List(String)),
    processing_errors: option.Option(List(String)),
    processing_hints: option.Option(List(String)),
    processing_warnings: option.Option(List(String)),
    tag_suggestions: option.Option(List(VideoSuggestionsTagSuggestion)),
  )
}
