//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/third_party_link.{type ThirdPartyLink}

pub type ThirdPartyLinkListResponse {
  ThirdPartyLinkListResponse(
    etag: option.Option(String),
    items: option.Option(List(ThirdPartyLink)),
    kind: option.Option(String),
  )
}
