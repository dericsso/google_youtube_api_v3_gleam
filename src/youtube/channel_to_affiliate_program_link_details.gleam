//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Information specific to a creator in an affiliate program linked to a YouTube channel.
pub type ChannelToAffiliateProgramLinkDetails {
  ChannelToAffiliateProgramLinkDetails(
    merchant_id: option.Option(String),
    program_status: option.Option(ProgramStatus),
    status_update_reason: option.Option(String),
    status_update_time: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelToAffiliateProgramLinkDetails) {
  use merchant_id <- optional_field("merchantId", option.None, optional(string))
  use program_status <- optional_field(
    "programStatus",
    option.None,
    optional(program_status_decoder()),
  )
  use status_update_reason <- optional_field(
    "statusUpdateReason",
    option.None,
    optional(string),
  )
  use status_update_time <- optional_field(
    "statusUpdateTime",
    option.None,
    optional(string),
  )
  success(
    ChannelToAffiliateProgramLinkDetails(
      merchant_id,
      program_status,
      status_update_reason,
      status_update_time,
    ),
  )
}

/// Required. Affiliate program status.
pub type ProgramStatus {
  ProgramStatusAffiliateProgramStatusUnspecified
  ProgramStatusActive
  ProgramStatusInactive
}

pub fn program_status_to_string(value: ProgramStatus) -> String {
  case value {
    ProgramStatusAffiliateProgramStatusUnspecified -> "affiliateProgramStatusUnspecified"
    ProgramStatusActive -> "active"
    ProgramStatusInactive -> "inactive"
  }
}

pub fn program_status_decoder() -> Decoder(ProgramStatus) {
  use value <- then(string)
  case value {
    "affiliateProgramStatusUnspecified" -> success(
      ProgramStatusAffiliateProgramStatusUnspecified,
    )
    "active" -> success(ProgramStatusActive)
    "inactive" -> success(ProgramStatusInactive)
    _ -> failure(
      ProgramStatusAffiliateProgramStatusUnspecified,
      "a valid ProgramStatus",
    )
  }
}