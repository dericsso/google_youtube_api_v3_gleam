//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/caption_snippet.{type CaptionSnippet}

/// A *caption* resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
pub type Caption {
  Caption(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(CaptionSnippet),
  )
}
