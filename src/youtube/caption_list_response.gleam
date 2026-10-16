//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/caption.{type Caption}

pub type CaptionListResponse {
  CaptionListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(Caption)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
