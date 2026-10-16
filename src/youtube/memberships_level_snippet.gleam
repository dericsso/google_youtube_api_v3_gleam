//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/level_details.{type LevelDetails}

pub type MembershipsLevelSnippet {
  MembershipsLevelSnippet(
    creator_channel_id: option.Option(String),
    level_details: option.Option(LevelDetails),
  )
}
