//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
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

pub fn decoder() -> Decoder(Caption) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(caption_snippet.decoder()),
  )
  success(Caption(etag, id, kind, snippet))
}