//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, dict, success}
import gleam/option
import youtube/channel_section_content_details.{type ChannelSectionContentDetails}
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

pub fn decoder() -> Decoder(ChannelSection) {
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(channel_section_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use localizations <- optional_field(
    "localizations",
    option.None,
    optional(dict(string, channel_section_localization.decoder())),
  )
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(channel_section_snippet.decoder()),
  )
  use targeting <- optional_field(
    "targeting",
    option.None,
    optional(channel_section_targeting.decoder()),
  )
  success(
    ChannelSection(
      content_details,
      etag,
      id,
      kind,
      localizations,
      snippet,
      targeting,
    ),
  )
}