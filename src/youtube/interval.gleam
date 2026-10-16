//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Represents a time interval, encoded as a Timestamp start (inclusive) and a Timestamp end (exclusive). The start must be less than or equal to the end. When the start equals the end, the interval is empty (matches no time). When both start and end are unspecified, the interval matches any time.
pub type Interval {
  Interval(end_time: option.Option(String), start_time: option.Option(String))
}

pub fn decoder() -> Decoder(Interval) {
  use end_time <- optional_field("endTime", option.None, optional(string))
  use start_time <- optional_field("startTime", option.None, optional(string))
  success(Interval(end_time, start_time))
}