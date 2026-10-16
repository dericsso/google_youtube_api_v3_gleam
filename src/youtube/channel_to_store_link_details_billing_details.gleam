//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Information specific to billing.
pub type ChannelToStoreLinkDetailsBillingDetails {
  ChannelToStoreLinkDetailsBillingDetails(
    billing_status: option.Option(BillingStatus),
  )
}

pub fn decoder() -> Decoder(ChannelToStoreLinkDetailsBillingDetails) {
  use billing_status <- optional_field(
    "billingStatus",
    option.None,
    optional(billing_status_decoder()),
  )
  success(ChannelToStoreLinkDetailsBillingDetails(billing_status))
}

/// The current billing profile status.
pub type BillingStatus {
  BillingStatusBillingStatusUnspecified
  BillingStatusBillingStatusPending
  BillingStatusBillingStatusActive
  BillingStatusBillingStatusInactive
}

pub fn billing_status_to_string(value: BillingStatus) -> String {
  case value {
    BillingStatusBillingStatusUnspecified -> "billingStatusUnspecified"
    BillingStatusBillingStatusPending -> "billingStatusPending"
    BillingStatusBillingStatusActive -> "billingStatusActive"
    BillingStatusBillingStatusInactive -> "billingStatusInactive"
  }
}

pub fn billing_status_decoder() -> Decoder(BillingStatus) {
  use value <- then(string)
  case value {
    "billingStatusUnspecified" -> success(BillingStatusBillingStatusUnspecified)
    "billingStatusPending" -> success(BillingStatusBillingStatusPending)
    "billingStatusActive" -> success(BillingStatusBillingStatusActive)
    "billingStatusInactive" -> success(BillingStatusBillingStatusInactive)
    _ -> failure(BillingStatusBillingStatusUnspecified, "a valid BillingStatus")
  }
}