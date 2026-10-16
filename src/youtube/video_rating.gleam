//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Basic details about rating of a video.
pub type VideoRating {
  VideoRating(rating: option.Option(Rating), video_id: option.Option(String))
}

pub fn decoder() -> Decoder(VideoRating) {
  use rating <- optional_field(
    "rating",
    option.None,
    optional(rating_decoder()),
  )
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(VideoRating(rating, video_id))
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
  use value <- then(string)
  case value {
    "none" -> success(RatingNone)
    "like" -> success(RatingLike)
    "dislike" -> success(RatingDislike)
    _ -> failure(RatingNone, "a valid Rating")
  }
}