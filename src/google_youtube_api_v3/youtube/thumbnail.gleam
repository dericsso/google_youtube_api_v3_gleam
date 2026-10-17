import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A thumbnail is an image representing a YouTube resource.
pub type Thumbnail {
  Thumbnail(height: Option(Int), url: Option(String), width: Option(Int))
}

pub fn thumbnail_decoder() -> Decoder(Thumbnail) {
  use height <- decode.optional_field(
    "height",
    option.None,
    decode.optional(decode.int),
  )
  use url <- decode.optional_field(
    "url",
    option.None,
    decode.optional(decode.string),
  )
  use width <- decode.optional_field(
    "width",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(Thumbnail(height, url, width))
}

pub fn thumbnail_to_json(value: Thumbnail) -> Json {
  json.object(
    [
      #("height", json.nullable(value.height, json.int)),
      #("url", json.nullable(value.url, json.string)),
      #("width", json.nullable(value.width, json.int)),
    ],
  )
}

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

pub fn thumbnail_details_decoder() -> Decoder(ThumbnailDetails) {
  use default <- decode.optional_field(
    "default",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use fhd <- decode.optional_field(
    "fhd",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use high <- decode.optional_field(
    "high",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use maxres <- decode.optional_field(
    "maxres",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use medium <- decode.optional_field(
    "medium",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use qhd <- decode.optional_field(
    "qhd",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use standard <- decode.optional_field(
    "standard",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  use uhd <- decode.optional_field(
    "uhd",
    option.None,
    decode.optional(thumbnail_decoder()),
  )
  decode.success(
    ThumbnailDetails(default, fhd, high, maxres, medium, qhd, standard, uhd),
  )
}

pub fn thumbnail_details_to_json(value: ThumbnailDetails) -> Json {
  json.object(
    [
      #("default", json.nullable(value.default, thumbnail_to_json)),
      #("fhd", json.nullable(value.fhd, thumbnail_to_json)),
      #("high", json.nullable(value.high, thumbnail_to_json)),
      #("maxres", json.nullable(value.maxres, thumbnail_to_json)),
      #("medium", json.nullable(value.medium, thumbnail_to_json)),
      #("qhd", json.nullable(value.qhd, thumbnail_to_json)),
      #("standard", json.nullable(value.standard, thumbnail_to_json)),
      #("uhd", json.nullable(value.uhd, thumbnail_to_json)),
    ],
  )
}

pub type ThumbnailSetResponse {
  ThumbnailSetResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(ThumbnailDetails)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn thumbnail_set_response_decoder() -> Decoder(ThumbnailSetResponse) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(thumbnail_details_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ThumbnailSetResponse(etag, event_id, items, kind, visitor_id))
}

pub fn thumbnail_set_response_to_json(value: ThumbnailSetResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, thumbnail_details_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}