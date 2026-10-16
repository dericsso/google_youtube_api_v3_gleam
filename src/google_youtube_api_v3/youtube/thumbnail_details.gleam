//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/thumbnail.{type Thumbnail}

/// Internal representation of thumbnails for a YouTube resource.
pub type ThumbnailDetails {
  ThumbnailDetails(
    default: Option(Thumbnail),
    fhd: Option(Thumbnail),
    high: Option(Thumbnail),
    maxres: Option(Thumbnail),
    medium: Option(Thumbnail),
    qhd: Option(Thumbnail),
    standard: Option(Thumbnail),
    uhd: Option(Thumbnail),
  )
}

pub fn decoder() -> Decoder(ThumbnailDetails) {
  use default <- decode.optional_field(
    "default",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use fhd <- decode.optional_field(
    "fhd",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use high <- decode.optional_field(
    "high",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use maxres <- decode.optional_field(
    "maxres",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use medium <- decode.optional_field(
    "medium",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use qhd <- decode.optional_field(
    "qhd",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use standard <- decode.optional_field(
    "standard",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  use uhd <- decode.optional_field(
    "uhd",
    option.None,
    decode.optional(thumbnail.decoder()),
  )
  decode.success(ThumbnailDetails(
    default,
    fhd,
    high,
    maxres,
    medium,
    qhd,
    standard,
    uhd,
  ))
}

pub fn to_json(value: ThumbnailDetails) -> Json {
  json.object([
    #("default", json.nullable(value.default, thumbnail.to_json)),
    #("fhd", json.nullable(value.fhd, thumbnail.to_json)),
    #("high", json.nullable(value.high, thumbnail.to_json)),
    #("maxres", json.nullable(value.maxres, thumbnail.to_json)),
    #("medium", json.nullable(value.medium, thumbnail.to_json)),
    #("qhd", json.nullable(value.qhd, thumbnail.to_json)),
    #("standard", json.nullable(value.standard, thumbnail.to_json)),
    #("uhd", json.nullable(value.uhd, thumbnail.to_json)),
  ])
}
