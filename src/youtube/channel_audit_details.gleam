//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// The auditDetails object encapsulates channel data that is relevant for YouTube Partners during the audit process.
pub type ChannelAuditDetails {
  ChannelAuditDetails(
    community_guidelines_good_standing: option.Option(Bool),
    content_id_claims_good_standing: option.Option(Bool),
    copyright_strikes_good_standing: option.Option(Bool),
  )
}
