//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_audit_details.{type ChannelAuditDetails}
import google_youtube_api_v3/youtube/channel_branding_settings.{type ChannelBrandingSettings}
import google_youtube_api_v3/youtube/channel_content_details.{type ChannelContentDetails}
import google_youtube_api_v3/youtube/channel_content_owner_details.{type ChannelContentOwnerDetails}
import google_youtube_api_v3/youtube/channel_conversion_pings.{type ChannelConversionPings}
import google_youtube_api_v3/youtube/channel_localization.{type ChannelLocalization}
import google_youtube_api_v3/youtube/channel_snippet.{type ChannelSnippet}
import google_youtube_api_v3/youtube/channel_statistics.{type ChannelStatistics}
import google_youtube_api_v3/youtube/channel_status.{type ChannelStatus}
import google_youtube_api_v3/youtube/channel_topic_details.{type ChannelTopicDetails}

/// A *channel* resource contains information about a YouTube channel.
pub type Channel {
  Channel(
    audit_details: Option(ChannelAuditDetails),
    branding_settings: Option(ChannelBrandingSettings),
    content_details: Option(ChannelContentDetails),
    content_owner_details: Option(ChannelContentOwnerDetails),
    conversion_pings: Option(ChannelConversionPings),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    localizations: Option(Dict(String, ChannelLocalization)),
    snippet: Option(ChannelSnippet),
    statistics: Option(ChannelStatistics),
    status: Option(ChannelStatus),
    topic_details: Option(ChannelTopicDetails),
  )
}

pub fn decoder() -> Decoder(Channel) {
  use audit_details <- decode.optional_field(
    "auditDetails",
    option.None,
    decode.optional(channel_audit_details.decoder()),
  )
  use branding_settings <- decode.optional_field(
    "brandingSettings",
    option.None,
    decode.optional(channel_branding_settings.decoder()),
  )
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(channel_content_details.decoder()),
  )
  use content_owner_details <- decode.optional_field(
    "contentOwnerDetails",
    option.None,
    decode.optional(channel_content_owner_details.decoder()),
  )
  use conversion_pings <- decode.optional_field(
    "conversionPings",
    option.None,
    decode.optional(channel_conversion_pings.decoder()),
  )
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use localizations <- decode.optional_field(
    "localizations",
    option.None,
    decode.optional(decode.dict(decode.string, channel_localization.decoder())),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(channel_snippet.decoder()),
  )
  use statistics <- decode.optional_field(
    "statistics",
    option.None,
    decode.optional(channel_statistics.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(channel_status.decoder()),
  )
  use topic_details <- decode.optional_field(
    "topicDetails",
    option.None,
    decode.optional(channel_topic_details.decoder()),
  )
  decode.success(
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

pub fn to_json(value: Channel) -> Json {
  json.object(
    [
      #(
        "auditDetails",
        json.nullable(value.audit_details, channel_audit_details.to_json),
      ),
      #(
        "brandingSettings",
        json.nullable(
          value.branding_settings,
          channel_branding_settings.to_json,
        ),
      ),
      #(
        "contentDetails",
        json.nullable(value.content_details, channel_content_details.to_json),
      ),
      #(
        "contentOwnerDetails",
        json.nullable(
          value.content_owner_details,
          channel_content_owner_details.to_json,
        ),
      ),
      #(
        "conversionPings",
        json.nullable(value.conversion_pings, channel_conversion_pings.to_json),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "localizations",
        json.nullable(
          value.localizations,
          fn(d)
          { json.dict(d, fn(k) { k }, channel_localization.to_json) },
        ),
      ),
      #("snippet", json.nullable(value.snippet, channel_snippet.to_json)),
      #(
        "statistics",
        json.nullable(value.statistics, channel_statistics.to_json),
      ),
      #("status", json.nullable(value.status, channel_status.to_json)),
      #(
        "topicDetails",
        json.nullable(value.topic_details, channel_topic_details.to_json),
      ),
    ],
  )
}