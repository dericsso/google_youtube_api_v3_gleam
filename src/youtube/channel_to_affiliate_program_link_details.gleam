//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Information specific to a creator in an affiliate program linked to a YouTube channel.
pub type ChannelToAffiliateProgramLinkDetails {
  ChannelToAffiliateProgramLinkDetails(
    merchant_id: option.Option(String),
    program_status: option.Option(String),
    status_update_reason: option.Option(String),
    status_update_time: option.Option(String),
  )
}
