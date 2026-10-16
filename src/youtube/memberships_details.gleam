//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/memberships_duration.{type MembershipsDuration}
import youtube/memberships_duration_at_level.{type MembershipsDurationAtLevel}

pub type MembershipsDetails {
  MembershipsDetails(
    accessible_levels: option.Option(List(String)),
    highest_accessible_level: option.Option(String),
    highest_accessible_level_display_name: option.Option(String),
    memberships_duration: option.Option(MembershipsDuration),
    memberships_duration_at_levels:
    option.Option(List(MembershipsDurationAtLevel)),
  )
}

pub fn decoder() -> Decoder(MembershipsDetails) {
  use accessible_levels <- optional_field(
    "accessibleLevels",
    option.None,
    optional(list(string)),
  )
  use highest_accessible_level <- optional_field(
    "highestAccessibleLevel",
    option.None,
    optional(string),
  )
  use highest_accessible_level_display_name <- optional_field(
    "highestAccessibleLevelDisplayName",
    option.None,
    optional(string),
  )
  use memberships_duration <- optional_field(
    "membershipsDuration",
    option.None,
    optional(memberships_duration.decoder()),
  )
  use memberships_duration_at_levels <- optional_field(
    "membershipsDurationAtLevels",
    option.None,
    optional(list(memberships_duration_at_level.decoder())),
  )
  success(
    MembershipsDetails(
      accessible_levels,
      highest_accessible_level,
      highest_accessible_level_display_name,
      memberships_duration,
      memberships_duration_at_levels,
    ),
  )
}