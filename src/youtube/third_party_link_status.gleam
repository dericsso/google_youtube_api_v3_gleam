//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// The third-party link status object contains information about the status of the link.
pub type ThirdPartyLinkStatus {
  ThirdPartyLinkStatus(link_status: option.Option(LinkStatus))
}

pub fn decoder() -> Decoder(ThirdPartyLinkStatus) {
  use link_status <- optional_field(
    "linkStatus",
    option.None,
    optional(link_status_decoder()),
  )
  success(ThirdPartyLinkStatus(link_status))
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
  use value <- then(string)
  case value {
    "unknown" -> success(LinkStatusUnknown)
    "failed" -> success(LinkStatusFailed)
    "pending" -> success(LinkStatusPending)
    "linked" -> success(LinkStatusLinked)
    _ -> failure(LinkStatusUnknown, "a valid LinkStatus")
  }
}