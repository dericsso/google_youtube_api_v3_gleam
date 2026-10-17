//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information specific to billing.
pub type ChannelToStoreLinkDetailsBillingDetails {
  ChannelToStoreLinkDetailsBillingDetails(billing_status: Option(BillingStatus))
}

pub fn decoder() -> Decoder(ChannelToStoreLinkDetailsBillingDetails) {
  use billing_status <- decode.optional_field(
    "billingStatus",
    option.None,
    decode.optional(billing_status_decoder()),
  )
  decode.success(ChannelToStoreLinkDetailsBillingDetails(billing_status))
}

pub fn to_json(value: ChannelToStoreLinkDetailsBillingDetails) -> Json {
  json.object(
    [
      #(
        "billingStatus",
        json.nullable(
          value.billing_status,
          fn(e)
          { json.string(billing_status_to_string(e)) },
        ),
      ),
    ],
  )
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
  use value <- decode.then(decode.string)
  case value {
    "billingStatusUnspecified" -> decode.success(
      BillingStatusBillingStatusUnspecified,
    )
    "billingStatusPending" -> decode.success(BillingStatusBillingStatusPending)
    "billingStatusActive" -> decode.success(BillingStatusBillingStatusActive)
    "billingStatusInactive" -> decode.success(
      BillingStatusBillingStatusInactive,
    )
    _ -> decode.failure(
      BillingStatusBillingStatusUnspecified,
      "a valid BillingStatus",
    )
  }
}