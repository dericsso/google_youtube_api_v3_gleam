//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option

pub type VideoAgeGating {
  VideoAgeGating(
    alcohol_content: option.Option(Bool),
    restricted: option.Option(Bool),
    video_game_rating: option.Option(VideoGameRating),
  )
}

pub fn decoder() -> Decoder(VideoAgeGating) {
  use alcohol_content <- optional_field(
    "alcoholContent",
    option.None,
    optional(bool),
  )
  use restricted <- optional_field("restricted", option.None, optional(bool))
  use video_game_rating <- optional_field(
    "videoGameRating",
    option.None,
    optional(video_game_rating_decoder()),
  )
  success(VideoAgeGating(alcohol_content, restricted, video_game_rating))
}

/// Video game rating, if any.
pub type VideoGameRating {
  VideoGameRatingAnyone
  VideoGameRatingM15Plus
  VideoGameRatingM16Plus
  VideoGameRatingM17Plus
}

pub fn video_game_rating_to_string(value: VideoGameRating) -> String {
  case value {
    VideoGameRatingAnyone -> "anyone"
    VideoGameRatingM15Plus -> "m15Plus"
    VideoGameRatingM16Plus -> "m16Plus"
    VideoGameRatingM17Plus -> "m17Plus"
  }
}

pub fn video_game_rating_decoder() -> Decoder(VideoGameRating) {
  use value <- then(string)
  case value {
    "anyone" -> success(VideoGameRatingAnyone)
    "m15Plus" -> success(VideoGameRatingM15Plus)
    "m16Plus" -> success(VideoGameRatingM16Plus)
    "m17Plus" -> success(VideoGameRatingM17Plus)
    _ -> failure(VideoGameRatingAnyone, "a valid VideoGameRating")
  }
}