//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_section_localization.{type ChannelSectionLocalization}

/// Basic details about a channel section, including title, style and position.
pub type ChannelSectionSnippet {
  ChannelSectionSnippet(
    channel_id: option.Option(String),
    default_language: option.Option(String),
    localized: option.Option(ChannelSectionLocalization),
    position: option.Option(Int),
    style: option.Option(String),
    title: option.Option(String),
    type_: option.Option(String),
  )
}
