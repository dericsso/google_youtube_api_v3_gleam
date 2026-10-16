//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Represents a time interval, encoded as a Timestamp start (inclusive) and a Timestamp end (exclusive). The start must be less than or equal to the end. When the start equals the end, the interval is empty (matches no time). When both start and end are unspecified, the interval matches any time.
pub type Interval {
  Interval(end_time: Option(String), start_time: Option(String))
}

pub fn decoder() -> Decoder(Interval) {
  use end_time <- decode.optional_field(
    "endTime",
    option.None,
    decode.optional(decode.string),
  )
  use start_time <- decode.optional_field(
    "startTime",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(Interval(end_time, start_time))
}

pub fn to_json(value: Interval) -> Json {
  json.object([
    #("endTime", json.nullable(value.end_time, json.string)),
    #("startTime", json.nullable(value.start_time, json.string)),
  ])
}
