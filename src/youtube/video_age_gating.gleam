//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

pub type VideoAgeGating {
  VideoAgeGating(
    alcohol_content: option.Option(Bool),
    restricted: option.Option(Bool),
    video_game_rating: option.Option(String),
  )
}
