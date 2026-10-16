//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/option
import youtube/channel_section_content_details.{
  type ChannelSectionContentDetails,
}
import youtube/channel_section_localization.{type ChannelSectionLocalization}
import youtube/channel_section_snippet.{type ChannelSectionSnippet}
import youtube/channel_section_targeting.{type ChannelSectionTargeting}

pub type ChannelSection {
  ChannelSection(
    content_details: option.Option(ChannelSectionContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    localizations: option.Option(Dict(String, ChannelSectionLocalization)),
    snippet: option.Option(ChannelSectionSnippet),
    targeting: option.Option(ChannelSectionTargeting),
  )
}
