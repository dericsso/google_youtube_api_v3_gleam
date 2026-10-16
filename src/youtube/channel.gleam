//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
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
