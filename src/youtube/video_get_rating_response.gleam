//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_rating.{type VideoRating}

pub type VideoGetRatingResponse {
  VideoGetRatingResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(VideoRating)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
