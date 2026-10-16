//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// The auditDetails object encapsulates channel data that is relevant for YouTube Partners during the audit process.
pub type ChannelAuditDetails {
  ChannelAuditDetails(
    community_guidelines_good_standing: Option(Bool),
    content_id_claims_good_standing: Option(Bool),
    copyright_strikes_good_standing: Option(Bool),
  )
}

pub fn decoder() -> Decoder(ChannelAuditDetails) {
  use community_guidelines_good_standing <- decode.optional_field(
    "communityGuidelinesGoodStanding",
    option.None,
    decode.optional(decode.bool),
  )
  use content_id_claims_good_standing <- decode.optional_field(
    "contentIdClaimsGoodStanding",
    option.None,
    decode.optional(decode.bool),
  )
  use copyright_strikes_good_standing <- decode.optional_field(
    "copyrightStrikesGoodStanding",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(ChannelAuditDetails(
    community_guidelines_good_standing,
    content_id_claims_good_standing,
    copyright_strikes_good_standing,
  ))
}

pub fn to_json(value: ChannelAuditDetails) -> Json {
  json.object([
    #(
      "communityGuidelinesGoodStanding",
      json.nullable(value.community_guidelines_good_standing, json.bool),
    ),
    #(
      "contentIdClaimsGoodStanding",
      json.nullable(value.content_id_claims_good_standing, json.bool),
    ),
    #(
      "copyrightStrikesGoodStanding",
      json.nullable(value.copyright_strikes_good_standing, json.bool),
    ),
  ])
}
