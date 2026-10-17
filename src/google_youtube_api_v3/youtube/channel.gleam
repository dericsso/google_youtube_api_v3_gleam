import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/localized.{type LocalizedProperty}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/thumbnail.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

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

pub fn channel_decoder() -> Decoder(Channel) {
  use audit_details <- decode.optional_field(
    "auditDetails",
    option.None,
    decode.optional(channel_audit_details_decoder()),
  )
  use branding_settings <- decode.optional_field(
    "brandingSettings",
    option.None,
    decode.optional(channel_branding_settings_decoder()),
  )
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(channel_content_details_decoder()),
  )
  use content_owner_details <- decode.optional_field(
    "contentOwnerDetails",
    option.None,
    decode.optional(channel_content_owner_details_decoder()),
  )
  use conversion_pings <- decode.optional_field(
    "conversionPings",
    option.None,
    decode.optional(channel_conversion_pings_decoder()),
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
    decode.optional(decode.dict(decode.string, channel_localization_decoder())),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(channel_snippet_decoder()),
  )
  use statistics <- decode.optional_field(
    "statistics",
    option.None,
    decode.optional(channel_statistics_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(channel_status_decoder()),
  )
  use topic_details <- decode.optional_field(
    "topicDetails",
    option.None,
    decode.optional(channel_topic_details_decoder()),
  )
  decode.success(Channel(
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
  ))
}

pub fn channel_to_json(value: Channel) -> Json {
  json.object([
    #(
      "auditDetails",
      json.nullable(value.audit_details, channel_audit_details_to_json),
    ),
    #(
      "brandingSettings",
      json.nullable(value.branding_settings, channel_branding_settings_to_json),
    ),
    #(
      "contentDetails",
      json.nullable(value.content_details, channel_content_details_to_json),
    ),
    #(
      "contentOwnerDetails",
      json.nullable(
        value.content_owner_details,
        channel_content_owner_details_to_json,
      ),
    ),
    #(
      "conversionPings",
      json.nullable(value.conversion_pings, channel_conversion_pings_to_json),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "localizations",
      json.nullable(value.localizations, fn(d) {
        json.dict(d, fn(k) { k }, channel_localization_to_json)
      }),
    ),
    #("snippet", json.nullable(value.snippet, channel_snippet_to_json)),
    #("statistics", json.nullable(value.statistics, channel_statistics_to_json)),
    #("status", json.nullable(value.status, channel_status_to_json)),
    #(
      "topicDetails",
      json.nullable(value.topic_details, channel_topic_details_to_json),
    ),
  ])
}

/// The auditDetails object encapsulates channel data that is relevant for YouTube Partners during the audit process.
pub type ChannelAuditDetails {
  ChannelAuditDetails(
    community_guidelines_good_standing: Option(Bool),
    content_id_claims_good_standing: Option(Bool),
    copyright_strikes_good_standing: Option(Bool),
  )
}

pub fn channel_audit_details_decoder() -> Decoder(ChannelAuditDetails) {
  use community_guidelines_good_standing <- decode.optional_field(
    "communityGuidelinesGoodStanding",
    option.None,
    decode.optional(decode.bool),
  )
  use content_id_claims_good_standing <- decode.optional_field(
    "contentIdClaimsGoodStanding",
    option.None,
    decode.optional(decode.bool),
  )
  use copyright_strikes_good_standing <- decode.optional_field(
    "copyrightStrikesGoodStanding",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(ChannelAuditDetails(
    community_guidelines_good_standing,
    content_id_claims_good_standing,
    copyright_strikes_good_standing,
  ))
}

pub fn channel_audit_details_to_json(value: ChannelAuditDetails) -> Json {
  json.object([
    #(
      "communityGuidelinesGoodStanding",
      json.nullable(value.community_guidelines_good_standing, json.bool),
    ),
    #(
      "contentIdClaimsGoodStanding",
      json.nullable(value.content_id_claims_good_standing, json.bool),
    ),
    #(
      "copyrightStrikesGoodStanding",
      json.nullable(value.copyright_strikes_good_standing, json.bool),
    ),
  ])
}

/// A channel banner returned as the response to a channel_banner.insert call.
pub type ChannelBannerResource {
  ChannelBannerResource(
    etag: Option(String),
    kind: Option(String),
    url: Option(String),
  )
}

pub fn channel_banner_resource_decoder() -> Decoder(ChannelBannerResource) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field(
    "url",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelBannerResource(etag, kind, url))
}

pub fn channel_banner_resource_to_json(value: ChannelBannerResource) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("url", json.nullable(value.url, json.string)),
  ])
}

/// Branding properties of a YouTube channel.
pub type ChannelBrandingSettings {
  ChannelBrandingSettings(
    channel: Option(ChannelSettings),
    hints: Option(List(PropertyValue)),
    image: Option(ImageSettings),
    watch: Option(WatchSettings),
  )
}

pub fn channel_branding_settings_decoder() -> Decoder(ChannelBrandingSettings) {
  use channel <- decode.optional_field(
    "channel",
    option.None,
    decode.optional(channel_settings_decoder()),
  )
  use hints <- decode.optional_field(
    "hints",
    option.None,
    decode.optional(decode.list(property_value_decoder())),
  )
  use image <- decode.optional_field(
    "image",
    option.None,
    decode.optional(image_settings_decoder()),
  )
  use watch <- decode.optional_field(
    "watch",
    option.None,
    decode.optional(watch_settings_decoder()),
  )
  decode.success(ChannelBrandingSettings(channel, hints, image, watch))
}

pub fn channel_branding_settings_to_json(
  value: ChannelBrandingSettings,
) -> Json {
  json.object([
    #("channel", json.nullable(value.channel, channel_settings_to_json)),
    #(
      "hints",
      json.nullable(value.hints, fn(items) {
        json.array(items, property_value_to_json)
      }),
    ),
    #("image", json.nullable(value.image, image_settings_to_json)),
    #("watch", json.nullable(value.watch, watch_settings_to_json)),
  ])
}

/// Details about the content of a channel.
pub type ChannelContentDetails {
  ChannelContentDetails(related_playlists: Option(Dict(String, String)))
}

pub fn channel_content_details_decoder() -> Decoder(ChannelContentDetails) {
  use related_playlists <- decode.optional_field(
    "relatedPlaylists",
    option.None,
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  decode.success(ChannelContentDetails(related_playlists))
}

pub fn channel_content_details_to_json(value: ChannelContentDetails) -> Json {
  json.object([
    #(
      "relatedPlaylists",
      json.nullable(value.related_playlists, fn(d) {
        json.dict(d, fn(k) { k }, json.string)
      }),
    ),
  ])
}

/// The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
pub type ChannelContentOwnerDetails {
  ChannelContentOwnerDetails(
    content_owner: Option(String),
    time_linked: Option(String),
  )
}

pub fn channel_content_owner_details_decoder() -> Decoder(
  ChannelContentOwnerDetails,
) {
  use content_owner <- decode.optional_field(
    "contentOwner",
    option.None,
    decode.optional(decode.string),
  )
  use time_linked <- decode.optional_field(
    "timeLinked",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelContentOwnerDetails(content_owner, time_linked))
}

pub fn channel_content_owner_details_to_json(
  value: ChannelContentOwnerDetails,
) -> Json {
  json.object([
    #("contentOwner", json.nullable(value.content_owner, json.string)),
    #("timeLinked", json.nullable(value.time_linked, json.string)),
  ])
}

/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
pub type ChannelConversionPing {
  ChannelConversionPing(
    context: Option(Context),
    conversion_url: Option(String),
  )
}

pub fn channel_conversion_ping_decoder() -> Decoder(ChannelConversionPing) {
  use context <- decode.optional_field(
    "context",
    option.None,
    decode.optional(context_decoder()),
  )
  use conversion_url <- decode.optional_field(
    "conversionUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelConversionPing(context, conversion_url))
}

pub fn channel_conversion_ping_to_json(value: ChannelConversionPing) -> Json {
  json.object([
    #(
      "context",
      json.nullable(value.context, fn(e) { json.string(context_to_string(e)) }),
    ),
    #("conversionUrl", json.nullable(value.conversion_url, json.string)),
  ])
}

/// Defines the context of the ping.
pub type Context {
  ContextSubscribe
  ContextUnsubscribe
  ContextCview
}

pub fn context_to_string(value: Context) -> String {
  case value {
    ContextSubscribe -> "subscribe"
    ContextUnsubscribe -> "unsubscribe"
    ContextCview -> "cview"
  }
}

pub fn context_decoder() -> Decoder(Context) {
  use value <- decode.then(decode.string)
  case value {
    "subscribe" -> decode.success(ContextSubscribe)
    "unsubscribe" -> decode.success(ContextUnsubscribe)
    "cview" -> decode.success(ContextCview)
    _ -> decode.failure(ContextSubscribe, "a valid Context")
  }
}

/// The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
pub type ChannelConversionPings {
  ChannelConversionPings(pings: Option(List(ChannelConversionPing)))
}

pub fn channel_conversion_pings_decoder() -> Decoder(ChannelConversionPings) {
  use pings <- decode.optional_field(
    "pings",
    option.None,
    decode.optional(decode.list(channel_conversion_ping_decoder())),
  )
  decode.success(ChannelConversionPings(pings))
}

pub fn channel_conversion_pings_to_json(value: ChannelConversionPings) -> Json {
  json.object([
    #(
      "pings",
      json.nullable(value.pings, fn(items) {
        json.array(items, channel_conversion_ping_to_json)
      }),
    ),
  ])
}

pub type ChannelListResponse {
  ChannelListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(Channel)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn channel_list_response_decoder() -> Decoder(ChannelListResponse) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(channel_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelListResponse(
    etag,
    event_id,
    items,
    kind,
    next_page_token,
    page_info,
    prev_page_token,
    token_pagination,
    visitor_id,
  ))
}

pub fn channel_list_response_to_json(value: ChannelListResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, channel_to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("nextPageToken", json.nullable(value.next_page_token, json.string)),
    #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
    #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
    #(
      "tokenPagination",
      json.nullable(
        value.token_pagination,
        token_pagination.token_pagination_to_json,
      ),
    ),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}

/// Channel localization setting
pub type ChannelLocalization {
  ChannelLocalization(description: Option(String), title: Option(String))
}

pub fn channel_localization_decoder() -> Decoder(ChannelLocalization) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelLocalization(description, title))
}

pub fn channel_localization_to_json(value: ChannelLocalization) -> Json {
  json.object([
    #("description", json.nullable(value.description, json.string)),
    #("title", json.nullable(value.title, json.string)),
  ])
}

pub type ChannelProfileDetails {
  ChannelProfileDetails(
    channel_id: Option(String),
    channel_url: Option(String),
    display_name: Option(String),
    profile_image_url: Option(String),
  )
}

pub fn channel_profile_details_decoder() -> Decoder(ChannelProfileDetails) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_url <- decode.optional_field(
    "channelUrl",
    option.None,
    decode.optional(decode.string),
  )
  use display_name <- decode.optional_field(
    "displayName",
    option.None,
    decode.optional(decode.string),
  )
  use profile_image_url <- decode.optional_field(
    "profileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelProfileDetails(
    channel_id,
    channel_url,
    display_name,
    profile_image_url,
  ))
}

pub fn channel_profile_details_to_json(value: ChannelProfileDetails) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("channelUrl", json.nullable(value.channel_url, json.string)),
    #("displayName", json.nullable(value.display_name, json.string)),
    #("profileImageUrl", json.nullable(value.profile_image_url, json.string)),
  ])
}

pub type ChannelSection {
  ChannelSection(
    content_details: Option(ChannelSectionContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    localizations: Option(Dict(String, ChannelSectionLocalization)),
    snippet: Option(ChannelSectionSnippet),
    targeting: Option(ChannelSectionTargeting),
  )
}

pub fn channel_section_decoder() -> Decoder(ChannelSection) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(channel_section_content_details_decoder()),
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
    decode.optional(decode.dict(
      decode.string,
      channel_section_localization_decoder(),
    )),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(channel_section_snippet_decoder()),
  )
  use targeting <- decode.optional_field(
    "targeting",
    option.None,
    decode.optional(channel_section_targeting_decoder()),
  )
  decode.success(ChannelSection(
    content_details,
    etag,
    id,
    kind,
    localizations,
    snippet,
    targeting,
  ))
}

pub fn channel_section_to_json(value: ChannelSection) -> Json {
  json.object([
    #(
      "contentDetails",
      json.nullable(
        value.content_details,
        channel_section_content_details_to_json,
      ),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "localizations",
      json.nullable(value.localizations, fn(d) {
        json.dict(d, fn(k) { k }, channel_section_localization_to_json)
      }),
    ),
    #("snippet", json.nullable(value.snippet, channel_section_snippet_to_json)),
    #(
      "targeting",
      json.nullable(value.targeting, channel_section_targeting_to_json),
    ),
  ])
}

/// Details about a channelsection, including playlists and channels.
pub type ChannelSectionContentDetails {
  ChannelSectionContentDetails(
    channels: Option(List(String)),
    playlists: Option(List(String)),
  )
}

pub fn channel_section_content_details_decoder() -> Decoder(
  ChannelSectionContentDetails,
) {
  use channels <- decode.optional_field(
    "channels",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use playlists <- decode.optional_field(
    "playlists",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(ChannelSectionContentDetails(channels, playlists))
}

pub fn channel_section_content_details_to_json(
  value: ChannelSectionContentDetails,
) -> Json {
  json.object([
    #(
      "channels",
      json.nullable(value.channels, fn(items) { json.array(items, json.string) }),
    ),
    #(
      "playlists",
      json.nullable(value.playlists, fn(items) {
        json.array(items, json.string)
      }),
    ),
  ])
}

pub type ChannelSectionListResponse {
  ChannelSectionListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(ChannelSection)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn channel_section_list_response_decoder() -> Decoder(
  ChannelSectionListResponse,
) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(channel_section_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSectionListResponse(
    etag,
    event_id,
    items,
    kind,
    visitor_id,
  ))
}

pub fn channel_section_list_response_to_json(
  value: ChannelSectionListResponse,
) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, channel_section_to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}

/// ChannelSection localization setting
pub type ChannelSectionLocalization {
  ChannelSectionLocalization(title: Option(String))
}

pub fn channel_section_localization_decoder() -> Decoder(
  ChannelSectionLocalization,
) {
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSectionLocalization(title))
}

pub fn channel_section_localization_to_json(
  value: ChannelSectionLocalization,
) -> Json {
  json.object([#("title", json.nullable(value.title, json.string))])
}

/// Basic details about a channel section, including title, style and position.
pub type ChannelSectionSnippet {
  ChannelSectionSnippet(
    channel_id: Option(String),
    default_language: Option(String),
    localized: Option(ChannelSectionLocalization),
    position: Option(Int),
    style: Option(Style),
    title: Option(String),
    type_: Option(Type),
  )
}

pub fn channel_section_snippet_decoder() -> Decoder(ChannelSectionSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(channel_section_localization_decoder()),
  )
  use position <- decode.optional_field(
    "position",
    option.None,
    decode.optional(decode.int),
  )
  use style <- decode.optional_field(
    "style",
    option.None,
    decode.optional(style_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(ChannelSectionSnippet(
    channel_id,
    default_language,
    localized,
    position,
    style,
    title,
    type_,
  ))
}

pub fn channel_section_snippet_to_json(value: ChannelSectionSnippet) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("defaultLanguage", json.nullable(value.default_language, json.string)),
    #(
      "localized",
      json.nullable(value.localized, channel_section_localization_to_json),
    ),
    #("position", json.nullable(value.position, json.int)),
    #(
      "style",
      json.nullable(value.style, fn(e) { json.string(style_to_string(e)) }),
    ),
    #("title", json.nullable(value.title, json.string)),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
  ])
}

/// The style of the channel section.
pub type Style {
  StyleChannelsectionStyleUnspecified
  StyleHorizontalRow
  StyleVerticalList
}

pub fn style_to_string(value: Style) -> String {
  case value {
    StyleChannelsectionStyleUnspecified -> "channelsectionStyleUnspecified"
    StyleHorizontalRow -> "horizontalRow"
    StyleVerticalList -> "verticalList"
  }
}

pub fn style_decoder() -> Decoder(Style) {
  use value <- decode.then(decode.string)
  case value {
    "channelsectionStyleUnspecified" ->
      decode.success(StyleChannelsectionStyleUnspecified)
    "horizontalRow" -> decode.success(StyleHorizontalRow)
    "verticalList" -> decode.success(StyleVerticalList)
    _ -> decode.failure(StyleChannelsectionStyleUnspecified, "a valid Style")
  }
}

/// The type of the channel section.
pub type Type {
  TypeChannelsectionTypeUndefined
  TypeSinglePlaylist
  TypeMultiplePlaylists
  TypePopularUploads
  TypeRecentUploads
  TypeLikes
  TypeAllPlaylists
  TypeLikedPlaylists
  TypeRecentPosts
  TypeRecentActivity
  TypeLiveEvents
  TypeUpcomingEvents
  TypeCompletedEvents
  TypeMultipleChannels
  TypePostedVideos
  TypePostedPlaylists
  TypeSubscriptions
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeChannelsectionTypeUndefined -> "channelsectionTypeUndefined"
    TypeSinglePlaylist -> "singlePlaylist"
    TypeMultiplePlaylists -> "multiplePlaylists"
    TypePopularUploads -> "popularUploads"
    TypeRecentUploads -> "recentUploads"
    TypeLikes -> "likes"
    TypeAllPlaylists -> "allPlaylists"
    TypeLikedPlaylists -> "likedPlaylists"
    TypeRecentPosts -> "recentPosts"
    TypeRecentActivity -> "recentActivity"
    TypeLiveEvents -> "liveEvents"
    TypeUpcomingEvents -> "upcomingEvents"
    TypeCompletedEvents -> "completedEvents"
    TypeMultipleChannels -> "multipleChannels"
    TypePostedVideos -> "postedVideos"
    TypePostedPlaylists -> "postedPlaylists"
    TypeSubscriptions -> "subscriptions"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- decode.then(decode.string)
  case value {
    "channelsectionTypeUndefined" ->
      decode.success(TypeChannelsectionTypeUndefined)
    "singlePlaylist" -> decode.success(TypeSinglePlaylist)
    "multiplePlaylists" -> decode.success(TypeMultiplePlaylists)
    "popularUploads" -> decode.success(TypePopularUploads)
    "recentUploads" -> decode.success(TypeRecentUploads)
    "likes" -> decode.success(TypeLikes)
    "allPlaylists" -> decode.success(TypeAllPlaylists)
    "likedPlaylists" -> decode.success(TypeLikedPlaylists)
    "recentPosts" -> decode.success(TypeRecentPosts)
    "recentActivity" -> decode.success(TypeRecentActivity)
    "liveEvents" -> decode.success(TypeLiveEvents)
    "upcomingEvents" -> decode.success(TypeUpcomingEvents)
    "completedEvents" -> decode.success(TypeCompletedEvents)
    "multipleChannels" -> decode.success(TypeMultipleChannels)
    "postedVideos" -> decode.success(TypePostedVideos)
    "postedPlaylists" -> decode.success(TypePostedPlaylists)
    "subscriptions" -> decode.success(TypeSubscriptions)
    _ -> decode.failure(TypeChannelsectionTypeUndefined, "a valid Type")
  }
}

/// ChannelSection targeting setting.
pub type ChannelSectionTargeting {
  ChannelSectionTargeting(
    countries: Option(List(String)),
    languages: Option(List(String)),
    regions: Option(List(String)),
  )
}

pub fn channel_section_targeting_decoder() -> Decoder(ChannelSectionTargeting) {
  use countries <- decode.optional_field(
    "countries",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use languages <- decode.optional_field(
    "languages",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use regions <- decode.optional_field(
    "regions",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(ChannelSectionTargeting(countries, languages, regions))
}

pub fn channel_section_targeting_to_json(
  value: ChannelSectionTargeting,
) -> Json {
  json.object([
    #(
      "countries",
      json.nullable(value.countries, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "languages",
      json.nullable(value.languages, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "regions",
      json.nullable(value.regions, fn(items) { json.array(items, json.string) }),
    ),
  ])
}

/// Branding properties for the channel view.
pub type ChannelSettings {
  ChannelSettings(
    country: Option(String),
    default_language: Option(String),
    default_tab: Option(String),
    description: Option(String),
    featured_channels_title: Option(String),
    featured_channels_urls: Option(List(String)),
    keywords: Option(String),
    moderate_comments: Option(Bool),
    profile_color: Option(String),
    show_browse_view: Option(Bool),
    show_related_channels: Option(Bool),
    title: Option(String),
    tracking_analytics_account_id: Option(String),
    unsubscribed_trailer: Option(String),
  )
}

pub fn channel_settings_decoder() -> Decoder(ChannelSettings) {
  use country <- decode.optional_field(
    "country",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use default_tab <- decode.optional_field(
    "defaultTab",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use featured_channels_title <- decode.optional_field(
    "featuredChannelsTitle",
    option.None,
    decode.optional(decode.string),
  )
  use featured_channels_urls <- decode.optional_field(
    "featuredChannelsUrls",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use keywords <- decode.optional_field(
    "keywords",
    option.None,
    decode.optional(decode.string),
  )
  use moderate_comments <- decode.optional_field(
    "moderateComments",
    option.None,
    decode.optional(decode.bool),
  )
  use profile_color <- decode.optional_field(
    "profileColor",
    option.None,
    decode.optional(decode.string),
  )
  use show_browse_view <- decode.optional_field(
    "showBrowseView",
    option.None,
    decode.optional(decode.bool),
  )
  use show_related_channels <- decode.optional_field(
    "showRelatedChannels",
    option.None,
    decode.optional(decode.bool),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  use tracking_analytics_account_id <- decode.optional_field(
    "trackingAnalyticsAccountId",
    option.None,
    decode.optional(decode.string),
  )
  use unsubscribed_trailer <- decode.optional_field(
    "unsubscribedTrailer",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSettings(
    country,
    default_language,
    default_tab,
    description,
    featured_channels_title,
    featured_channels_urls,
    keywords,
    moderate_comments,
    profile_color,
    show_browse_view,
    show_related_channels,
    title,
    tracking_analytics_account_id,
    unsubscribed_trailer,
  ))
}

pub fn channel_settings_to_json(value: ChannelSettings) -> Json {
  json.object([
    #("country", json.nullable(value.country, json.string)),
    #("defaultLanguage", json.nullable(value.default_language, json.string)),
    #("defaultTab", json.nullable(value.default_tab, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #(
      "featuredChannelsTitle",
      json.nullable(value.featured_channels_title, json.string),
    ),
    #(
      "featuredChannelsUrls",
      json.nullable(value.featured_channels_urls, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #("keywords", json.nullable(value.keywords, json.string)),
    #("moderateComments", json.nullable(value.moderate_comments, json.bool)),
    #("profileColor", json.nullable(value.profile_color, json.string)),
    #("showBrowseView", json.nullable(value.show_browse_view, json.bool)),
    #(
      "showRelatedChannels",
      json.nullable(value.show_related_channels, json.bool),
    ),
    #("title", json.nullable(value.title, json.string)),
    #(
      "trackingAnalyticsAccountId",
      json.nullable(value.tracking_analytics_account_id, json.string),
    ),
    #(
      "unsubscribedTrailer",
      json.nullable(value.unsubscribed_trailer, json.string),
    ),
  ])
}

/// Basic details about a channel, including title, description and thumbnails.
pub type ChannelSnippet {
  ChannelSnippet(
    country: Option(String),
    custom_url: Option(String),
    default_language: Option(String),
    description: Option(String),
    localized: Option(ChannelLocalization),
    published_at: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn channel_snippet_decoder() -> Decoder(ChannelSnippet) {
  use country <- decode.optional_field(
    "country",
    option.None,
    decode.optional(decode.string),
  )
  use custom_url <- decode.optional_field(
    "customUrl",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(channel_localization_decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail.thumbnail_details_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSnippet(
    country,
    custom_url,
    default_language,
    description,
    localized,
    published_at,
    thumbnails,
    title,
  ))
}

pub fn channel_snippet_to_json(value: ChannelSnippet) -> Json {
  json.object([
    #("country", json.nullable(value.country, json.string)),
    #("customUrl", json.nullable(value.custom_url, json.string)),
    #("defaultLanguage", json.nullable(value.default_language, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #("localized", json.nullable(value.localized, channel_localization_to_json)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #(
      "thumbnails",
      json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
    ),
    #("title", json.nullable(value.title, json.string)),
  ])
}

/// Statistics about a channel: number of subscribers, number of videos in the channel, etc.
pub type ChannelStatistics {
  ChannelStatistics(
    comment_count: Option(String),
    hidden_subscriber_count: Option(Bool),
    subscriber_count: Option(String),
    video_count: Option(String),
    view_count: Option(String),
  )
}

pub fn channel_statistics_decoder() -> Decoder(ChannelStatistics) {
  use comment_count <- decode.optional_field(
    "commentCount",
    option.None,
    decode.optional(decode.string),
  )
  use hidden_subscriber_count <- decode.optional_field(
    "hiddenSubscriberCount",
    option.None,
    decode.optional(decode.bool),
  )
  use subscriber_count <- decode.optional_field(
    "subscriberCount",
    option.None,
    decode.optional(decode.string),
  )
  use video_count <- decode.optional_field(
    "videoCount",
    option.None,
    decode.optional(decode.string),
  )
  use view_count <- decode.optional_field(
    "viewCount",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelStatistics(
    comment_count,
    hidden_subscriber_count,
    subscriber_count,
    video_count,
    view_count,
  ))
}

pub fn channel_statistics_to_json(value: ChannelStatistics) -> Json {
  json.object([
    #("commentCount", json.nullable(value.comment_count, json.string)),
    #(
      "hiddenSubscriberCount",
      json.nullable(value.hidden_subscriber_count, json.bool),
    ),
    #("subscriberCount", json.nullable(value.subscriber_count, json.string)),
    #("videoCount", json.nullable(value.video_count, json.string)),
    #("viewCount", json.nullable(value.view_count, json.string)),
  ])
}

/// JSON template for the status part of a channel.
pub type ChannelStatus {
  ChannelStatus(
    is_channel_monetization_enabled: Option(Bool),
    is_linked: Option(Bool),
    long_uploads_status: Option(LongUploadsStatus),
    made_for_kids: Option(Bool),
    privacy_status: Option(PrivacyStatus),
    self_declared_made_for_kids: Option(Bool),
  )
}

pub fn channel_status_decoder() -> Decoder(ChannelStatus) {
  use is_channel_monetization_enabled <- decode.optional_field(
    "isChannelMonetizationEnabled",
    option.None,
    decode.optional(decode.bool),
  )
  use is_linked <- decode.optional_field(
    "isLinked",
    option.None,
    decode.optional(decode.bool),
  )
  use long_uploads_status <- decode.optional_field(
    "longUploadsStatus",
    option.None,
    decode.optional(long_uploads_status_decoder()),
  )
  use made_for_kids <- decode.optional_field(
    "madeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(privacy_status_decoder()),
  )
  use self_declared_made_for_kids <- decode.optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(ChannelStatus(
    is_channel_monetization_enabled,
    is_linked,
    long_uploads_status,
    made_for_kids,
    privacy_status,
    self_declared_made_for_kids,
  ))
}

pub fn channel_status_to_json(value: ChannelStatus) -> Json {
  json.object([
    #(
      "isChannelMonetizationEnabled",
      json.nullable(value.is_channel_monetization_enabled, json.bool),
    ),
    #("isLinked", json.nullable(value.is_linked, json.bool)),
    #(
      "longUploadsStatus",
      json.nullable(value.long_uploads_status, fn(e) {
        json.string(long_uploads_status_to_string(e))
      }),
    ),
    #("madeForKids", json.nullable(value.made_for_kids, json.bool)),
    #(
      "privacyStatus",
      json.nullable(value.privacy_status, fn(e) {
        json.string(privacy_status_to_string(e))
      }),
    ),
    #(
      "selfDeclaredMadeForKids",
      json.nullable(value.self_declared_made_for_kids, json.bool),
    ),
  ])
}

/// The long uploads status of this channel. See https://support.google.com/youtube/answer/71673 for more information.
pub type LongUploadsStatus {
  LongUploadsStatusLongUploadsUnspecified
  LongUploadsStatusAllowed
  LongUploadsStatusEligible
  LongUploadsStatusDisallowed
}

pub fn long_uploads_status_to_string(value: LongUploadsStatus) -> String {
  case value {
    LongUploadsStatusLongUploadsUnspecified -> "longUploadsUnspecified"
    LongUploadsStatusAllowed -> "allowed"
    LongUploadsStatusEligible -> "eligible"
    LongUploadsStatusDisallowed -> "disallowed"
  }
}

pub fn long_uploads_status_decoder() -> Decoder(LongUploadsStatus) {
  use value <- decode.then(decode.string)
  case value {
    "longUploadsUnspecified" ->
      decode.success(LongUploadsStatusLongUploadsUnspecified)
    "allowed" -> decode.success(LongUploadsStatusAllowed)
    "eligible" -> decode.success(LongUploadsStatusEligible)
    "disallowed" -> decode.success(LongUploadsStatusDisallowed)
    _ ->
      decode.failure(
        LongUploadsStatusLongUploadsUnspecified,
        "a valid LongUploadsStatus",
      )
  }
}

/// Privacy status of the channel.
pub type PrivacyStatus {
  PrivacyStatusPublic
  PrivacyStatusUnlisted
  PrivacyStatusPrivate
}

pub fn privacy_status_to_string(value: PrivacyStatus) -> String {
  case value {
    PrivacyStatusPublic -> "public"
    PrivacyStatusUnlisted -> "unlisted"
    PrivacyStatusPrivate -> "private"
  }
}

pub fn privacy_status_decoder() -> Decoder(PrivacyStatus) {
  use value <- decode.then(decode.string)
  case value {
    "public" -> decode.success(PrivacyStatusPublic)
    "unlisted" -> decode.success(PrivacyStatusUnlisted)
    "private" -> decode.success(PrivacyStatusPrivate)
    _ -> decode.failure(PrivacyStatusPublic, "a valid PrivacyStatus")
  }
}

/// Information specific to a creator in an affiliate program linked to a YouTube channel.
pub type ChannelToAffiliateProgramLinkDetails {
  ChannelToAffiliateProgramLinkDetails(
    merchant_id: Option(String),
    program_status: Option(ProgramStatus),
    status_update_reason: Option(String),
    status_update_time: Option(String),
  )
}

pub fn channel_to_affiliate_program_link_details_decoder() -> Decoder(
  ChannelToAffiliateProgramLinkDetails,
) {
  use merchant_id <- decode.optional_field(
    "merchantId",
    option.None,
    decode.optional(decode.string),
  )
  use program_status <- decode.optional_field(
    "programStatus",
    option.None,
    decode.optional(program_status_decoder()),
  )
  use status_update_reason <- decode.optional_field(
    "statusUpdateReason",
    option.None,
    decode.optional(decode.string),
  )
  use status_update_time <- decode.optional_field(
    "statusUpdateTime",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelToAffiliateProgramLinkDetails(
    merchant_id,
    program_status,
    status_update_reason,
    status_update_time,
  ))
}

pub fn channel_to_affiliate_program_link_details_to_json(
  value: ChannelToAffiliateProgramLinkDetails,
) -> Json {
  json.object([
    #("merchantId", json.nullable(value.merchant_id, json.string)),
    #(
      "programStatus",
      json.nullable(value.program_status, fn(e) {
        json.string(program_status_to_string(e))
      }),
    ),
    #(
      "statusUpdateReason",
      json.nullable(value.status_update_reason, json.string),
    ),
    #("statusUpdateTime", json.nullable(value.status_update_time, json.string)),
  ])
}

/// Required. Affiliate program status.
pub type ProgramStatus {
  ProgramStatusAffiliateProgramStatusUnspecified
  ProgramStatusActive
  ProgramStatusInactive
}

pub fn program_status_to_string(value: ProgramStatus) -> String {
  case value {
    ProgramStatusAffiliateProgramStatusUnspecified ->
      "affiliateProgramStatusUnspecified"
    ProgramStatusActive -> "active"
    ProgramStatusInactive -> "inactive"
  }
}

pub fn program_status_decoder() -> Decoder(ProgramStatus) {
  use value <- decode.then(decode.string)
  case value {
    "affiliateProgramStatusUnspecified" ->
      decode.success(ProgramStatusAffiliateProgramStatusUnspecified)
    "active" -> decode.success(ProgramStatusActive)
    "inactive" -> decode.success(ProgramStatusInactive)
    _ ->
      decode.failure(
        ProgramStatusAffiliateProgramStatusUnspecified,
        "a valid ProgramStatus",
      )
  }
}

/// Information specific to a store on a merchandising platform linked to a YouTube channel.
pub type ChannelToStoreLinkDetails {
  ChannelToStoreLinkDetails(
    billing_details: Option(ChannelToStoreLinkDetailsBillingDetails),
    merchant_affiliate_program_details: Option(
      ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
    ),
    merchant_id: Option(String),
    store_name: Option(String),
    store_url: Option(String),
  )
}

pub fn channel_to_store_link_details_decoder() -> Decoder(
  ChannelToStoreLinkDetails,
) {
  use billing_details <- decode.optional_field(
    "billingDetails",
    option.None,
    decode.optional(channel_to_store_link_details_billing_details_decoder()),
  )
  use merchant_affiliate_program_details <- decode.optional_field(
    "merchantAffiliateProgramDetails",
    option.None,
    decode.optional(
      channel_to_store_link_details_merchant_affiliate_program_details_decoder(),
    ),
  )
  use merchant_id <- decode.optional_field(
    "merchantId",
    option.None,
    decode.optional(decode.string),
  )
  use store_name <- decode.optional_field(
    "storeName",
    option.None,
    decode.optional(decode.string),
  )
  use store_url <- decode.optional_field(
    "storeUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelToStoreLinkDetails(
    billing_details,
    merchant_affiliate_program_details,
    merchant_id,
    store_name,
    store_url,
  ))
}

pub fn channel_to_store_link_details_to_json(
  value: ChannelToStoreLinkDetails,
) -> Json {
  json.object([
    #(
      "billingDetails",
      json.nullable(
        value.billing_details,
        channel_to_store_link_details_billing_details_to_json,
      ),
    ),
    #(
      "merchantAffiliateProgramDetails",
      json.nullable(
        value.merchant_affiliate_program_details,
        channel_to_store_link_details_merchant_affiliate_program_details_to_json,
      ),
    ),
    #("merchantId", json.nullable(value.merchant_id, json.string)),
    #("storeName", json.nullable(value.store_name, json.string)),
    #("storeUrl", json.nullable(value.store_url, json.string)),
  ])
}

/// Information specific to billing.
pub type ChannelToStoreLinkDetailsBillingDetails {
  ChannelToStoreLinkDetailsBillingDetails(billing_status: Option(BillingStatus))
}

pub fn channel_to_store_link_details_billing_details_decoder() -> Decoder(
  ChannelToStoreLinkDetailsBillingDetails,
) {
  use billing_status <- decode.optional_field(
    "billingStatus",
    option.None,
    decode.optional(billing_status_decoder()),
  )
  decode.success(ChannelToStoreLinkDetailsBillingDetails(billing_status))
}

pub fn channel_to_store_link_details_billing_details_to_json(
  value: ChannelToStoreLinkDetailsBillingDetails,
) -> Json {
  json.object([
    #(
      "billingStatus",
      json.nullable(value.billing_status, fn(e) {
        json.string(billing_status_to_string(e))
      }),
    ),
  ])
}

/// The current billing profile status.
pub type BillingStatus {
  BillingStatusBillingStatusUnspecified
  BillingStatusBillingStatusPending
  BillingStatusBillingStatusActive
  BillingStatusBillingStatusInactive
}

pub fn billing_status_to_string(value: BillingStatus) -> String {
  case value {
    BillingStatusBillingStatusUnspecified -> "billingStatusUnspecified"
    BillingStatusBillingStatusPending -> "billingStatusPending"
    BillingStatusBillingStatusActive -> "billingStatusActive"
    BillingStatusBillingStatusInactive -> "billingStatusInactive"
  }
}

pub fn billing_status_decoder() -> Decoder(BillingStatus) {
  use value <- decode.then(decode.string)
  case value {
    "billingStatusUnspecified" ->
      decode.success(BillingStatusBillingStatusUnspecified)
    "billingStatusPending" -> decode.success(BillingStatusBillingStatusPending)
    "billingStatusActive" -> decode.success(BillingStatusBillingStatusActive)
    "billingStatusInactive" ->
      decode.success(BillingStatusBillingStatusInactive)
    _ ->
      decode.failure(
        BillingStatusBillingStatusUnspecified,
        "a valid BillingStatus",
      )
  }
}

/// Information specific to merchant affiliate program.
pub type ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails {
  ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails(
    status: Option(Status),
  )
}

pub fn channel_to_store_link_details_merchant_affiliate_program_details_decoder() -> Decoder(
  ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
) {
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(status_decoder()),
  )
  decode.success(ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails(
    status,
  ))
}

pub fn channel_to_store_link_details_merchant_affiliate_program_details_to_json(
  value: ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
) -> Json {
  json.object([
    #(
      "status",
      json.nullable(value.status, fn(e) { json.string(status_to_string(e)) }),
    ),
  ])
}

/// The current merchant affiliate program status.
pub type Status {
  StatusMerchantAffiliateProgramStatusUnspecified
  StatusMerchantAffiliateProgramStatusEligible
  StatusMerchantAffiliateProgramStatusActive
  StatusMerchantAffiliateProgramStatusPaused
}

pub fn status_to_string(value: Status) -> String {
  case value {
    StatusMerchantAffiliateProgramStatusUnspecified ->
      "merchantAffiliateProgramStatusUnspecified"
    StatusMerchantAffiliateProgramStatusEligible ->
      "merchantAffiliateProgramStatusEligible"
    StatusMerchantAffiliateProgramStatusActive ->
      "merchantAffiliateProgramStatusActive"
    StatusMerchantAffiliateProgramStatusPaused ->
      "merchantAffiliateProgramStatusPaused"
  }
}

pub fn status_decoder() -> Decoder(Status) {
  use value <- decode.then(decode.string)
  case value {
    "merchantAffiliateProgramStatusUnspecified" ->
      decode.success(StatusMerchantAffiliateProgramStatusUnspecified)
    "merchantAffiliateProgramStatusEligible" ->
      decode.success(StatusMerchantAffiliateProgramStatusEligible)
    "merchantAffiliateProgramStatusActive" ->
      decode.success(StatusMerchantAffiliateProgramStatusActive)
    "merchantAffiliateProgramStatusPaused" ->
      decode.success(StatusMerchantAffiliateProgramStatusPaused)
    _ ->
      decode.failure(
        StatusMerchantAffiliateProgramStatusUnspecified,
        "a valid Status",
      )
  }
}

/// Freebase topic information related to the channel.
pub type ChannelTopicDetails {
  ChannelTopicDetails(
    topic_categories: Option(List(String)),
    topic_ids: Option(List(String)),
  )
}

pub fn channel_topic_details_decoder() -> Decoder(ChannelTopicDetails) {
  use topic_categories <- decode.optional_field(
    "topicCategories",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use topic_ids <- decode.optional_field(
    "topicIds",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(ChannelTopicDetails(topic_categories, topic_ids))
}

pub fn channel_topic_details_to_json(value: ChannelTopicDetails) -> Json {
  json.object([
    #(
      "topicCategories",
      json.nullable(value.topic_categories, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "topicIds",
      json.nullable(value.topic_ids, fn(items) {
        json.array(items, json.string)
      }),
    ),
  ])
}

/// Branding properties for images associated with the channel.
pub type ImageSettings {
  ImageSettings(
    background_image_url: Option(LocalizedProperty),
    banner_external_url: Option(String),
    banner_image_url: Option(String),
    banner_mobile_extra_hd_image_url: Option(String),
    banner_mobile_hd_image_url: Option(String),
    banner_mobile_image_url: Option(String),
    banner_mobile_low_image_url: Option(String),
    banner_mobile_medium_hd_image_url: Option(String),
    banner_tablet_extra_hd_image_url: Option(String),
    banner_tablet_hd_image_url: Option(String),
    banner_tablet_image_url: Option(String),
    banner_tablet_low_image_url: Option(String),
    banner_tv_high_image_url: Option(String),
    banner_tv_image_url: Option(String),
    banner_tv_low_image_url: Option(String),
    banner_tv_medium_image_url: Option(String),
    large_branded_banner_image_imap_script: Option(LocalizedProperty),
    large_branded_banner_image_url: Option(LocalizedProperty),
    small_branded_banner_image_imap_script: Option(LocalizedProperty),
    small_branded_banner_image_url: Option(LocalizedProperty),
    tracking_image_url: Option(String),
    watch_icon_image_url: Option(String),
  )
}

pub fn image_settings_decoder() -> Decoder(ImageSettings) {
  use background_image_url <- decode.optional_field(
    "backgroundImageUrl",
    option.None,
    decode.optional(localized.localized_property_decoder()),
  )
  use banner_external_url <- decode.optional_field(
    "bannerExternalUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_image_url <- decode.optional_field(
    "bannerImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_extra_hd_image_url <- decode.optional_field(
    "bannerMobileExtraHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_hd_image_url <- decode.optional_field(
    "bannerMobileHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_image_url <- decode.optional_field(
    "bannerMobileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_low_image_url <- decode.optional_field(
    "bannerMobileLowImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_medium_hd_image_url <- decode.optional_field(
    "bannerMobileMediumHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_extra_hd_image_url <- decode.optional_field(
    "bannerTabletExtraHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_hd_image_url <- decode.optional_field(
    "bannerTabletHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_image_url <- decode.optional_field(
    "bannerTabletImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_low_image_url <- decode.optional_field(
    "bannerTabletLowImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_high_image_url <- decode.optional_field(
    "bannerTvHighImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_image_url <- decode.optional_field(
    "bannerTvImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_low_image_url <- decode.optional_field(
    "bannerTvLowImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_medium_image_url <- decode.optional_field(
    "bannerTvMediumImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use large_branded_banner_image_imap_script <- decode.optional_field(
    "largeBrandedBannerImageImapScript",
    option.None,
    decode.optional(localized.localized_property_decoder()),
  )
  use large_branded_banner_image_url <- decode.optional_field(
    "largeBrandedBannerImageUrl",
    option.None,
    decode.optional(localized.localized_property_decoder()),
  )
  use small_branded_banner_image_imap_script <- decode.optional_field(
    "smallBrandedBannerImageImapScript",
    option.None,
    decode.optional(localized.localized_property_decoder()),
  )
  use small_branded_banner_image_url <- decode.optional_field(
    "smallBrandedBannerImageUrl",
    option.None,
    decode.optional(localized.localized_property_decoder()),
  )
  use tracking_image_url <- decode.optional_field(
    "trackingImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use watch_icon_image_url <- decode.optional_field(
    "watchIconImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ImageSettings(
    background_image_url,
    banner_external_url,
    banner_image_url,
    banner_mobile_extra_hd_image_url,
    banner_mobile_hd_image_url,
    banner_mobile_image_url,
    banner_mobile_low_image_url,
    banner_mobile_medium_hd_image_url,
    banner_tablet_extra_hd_image_url,
    banner_tablet_hd_image_url,
    banner_tablet_image_url,
    banner_tablet_low_image_url,
    banner_tv_high_image_url,
    banner_tv_image_url,
    banner_tv_low_image_url,
    banner_tv_medium_image_url,
    large_branded_banner_image_imap_script,
    large_branded_banner_image_url,
    small_branded_banner_image_imap_script,
    small_branded_banner_image_url,
    tracking_image_url,
    watch_icon_image_url,
  ))
}

pub fn image_settings_to_json(value: ImageSettings) -> Json {
  json.object([
    #(
      "backgroundImageUrl",
      json.nullable(
        value.background_image_url,
        localized.localized_property_to_json,
      ),
    ),
    #(
      "bannerExternalUrl",
      json.nullable(value.banner_external_url, json.string),
    ),
    #("bannerImageUrl", json.nullable(value.banner_image_url, json.string)),
    #(
      "bannerMobileExtraHdImageUrl",
      json.nullable(value.banner_mobile_extra_hd_image_url, json.string),
    ),
    #(
      "bannerMobileHdImageUrl",
      json.nullable(value.banner_mobile_hd_image_url, json.string),
    ),
    #(
      "bannerMobileImageUrl",
      json.nullable(value.banner_mobile_image_url, json.string),
    ),
    #(
      "bannerMobileLowImageUrl",
      json.nullable(value.banner_mobile_low_image_url, json.string),
    ),
    #(
      "bannerMobileMediumHdImageUrl",
      json.nullable(value.banner_mobile_medium_hd_image_url, json.string),
    ),
    #(
      "bannerTabletExtraHdImageUrl",
      json.nullable(value.banner_tablet_extra_hd_image_url, json.string),
    ),
    #(
      "bannerTabletHdImageUrl",
      json.nullable(value.banner_tablet_hd_image_url, json.string),
    ),
    #(
      "bannerTabletImageUrl",
      json.nullable(value.banner_tablet_image_url, json.string),
    ),
    #(
      "bannerTabletLowImageUrl",
      json.nullable(value.banner_tablet_low_image_url, json.string),
    ),
    #(
      "bannerTvHighImageUrl",
      json.nullable(value.banner_tv_high_image_url, json.string),
    ),
    #("bannerTvImageUrl", json.nullable(value.banner_tv_image_url, json.string)),
    #(
      "bannerTvLowImageUrl",
      json.nullable(value.banner_tv_low_image_url, json.string),
    ),
    #(
      "bannerTvMediumImageUrl",
      json.nullable(value.banner_tv_medium_image_url, json.string),
    ),
    #(
      "largeBrandedBannerImageImapScript",
      json.nullable(
        value.large_branded_banner_image_imap_script,
        localized.localized_property_to_json,
      ),
    ),
    #(
      "largeBrandedBannerImageUrl",
      json.nullable(
        value.large_branded_banner_image_url,
        localized.localized_property_to_json,
      ),
    ),
    #(
      "smallBrandedBannerImageImapScript",
      json.nullable(
        value.small_branded_banner_image_imap_script,
        localized.localized_property_to_json,
      ),
    ),
    #(
      "smallBrandedBannerImageUrl",
      json.nullable(
        value.small_branded_banner_image_url,
        localized.localized_property_to_json,
      ),
    ),
    #("trackingImageUrl", json.nullable(value.tracking_image_url, json.string)),
    #(
      "watchIconImageUrl",
      json.nullable(value.watch_icon_image_url, json.string),
    ),
  ])
}

/// A pair Property / Value.
pub type PropertyValue {
  PropertyValue(property: Option(String), value: Option(String))
}

pub fn property_value_decoder() -> Decoder(PropertyValue) {
  use property <- decode.optional_field(
    "property",
    option.None,
    decode.optional(decode.string),
  )
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PropertyValue(property, value))
}

pub fn property_value_to_json(value: PropertyValue) -> Json {
  json.object([
    #("property", json.nullable(value.property, json.string)),
    #("value", json.nullable(value.value, json.string)),
  ])
}

/// Branding properties for the watch. All deprecated.
pub type WatchSettings {
  WatchSettings(
    background_color: Option(String),
    featured_playlist_id: Option(String),
    text_color: Option(String),
  )
}

pub fn watch_settings_decoder() -> Decoder(WatchSettings) {
  use background_color <- decode.optional_field(
    "backgroundColor",
    option.None,
    decode.optional(decode.string),
  )
  use featured_playlist_id <- decode.optional_field(
    "featuredPlaylistId",
    option.None,
    decode.optional(decode.string),
  )
  use text_color <- decode.optional_field(
    "textColor",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(WatchSettings(
    background_color,
    featured_playlist_id,
    text_color,
  ))
}

pub fn watch_settings_to_json(value: WatchSettings) -> Json {
  json.object([
    #("backgroundColor", json.nullable(value.background_color, json.string)),
    #(
      "featuredPlaylistId",
      json.nullable(value.featured_playlist_id, json.string),
    ),
    #("textColor", json.nullable(value.text_color, json.string)),
  ])
}
