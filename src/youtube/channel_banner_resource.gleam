//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// A channel banner returned as the response to a channel_banner.insert call.
pub type ChannelBannerResource {
  ChannelBannerResource(
    etag: option.Option(String),
    kind: option.Option(String),
    url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelBannerResource) {
  use etag <- optional_field("etag", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use url <- optional_field("url", option.None, optional(string))
  success(ChannelBannerResource(etag, kind, url))
}