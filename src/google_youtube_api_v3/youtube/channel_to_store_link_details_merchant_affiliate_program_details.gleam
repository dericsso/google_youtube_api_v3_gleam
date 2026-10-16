//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information specific to merchant affiliate program.
pub type ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails {
  ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails(
    status: Option(Status),
  )
}

pub fn decoder() -> Decoder(
  ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
) {
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(status_decoder()),
  )
  decode.success(ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails(
    status,
  ))
}

pub fn to_json(
  value: ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
) -> Json {
  json.object([
    #(
      "status",
      json.nullable(value.status, fn(e) { json.string(status_to_string(e)) }),
    ),
  ])
}

/// The current merchant affiliate program status.
pub type Status {
  StatusMerchantAffiliateProgramStatusUnspecified
  StatusMerchantAffiliateProgramStatusEligible
  StatusMerchantAffiliateProgramStatusActive
  StatusMerchantAffiliateProgramStatusPaused
}

pub fn status_to_string(value: Status) -> String {
  case value {
    StatusMerchantAffiliateProgramStatusUnspecified ->
      "merchantAffiliateProgramStatusUnspecified"
    StatusMerchantAffiliateProgramStatusEligible ->
      "merchantAffiliateProgramStatusEligible"
    StatusMerchantAffiliateProgramStatusActive ->
      "merchantAffiliateProgramStatusActive"
    StatusMerchantAffiliateProgramStatusPaused ->
      "merchantAffiliateProgramStatusPaused"
  }
}

pub fn status_decoder() -> Decoder(Status) {
  use value <- decode.then(decode.string)
  case value {
    "merchantAffiliateProgramStatusUnspecified" ->
      decode.success(StatusMerchantAffiliateProgramStatusUnspecified)
    "merchantAffiliateProgramStatusEligible" ->
      decode.success(StatusMerchantAffiliateProgramStatusEligible)
    "merchantAffiliateProgramStatusActive" ->
      decode.success(StatusMerchantAffiliateProgramStatusActive)
    "merchantAffiliateProgramStatusPaused" ->
      decode.success(StatusMerchantAffiliateProgramStatusPaused)
    _ ->
      decode.failure(
        StatusMerchantAffiliateProgramStatusUnspecified,
        "a valid Status",
      )
  }
}
