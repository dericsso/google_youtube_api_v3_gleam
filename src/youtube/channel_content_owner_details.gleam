//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
pub type ChannelContentOwnerDetails {
  ChannelContentOwnerDetails(
    content_owner: option.Option(String),
    time_linked: option.Option(String),
  )
}
