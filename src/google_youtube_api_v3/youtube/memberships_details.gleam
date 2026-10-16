//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/memberships_duration.{
  type MembershipsDuration,
}
import google_youtube_api_v3/youtube/memberships_duration_at_level.{
  type MembershipsDurationAtLevel,
}

pub type MembershipsDetails {
  MembershipsDetails(
    accessible_levels: Option(List(String)),
    highest_accessible_level: Option(String),
    highest_accessible_level_display_name: Option(String),
    memberships_duration: Option(MembershipsDuration),
    memberships_duration_at_levels: Option(List(MembershipsDurationAtLevel)),
  )
}

pub fn decoder() -> Decoder(MembershipsDetails) {
  use accessible_levels <- decode.optional_field(
    "accessibleLevels",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use highest_accessible_level <- decode.optional_field(
    "highestAccessibleLevel",
    option.None,
    decode.optional(decode.string),
  )
  use highest_accessible_level_display_name <- decode.optional_field(
    "highestAccessibleLevelDisplayName",
    option.None,
    decode.optional(decode.string),
  )
  use memberships_duration <- decode.optional_field(
    "membershipsDuration",
    option.None,
    decode.optional(memberships_duration.decoder()),
  )
  use memberships_duration_at_levels <- decode.optional_field(
    "membershipsDurationAtLevels",
    option.None,
    decode.optional(decode.list(memberships_duration_at_level.decoder())),
  )
  decode.success(MembershipsDetails(
    accessible_levels,
    highest_accessible_level,
    highest_accessible_level_display_name,
    memberships_duration,
    memberships_duration_at_levels,
  ))
}

pub fn to_json(value: MembershipsDetails) -> Json {
  json.object([
    #(
      "accessibleLevels",
      json.nullable(value.accessible_levels, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "highestAccessibleLevel",
      json.nullable(value.highest_accessible_level, json.string),
    ),
    #(
      "highestAccessibleLevelDisplayName",
      json.nullable(value.highest_accessible_level_display_name, json.string),
    ),
    #(
      "membershipsDuration",
      json.nullable(value.memberships_duration, memberships_duration.to_json),
    ),
    #(
      "membershipsDurationAtLevels",
      json.nullable(value.memberships_duration_at_levels, fn(items) {
        json.array(items, memberships_duration_at_level.to_json)
      }),
    ),
  ])
}
