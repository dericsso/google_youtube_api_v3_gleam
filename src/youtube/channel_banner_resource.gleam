//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// A channel banner returned as the response to a channel_banner.insert call.
pub type ChannelBannerResource {
  ChannelBannerResource(
    etag: option.Option(String),
    kind: option.Option(String),
    url: option.Option(String),
  )
}
