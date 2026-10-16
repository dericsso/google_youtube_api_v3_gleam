//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Basic details about a video category, such as its localized title.
pub type VideoCategorySnippet {
  VideoCategorySnippet(
    assignable: option.Option(Bool),
    channel_id: option.Option(String),
    title: option.Option(String),
  )
}
