//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/level_details.{type LevelDetails}

pub type MembershipsLevelSnippet {
  MembershipsLevelSnippet(
    creator_channel_id: Option(String),
    level_details: Option(LevelDetails),
  )
}

pub fn decoder() -> Decoder(MembershipsLevelSnippet) {
  use creator_channel_id <- decode.optional_field(
    "creatorChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use level_details <- decode.optional_field(
    "levelDetails",
    option.None,
    decode.optional(level_details.decoder()),
  )
  decode.success(MembershipsLevelSnippet(creator_channel_id, level_details))
}

pub fn to_json(value: MembershipsLevelSnippet) -> Json {
  json.object(
    [
      #(
        "creatorChannelId",
        json.nullable(value.creator_channel_id, json.string),
      ),
      #(
        "levelDetails",
        json.nullable(value.level_details, level_details.to_json),
      ),
    ],
  )
}