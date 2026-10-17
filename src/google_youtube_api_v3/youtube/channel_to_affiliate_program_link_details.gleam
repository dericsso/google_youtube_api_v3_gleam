//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information specific to a creator in an affiliate program linked to a YouTube channel.
pub type ChannelToAffiliateProgramLinkDetails {
  ChannelToAffiliateProgramLinkDetails(
    merchant_id: Option(String),
    program_status: Option(ProgramStatus),
    status_update_reason: Option(String),
    status_update_time: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelToAffiliateProgramLinkDetails) {
  use merchant_id <- decode.optional_field(
    "merchantId",
    option.None,
    decode.optional(decode.string),
  )
  use program_status <- decode.optional_field(
    "programStatus",
    option.None,
    decode.optional(program_status_decoder()),
  )
  use status_update_reason <- decode.optional_field(
    "statusUpdateReason",
    option.None,
    decode.optional(decode.string),
  )
  use status_update_time <- decode.optional_field(
    "statusUpdateTime",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    ChannelToAffiliateProgramLinkDetails(
      merchant_id,
      program_status,
      status_update_reason,
      status_update_time,
    ),
  )
}

pub fn to_json(value: ChannelToAffiliateProgramLinkDetails) -> Json {
  json.object(
    [
      #("merchantId", json.nullable(value.merchant_id, json.string)),
      #(
        "programStatus",
        json.nullable(
          value.program_status,
          fn(e)
          { json.string(program_status_to_string(e)) },
        ),
      ),
      #(
        "statusUpdateReason",
        json.nullable(value.status_update_reason, json.string),
      ),
      #(
        "statusUpdateTime",
        json.nullable(value.status_update_time, json.string),
      ),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "affiliateProgramStatusUnspecified" -> decode.success(
      ProgramStatusAffiliateProgramStatusUnspecified,
    )
    "active" -> decode.success(ProgramStatusActive)
    "inactive" -> decode.success(ProgramStatusInactive)
    _ -> decode.failure(
      ProgramStatusAffiliateProgramStatusUnspecified,
      "a valid ProgramStatus",
    )
  }
}