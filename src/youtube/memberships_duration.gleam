//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option

pub type MembershipsDuration {
  MembershipsDuration(
    member_since: option.Option(String),
    member_total_duration_months: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(MembershipsDuration) {
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
  success(MembershipsDuration(member_since, member_total_duration_months))
}