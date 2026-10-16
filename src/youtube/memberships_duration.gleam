//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type MembershipsDuration {
  MembershipsDuration(
    member_since: Option(String),
    member_total_duration_months: Option(Int),
  )
}

pub fn decoder() -> Decoder(MembershipsDuration) {
  use member_since <- decode.optional_field(
    "memberSince",
    option.None,
    decode.optional(decode.string),
  )
  use member_total_duration_months <- decode.optional_field(
    "memberTotalDurationMonths",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(MembershipsDuration(member_since, member_total_duration_months))
}

pub fn to_json(value: MembershipsDuration) -> Json {
  json.object([
    #("memberSince", json.nullable(value.member_since, json.string)),
    #(
      "memberTotalDurationMonths",
      json.nullable(value.member_total_duration_months, json.int),
    ),
  ])
}
