//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, bool, success}
import gleam/option

/// The auditDetails object encapsulates channel data that is relevant for YouTube Partners during the audit process.
pub type ChannelAuditDetails {
  ChannelAuditDetails(
    community_guidelines_good_standing: option.Option(Bool),
    content_id_claims_good_standing: option.Option(Bool),
    copyright_strikes_good_standing: option.Option(Bool),
  )
}

pub fn decoder() -> Decoder(ChannelAuditDetails) {
  use community_guidelines_good_standing <- optional_field(
    "communityGuidelinesGoodStanding",
    option.None,
    optional(bool),
  )
  use content_id_claims_good_standing <- optional_field(
    "contentIdClaimsGoodStanding",
    option.None,
    optional(bool),
  )
  use copyright_strikes_good_standing <- optional_field(
    "copyrightStrikesGoodStanding",
    option.None,
    optional(bool),
  )
  success(
    ChannelAuditDetails(
      community_guidelines_good_standing,
      content_id_claims_good_standing,
      copyright_strikes_good_standing,
    ),
  )
}