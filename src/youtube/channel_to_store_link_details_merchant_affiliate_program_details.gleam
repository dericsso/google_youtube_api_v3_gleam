//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Information specific to merchant affiliate program.
pub type ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails {
  ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails(
    status: option.Option(Status),
  )
}

pub fn decoder() -> Decoder(
  ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
) {
  use status <- optional_field(
    "status",
    option.None,
    optional(status_decoder()),
  )
  success(ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails(status))
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
    StatusMerchantAffiliateProgramStatusUnspecified -> "merchantAffiliateProgramStatusUnspecified"
    StatusMerchantAffiliateProgramStatusEligible -> "merchantAffiliateProgramStatusEligible"
    StatusMerchantAffiliateProgramStatusActive -> "merchantAffiliateProgramStatusActive"
    StatusMerchantAffiliateProgramStatusPaused -> "merchantAffiliateProgramStatusPaused"
  }
}

pub fn status_decoder() -> Decoder(Status) {
  use value <- then(string)
  case value {
    "merchantAffiliateProgramStatusUnspecified" -> success(
      StatusMerchantAffiliateProgramStatusUnspecified,
    )
    "merchantAffiliateProgramStatusEligible" -> success(
      StatusMerchantAffiliateProgramStatusEligible,
    )
    "merchantAffiliateProgramStatusActive" -> success(
      StatusMerchantAffiliateProgramStatusActive,
    )
    "merchantAffiliateProgramStatusPaused" -> success(
      StatusMerchantAffiliateProgramStatusPaused,
    )
    _ -> failure(
      StatusMerchantAffiliateProgramStatusUnspecified,
      "a valid Status",
    )
  }
}