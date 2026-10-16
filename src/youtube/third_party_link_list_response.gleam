//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/third_party_link.{type ThirdPartyLink}

pub type ThirdPartyLinkListResponse {
  ThirdPartyLinkListResponse(
    etag: option.Option(String),
    items: option.Option(List(ThirdPartyLink)),
    kind: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ThirdPartyLinkListResponse) {
  use etag <- optional_field("etag", option.None, optional(string))
  use items <- optional_field(
    "items",
    option.None,
    optional(list(third_party_link.decoder())),
  )
  use kind <- optional_field("kind", option.None, optional(string))
  success(ThirdPartyLinkListResponse(etag, items, kind))
}