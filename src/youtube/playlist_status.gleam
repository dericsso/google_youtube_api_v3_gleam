//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

pub type PlaylistStatus {
  PlaylistStatus(
    podcast_status: option.Option(String),
    privacy_status: option.Option(String),
  )
}
