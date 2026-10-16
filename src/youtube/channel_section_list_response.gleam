//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_section.{type ChannelSection}

pub type ChannelSectionListResponse {
  ChannelSectionListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(ChannelSection)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
