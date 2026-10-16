//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

pub type MembershipsDuration {
  MembershipsDuration(
    member_since: option.Option(String),
    member_total_duration_months: option.Option(Int),
  )
}
