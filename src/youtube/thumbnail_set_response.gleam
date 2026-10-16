//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

pub type ThumbnailSetResponse {
  ThumbnailSetResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(ThumbnailDetails)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
