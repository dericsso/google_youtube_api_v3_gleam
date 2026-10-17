//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type VideoAgeGating {
  VideoAgeGating(
    alcohol_content: Option(Bool),
    restricted: Option(Bool),
    video_game_rating: Option(VideoGameRating),
  )
}

pub fn decoder() -> Decoder(VideoAgeGating) {
  use alcohol_content <- decode.optional_field(
    "alcoholContent",
    option.None,
    decode.optional(decode.bool),
  )
  use restricted <- decode.optional_field(
    "restricted",
    option.None,
    decode.optional(decode.bool),
  )
  use video_game_rating <- decode.optional_field(
    "videoGameRating",
    option.None,
    decode.optional(video_game_rating_decoder()),
  )
  decode.success(VideoAgeGating(alcohol_content, restricted, video_game_rating))
}

pub fn to_json(value: VideoAgeGating) -> Json {
  json.object(
    [
      #("alcoholContent", json.nullable(value.alcohol_content, json.bool)),
      #("restricted", json.nullable(value.restricted, json.bool)),
      #(
        "videoGameRating",
        json.nullable(
          value.video_game_rating,
          fn(e)
          { json.string(video_game_rating_to_string(e)) },
        ),
      ),
    ],
  )
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
  use value <- decode.then(decode.string)
  case value {
    "anyone" -> decode.success(VideoGameRatingAnyone)
    "m15Plus" -> decode.success(VideoGameRatingM15Plus)
    "m16Plus" -> decode.success(VideoGameRatingM16Plus)
    "m17Plus" -> decode.success(VideoGameRatingM17Plus)
    _ -> decode.failure(VideoGameRatingAnyone, "a valid VideoGameRating")
  }
}