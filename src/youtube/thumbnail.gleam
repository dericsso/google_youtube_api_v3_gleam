//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// A thumbnail is an image representing a YouTube resource.
pub type Thumbnail {
  Thumbnail(
    height: option.Option(Int),
    url: option.Option(String),
    width: option.Option(Int),
  )
}
