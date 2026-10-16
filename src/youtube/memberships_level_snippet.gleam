//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/level_details.{type LevelDetails}

pub type MembershipsLevelSnippet {
  MembershipsLevelSnippet(
    creator_channel_id: option.Option(String),
    level_details: option.Option(LevelDetails),
  )
}

pub fn decoder() -> Decoder(MembershipsLevelSnippet) {
  use creator_channel_id <- optional_field(
    "creatorChannelId",
    option.None,
    optional(string),
  )
  use level_details <- optional_field(
    "levelDetails",
    option.None,
    optional(level_details.decoder()),
  )
  success(MembershipsLevelSnippet(creator_channel_id, level_details))
}