//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option

pub type MembershipsDurationAtLevel {
  MembershipsDurationAtLevel(
    level: option.Option(String),
    member_since: option.Option(String),
    member_total_duration_months: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(MembershipsDurationAtLevel) {
  use level <- optional_field("level", option.None, optional(string))
  use member_since <- optional_field(
    "memberSince",
    option.None,
    optional(string),
  )
  use member_total_duration_months <- optional_field(
    "memberTotalDurationMonths",
    option.None,
    optional(int),
  )
  success(
    MembershipsDurationAtLevel(
      level,
      member_since,
      member_total_duration_months,
    ),
  )
}