//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/memberships_duration.{type MembershipsDuration}
import youtube/memberships_duration_at_level.{type MembershipsDurationAtLevel}

pub type MembershipsDetails {
  MembershipsDetails(
    accessible_levels: option.Option(List(String)),
    highest_accessible_level: option.Option(String),
    highest_accessible_level_display_name: option.Option(String),
    memberships_duration: option.Option(MembershipsDuration),
    memberships_duration_at_levels: option.Option(
      List(MembershipsDurationAtLevel),
    ),
  )
}
