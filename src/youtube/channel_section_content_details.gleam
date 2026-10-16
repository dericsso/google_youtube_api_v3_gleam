//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about a channelsection, including playlists and channels.
pub type ChannelSectionContentDetails {
  ChannelSectionContentDetails(
    channels: option.Option(List(String)),
    playlists: option.Option(List(String)),
  )
}
