//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/playlist_image_snippet.{type PlaylistImageSnippet}

pub type PlaylistImage {
  PlaylistImage(
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(PlaylistImageSnippet),
  )
}
