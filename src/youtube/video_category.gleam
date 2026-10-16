//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
