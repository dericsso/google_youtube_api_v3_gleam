//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about rating of a video.
pub type VideoRating {
  VideoRating(rating: Option(Rating), video_id: Option(String))
}

pub fn decoder() -> Decoder(VideoRating) {
  use rating <- decode.optional_field(
    "rating",
    option.None,
    decode.optional(rating_decoder()),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoRating(rating, video_id))
}

pub fn to_json(value: VideoRating) -> Json {
  json.object([
    #(
      "rating",
      json.nullable(value.rating, fn(e) { json.string(rating_to_string(e)) }),
    ),
    #("videoId", json.nullable(value.video_id, json.string)),
  ])
}

/// Rating of a video.
pub type Rating {
  RatingNone
  RatingLike
  RatingDislike
}

pub fn rating_to_string(value: Rating) -> String {
  case value {
    RatingNone -> "none"
    RatingLike -> "like"
    RatingDislike -> "dislike"
  }
}

pub fn rating_decoder() -> Decoder(Rating) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(RatingNone)
    "like" -> decode.success(RatingLike)
    "dislike" -> decode.success(RatingDislike)
    _ -> decode.failure(RatingNone, "a valid Rating")
  }
}
