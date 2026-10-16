//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type VideoAbuseReportSecondaryReason {
  VideoAbuseReportSecondaryReason(id: Option(String), label: Option(String))
}

pub fn decoder() -> Decoder(VideoAbuseReportSecondaryReason) {
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use label <- decode.optional_field(
    "label",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoAbuseReportSecondaryReason(id, label))
}

pub fn to_json(value: VideoAbuseReportSecondaryReason) -> Json {
  json.object([
    #("id", json.nullable(value.id, json.string)),
    #("label", json.nullable(value.label, json.string)),
  ])
}
