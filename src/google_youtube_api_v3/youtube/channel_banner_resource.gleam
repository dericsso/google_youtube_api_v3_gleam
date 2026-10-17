//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A channel banner returned as the response to a channel_banner.insert call.
pub type ChannelBannerResource {
  ChannelBannerResource(
    etag: Option(String),
    kind: Option(String),
    url: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelBannerResource) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field(
    "url",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelBannerResource(etag, kind, url))
}

pub fn to_json(value: ChannelBannerResource) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("url", json.nullable(value.url, json.string)),
    ],
  )
}