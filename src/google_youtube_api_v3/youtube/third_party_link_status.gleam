//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// The third-party link status object contains information about the status of the link.
pub type ThirdPartyLinkStatus {
  ThirdPartyLinkStatus(link_status: Option(LinkStatus))
}

pub fn decoder() -> Decoder(ThirdPartyLinkStatus) {
  use link_status <- decode.optional_field(
    "linkStatus",
    option.None,
    decode.optional(link_status_decoder()),
  )
  decode.success(ThirdPartyLinkStatus(link_status))
}

pub fn to_json(value: ThirdPartyLinkStatus) -> Json {
  json.object(
    [
      #(
        "linkStatus",
        json.nullable(
          value.link_status,
          fn(e)
          { json.string(link_status_to_string(e)) },
        ),
      ),
    ],
  )
}

pub type LinkStatus {
  LinkStatusUnknown
  LinkStatusFailed
  LinkStatusPending
  LinkStatusLinked
}

pub fn link_status_to_string(value: LinkStatus) -> String {
  case value {
    LinkStatusUnknown -> "unknown"
    LinkStatusFailed -> "failed"
    LinkStatusPending -> "pending"
    LinkStatusLinked -> "linked"
  }
}

pub fn link_status_decoder() -> Decoder(LinkStatus) {
  use value <- decode.then(decode.string)
  case value {
    "unknown" -> decode.success(LinkStatusUnknown)
    "failed" -> decode.success(LinkStatusFailed)
    "pending" -> decode.success(LinkStatusPending)
    "linked" -> decode.success(LinkStatusLinked)
    _ -> decode.failure(LinkStatusUnknown, "a valid LinkStatus")
  }
}