//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type VideoAbuseReportSecondaryReason {
  VideoAbuseReportSecondaryReason(
    id: option.Option(String),
    label: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoAbuseReportSecondaryReason) {
  use id <- optional_field("id", option.None, optional(string))
  use label <- optional_field("label", option.None, optional(string))
  success(VideoAbuseReportSecondaryReason(id, label))
}