//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/thumbnail.{type Thumbnail}

/// Internal representation of thumbnails for a YouTube resource.
pub type ThumbnailDetails {
  ThumbnailDetails(
    default: option.Option(Thumbnail),
    fhd: option.Option(Thumbnail),
    high: option.Option(Thumbnail),
    maxres: option.Option(Thumbnail),
    medium: option.Option(Thumbnail),
    qhd: option.Option(Thumbnail),
    standard: option.Option(Thumbnail),
    uhd: option.Option(Thumbnail),
  )
}
