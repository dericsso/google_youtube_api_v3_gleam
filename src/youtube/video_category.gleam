//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/video_category_snippet.{type VideoCategorySnippet}

/// A *videoCategory* resource identifies a category that has been or could be associated with uploaded videos.
pub type VideoCategory {
  VideoCategory(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(VideoCategorySnippet),
  )
}

pub fn decoder() -> Decoder(VideoCategory) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(video_category_snippet.decoder()),
  )
  success(VideoCategory(etag, id, kind, snippet))
}