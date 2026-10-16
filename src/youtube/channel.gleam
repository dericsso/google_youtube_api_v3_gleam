//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, dict, success}
import gleam/option
import youtube/channel_audit_details.{type ChannelAuditDetails}
import youtube/channel_branding_settings.{type ChannelBrandingSettings}
import youtube/channel_content_details.{type ChannelContentDetails}
import youtube/channel_content_owner_details.{type ChannelContentOwnerDetails}
import youtube/channel_conversion_pings.{type ChannelConversionPings}
import youtube/channel_localization.{type ChannelLocalization}
import youtube/channel_snippet.{type ChannelSnippet}
import youtube/channel_statistics.{type ChannelStatistics}
import youtube/channel_status.{type ChannelStatus}
import youtube/channel_topic_details.{type ChannelTopicDetails}

/// A *channel* resource contains information about a YouTube channel.
pub type Channel {
  Channel(
    audit_details: option.Option(ChannelAuditDetails),
    branding_settings: option.Option(ChannelBrandingSettings),
    content_details: option.Option(ChannelContentDetails),
    content_owner_details: option.Option(ChannelContentOwnerDetails),
    conversion_pings: option.Option(ChannelConversionPings),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    localizations: option.Option(Dict(String, ChannelLocalization)),
    snippet: option.Option(ChannelSnippet),
    statistics: option.Option(ChannelStatistics),
    status: option.Option(ChannelStatus),
    topic_details: option.Option(ChannelTopicDetails),
  )
}

pub fn decoder() -> Decoder(Channel) {
  use audit_details <- optional_field(
    "auditDetails",
    option.None,
    optional(channel_audit_details.decoder()),
  )
  use branding_settings <- optional_field(
    "brandingSettings",
    option.None,
    optional(channel_branding_settings.decoder()),
  )
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(channel_content_details.decoder()),
  )
  use content_owner_details <- optional_field(
    "contentOwnerDetails",
    option.None,
    optional(channel_content_owner_details.decoder()),
  )
  use conversion_pings <- optional_field(
    "conversionPings",
    option.None,
    optional(channel_conversion_pings.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use localizations <- optional_field(
    "localizations",
    option.None,
    optional(dict(string, channel_localization.decoder())),
  )
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(channel_snippet.decoder()),
  )
  use statistics <- optional_field(
    "statistics",
    option.None,
    optional(channel_statistics.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(channel_status.decoder()),
  )
  use topic_details <- optional_field(
    "topicDetails",
    option.None,
    optional(channel_topic_details.decoder()),
  )
  success(
    Channel(
      audit_details,
      branding_settings,
      content_details,
      content_owner_details,
      conversion_pings,
      etag,
      id,
      kind,
      localizations,
      snippet,
      statistics,
      status,
      topic_details,
    ),
  )
}