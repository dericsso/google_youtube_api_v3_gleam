//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Player to be used for a video playback.
pub type VideoPlayer {
  VideoPlayer(
    embed_height: option.Option(String),
    embed_html: option.Option(String),
    embed_width: option.Option(String),
  )
}
