//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// JSON template for the status part of a channel.
pub type ChannelStatus {
  ChannelStatus(
    is_channel_monetization_enabled: option.Option(Bool),
    is_linked: option.Option(Bool),
    long_uploads_status: option.Option(String),
    made_for_kids: option.Option(Bool),
    privacy_status: option.Option(String),
    self_declared_made_for_kids: option.Option(Bool),
  )
}
