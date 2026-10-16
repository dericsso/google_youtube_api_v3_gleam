//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
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

pub fn decoder() -> Decoder(ThumbnailDetails) {
  use default <- optional_field(
    "default",
    option.None,
    optional(thumbnail.decoder()),
  )
  use fhd <- optional_field("fhd", option.None, optional(thumbnail.decoder()))
  use high <- optional_field("high", option.None, optional(thumbnail.decoder()))
  use maxres <- optional_field(
    "maxres",
    option.None,
    optional(thumbnail.decoder()),
  )
  use medium <- optional_field(
    "medium",
    option.None,
    optional(thumbnail.decoder()),
  )
  use qhd <- optional_field("qhd", option.None, optional(thumbnail.decoder()))
  use standard <- optional_field(
    "standard",
    option.None,
    optional(thumbnail.decoder()),
  )
  use uhd <- optional_field("uhd", option.None, optional(thumbnail.decoder()))
  success(
    ThumbnailDetails(default, fhd, high, maxres, medium, qhd, standard, uhd),
  )
}