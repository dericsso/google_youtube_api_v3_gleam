//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type MembershipsDurationAtLevel {
  MembershipsDurationAtLevel(
    level: Option(String),
    member_since: Option(String),
    member_total_duration_months: Option(Int),
  )
}

pub fn decoder() -> Decoder(MembershipsDurationAtLevel) {
  use level <- decode.optional_field(
    "level",
    option.None,
    decode.optional(decode.string),
  )
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
  decode.success(
    MembershipsDurationAtLevel(
      level,
      member_since,
      member_total_duration_months,
    ),
  )
}

pub fn to_json(value: MembershipsDurationAtLevel) -> Json {
  json.object(
    [
      #("level", json.nullable(value.level, json.string)),
      #("memberSince", json.nullable(value.member_since, json.string)),
      #(
        "memberTotalDurationMonths",
        json.nullable(value.member_total_duration_months, json.int),
      ),
    ],
  )
}