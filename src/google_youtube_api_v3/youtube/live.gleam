import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/availability.{type AvailabilityConfig}
import google_youtube_api_v3/youtube/channel.{type ChannelProfileDetails}
import google_youtube_api_v3/youtube/cuepoint.{type CuepointSchedule}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/super.{type SuperStickerMetadata}
import google_youtube_api_v3/youtube/thumbnail.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

/// Brief description of the live stream cdn settings.
pub type CdnSettings {
  CdnSettings(
    format: Option(String),
    frame_rate: Option(FrameRate),
    ingestion_info: Option(IngestionInfo),
    ingestion_type: Option(IngestionType),
    resolution: Option(Resolution),
  )
}

pub fn cdn_settings_decoder() -> Decoder(CdnSettings) {
  use format <- decode.optional_field(
    "format",
    option.None,
    decode.optional(decode.string),
  )
  use frame_rate <- decode.optional_field(
    "frameRate",
    option.None,
    decode.optional(frame_rate_decoder()),
  )
  use ingestion_info <- decode.optional_field(
    "ingestionInfo",
    option.None,
    decode.optional(ingestion_info_decoder()),
  )
  use ingestion_type <- decode.optional_field(
    "ingestionType",
    option.None,
    decode.optional(ingestion_type_decoder()),
  )
  use resolution <- decode.optional_field(
    "resolution",
    option.None,
    decode.optional(resolution_decoder()),
  )
  decode.success(CdnSettings(
    format,
    frame_rate,
    ingestion_info,
    ingestion_type,
    resolution,
  ))
}

pub fn cdn_settings_to_json(value: CdnSettings) -> Json {
  json.object([
    #("format", json.nullable(value.format, json.string)),
    #(
      "frameRate",
      json.nullable(value.frame_rate, fn(e) {
        json.string(frame_rate_to_string(e))
      }),
    ),
    #(
      "ingestionInfo",
      json.nullable(value.ingestion_info, ingestion_info_to_json),
    ),
    #(
      "ingestionType",
      json.nullable(value.ingestion_type, fn(e) {
        json.string(ingestion_type_to_string(e))
      }),
    ),
    #(
      "resolution",
      json.nullable(value.resolution, fn(e) {
        json.string(resolution_to_string(e))
      }),
    ),
  ])
}

/// The frame rate of the inbound video data.
pub type FrameRate {
  FrameRateValue30fps
  FrameRateValue60fps
  FrameRateVariable
}

pub fn frame_rate_to_string(value: FrameRate) -> String {
  case value {
    FrameRateValue30fps -> "30fps"
    FrameRateValue60fps -> "60fps"
    FrameRateVariable -> "variable"
  }
}

pub fn frame_rate_decoder() -> Decoder(FrameRate) {
  use value <- decode.then(decode.string)
  case value {
    "30fps" -> decode.success(FrameRateValue30fps)
    "60fps" -> decode.success(FrameRateValue60fps)
    "variable" -> decode.success(FrameRateVariable)
    _ -> decode.failure(FrameRateValue30fps, "a valid FrameRate")
  }
}

///  The method or protocol used to transmit the video stream.
pub type IngestionType {
  IngestionTypeRtmp
  IngestionTypeDash
  IngestionTypeWebrtc
  IngestionTypeHls
}

pub fn ingestion_type_to_string(value: IngestionType) -> String {
  case value {
    IngestionTypeRtmp -> "rtmp"
    IngestionTypeDash -> "dash"
    IngestionTypeWebrtc -> "webrtc"
    IngestionTypeHls -> "hls"
  }
}

pub fn ingestion_type_decoder() -> Decoder(IngestionType) {
  use value <- decode.then(decode.string)
  case value {
    "rtmp" -> decode.success(IngestionTypeRtmp)
    "dash" -> decode.success(IngestionTypeDash)
    "webrtc" -> decode.success(IngestionTypeWebrtc)
    "hls" -> decode.success(IngestionTypeHls)
    _ -> decode.failure(IngestionTypeRtmp, "a valid IngestionType")
  }
}

/// The resolution of the inbound video data.
pub type Resolution {
  ResolutionValue240p
  ResolutionValue360p
  ResolutionValue480p
  ResolutionValue720p
  ResolutionValue1080p
  ResolutionValue1440p
  ResolutionValue2160p
  ResolutionVariable
}

pub fn resolution_to_string(value: Resolution) -> String {
  case value {
    ResolutionValue240p -> "240p"
    ResolutionValue360p -> "360p"
    ResolutionValue480p -> "480p"
    ResolutionValue720p -> "720p"
    ResolutionValue1080p -> "1080p"
    ResolutionValue1440p -> "1440p"
    ResolutionValue2160p -> "2160p"
    ResolutionVariable -> "variable"
  }
}

pub fn resolution_decoder() -> Decoder(Resolution) {
  use value <- decode.then(decode.string)
  case value {
    "240p" -> decode.success(ResolutionValue240p)
    "360p" -> decode.success(ResolutionValue360p)
    "480p" -> decode.success(ResolutionValue480p)
    "720p" -> decode.success(ResolutionValue720p)
    "1080p" -> decode.success(ResolutionValue1080p)
    "1440p" -> decode.success(ResolutionValue1440p)
    "2160p" -> decode.success(ResolutionValue2160p)
    "variable" -> decode.success(ResolutionVariable)
    _ -> decode.failure(ResolutionValue240p, "a valid Resolution")
  }
}

/// Describes information necessary for ingesting an RTMP, HTTP, or SRT stream.
pub type IngestionInfo {
  IngestionInfo(
    backup_ingestion_address: Option(String),
    ingestion_address: Option(String),
    rtmps_backup_ingestion_address: Option(String),
    rtmps_ingestion_address: Option(String),
    stream_name: Option(String),
  )
}

pub fn ingestion_info_decoder() -> Decoder(IngestionInfo) {
  use backup_ingestion_address <- decode.optional_field(
    "backupIngestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use ingestion_address <- decode.optional_field(
    "ingestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use rtmps_backup_ingestion_address <- decode.optional_field(
    "rtmpsBackupIngestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use rtmps_ingestion_address <- decode.optional_field(
    "rtmpsIngestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use stream_name <- decode.optional_field(
    "streamName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(IngestionInfo(
    backup_ingestion_address,
    ingestion_address,
    rtmps_backup_ingestion_address,
    rtmps_ingestion_address,
    stream_name,
  ))
}

pub fn ingestion_info_to_json(value: IngestionInfo) -> Json {
  json.object([
    #(
      "backupIngestionAddress",
      json.nullable(value.backup_ingestion_address, json.string),
    ),
    #("ingestionAddress", json.nullable(value.ingestion_address, json.string)),
    #(
      "rtmpsBackupIngestionAddress",
      json.nullable(value.rtmps_backup_ingestion_address, json.string),
    ),
    #(
      "rtmpsIngestionAddress",
      json.nullable(value.rtmps_ingestion_address, json.string),
    ),
    #("streamName", json.nullable(value.stream_name, json.string)),
  ])
}

/// A *liveBroadcast* resource represents an event that will be streamed, via live video, on YouTube.
pub type LiveBroadcast {
  LiveBroadcast(
    content_details: Option(LiveBroadcastContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    monetization_details: Option(LiveBroadcastMonetizationDetails),
    snippet: Option(LiveBroadcastSnippet),
    statistics: Option(LiveBroadcastStatistics),
    status: Option(LiveBroadcastStatus),
  )
}

pub fn live_broadcast_decoder() -> Decoder(LiveBroadcast) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(live_broadcast_content_details_decoder()),
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
  use monetization_details <- decode.optional_field(
    "monetizationDetails",
    option.None,
    decode.optional(live_broadcast_monetization_details_decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_broadcast_snippet_decoder()),
  )
  use statistics <- decode.optional_field(
    "statistics",
    option.None,
    decode.optional(live_broadcast_statistics_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(live_broadcast_status_decoder()),
  )
  decode.success(LiveBroadcast(
    content_details,
    etag,
    id,
    kind,
    monetization_details,
    snippet,
    statistics,
    status,
  ))
}

pub fn live_broadcast_to_json(value: LiveBroadcast) -> Json {
  json.object([
    #(
      "contentDetails",
      json.nullable(
        value.content_details,
        live_broadcast_content_details_to_json,
      ),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "monetizationDetails",
      json.nullable(
        value.monetization_details,
        live_broadcast_monetization_details_to_json,
      ),
    ),
    #("snippet", json.nullable(value.snippet, live_broadcast_snippet_to_json)),
    #(
      "statistics",
      json.nullable(value.statistics, live_broadcast_statistics_to_json),
    ),
    #("status", json.nullable(value.status, live_broadcast_status_to_json)),
  ])
}

/// Detailed settings of a broadcast.
pub type LiveBroadcastContentDetails {
  LiveBroadcastContentDetails(
    availability_config: Option(AvailabilityConfig),
    bound_stream_id: Option(String),
    bound_stream_last_update_time_ms: Option(String),
    closed_captions_type: Option(ClosedCaptionsType),
    enable_auto_start: Option(Bool),
    enable_auto_stop: Option(Bool),
    enable_closed_captions: Option(Bool),
    enable_content_encryption: Option(Bool),
    enable_dvr: Option(Bool),
    enable_embed: Option(Bool),
    enable_low_latency: Option(Bool),
    latency_preference: Option(LatencyPreference),
    mesh: Option(String),
    monitor_stream: Option(MonitorStreamInfo),
    projection: Option(Projection),
    record_from_start: Option(Bool),
    start_with_slate: Option(Bool),
    stereo_layout: Option(StereoLayout),
  )
}

pub fn live_broadcast_content_details_decoder() -> Decoder(
  LiveBroadcastContentDetails,
) {
  use availability_config <- decode.optional_field(
    "availabilityConfig",
    option.None,
    decode.optional(availability.availability_config_decoder()),
  )
  use bound_stream_id <- decode.optional_field(
    "boundStreamId",
    option.None,
    decode.optional(decode.string),
  )
  use bound_stream_last_update_time_ms <- decode.optional_field(
    "boundStreamLastUpdateTimeMs",
    option.None,
    decode.optional(decode.string),
  )
  use closed_captions_type <- decode.optional_field(
    "closedCaptionsType",
    option.None,
    decode.optional(closed_captions_type_decoder()),
  )
  use enable_auto_start <- decode.optional_field(
    "enableAutoStart",
    option.None,
    decode.optional(decode.bool),
  )
  use enable_auto_stop <- decode.optional_field(
    "enableAutoStop",
    option.None,
    decode.optional(decode.bool),
  )
  use enable_closed_captions <- decode.optional_field(
    "enableClosedCaptions",
    option.None,
    decode.optional(decode.bool),
  )
  use enable_content_encryption <- decode.optional_field(
    "enableContentEncryption",
    option.None,
    decode.optional(decode.bool),
  )
  use enable_dvr <- decode.optional_field(
    "enableDvr",
    option.None,
    decode.optional(decode.bool),
  )
  use enable_embed <- decode.optional_field(
    "enableEmbed",
    option.None,
    decode.optional(decode.bool),
  )
  use enable_low_latency <- decode.optional_field(
    "enableLowLatency",
    option.None,
    decode.optional(decode.bool),
  )
  use latency_preference <- decode.optional_field(
    "latencyPreference",
    option.None,
    decode.optional(latency_preference_decoder()),
  )
  use mesh <- decode.optional_field(
    "mesh",
    option.None,
    decode.optional(decode.string),
  )
  use monitor_stream <- decode.optional_field(
    "monitorStream",
    option.None,
    decode.optional(monitor_stream_info_decoder()),
  )
  use projection <- decode.optional_field(
    "projection",
    option.None,
    decode.optional(projection_decoder()),
  )
  use record_from_start <- decode.optional_field(
    "recordFromStart",
    option.None,
    decode.optional(decode.bool),
  )
  use start_with_slate <- decode.optional_field(
    "startWithSlate",
    option.None,
    decode.optional(decode.bool),
  )
  use stereo_layout <- decode.optional_field(
    "stereoLayout",
    option.None,
    decode.optional(stereo_layout_decoder()),
  )
  decode.success(LiveBroadcastContentDetails(
    availability_config,
    bound_stream_id,
    bound_stream_last_update_time_ms,
    closed_captions_type,
    enable_auto_start,
    enable_auto_stop,
    enable_closed_captions,
    enable_content_encryption,
    enable_dvr,
    enable_embed,
    enable_low_latency,
    latency_preference,
    mesh,
    monitor_stream,
    projection,
    record_from_start,
    start_with_slate,
    stereo_layout,
  ))
}

pub fn live_broadcast_content_details_to_json(
  value: LiveBroadcastContentDetails,
) -> Json {
  json.object([
    #(
      "availabilityConfig",
      json.nullable(
        value.availability_config,
        availability.availability_config_to_json,
      ),
    ),
    #("boundStreamId", json.nullable(value.bound_stream_id, json.string)),
    #(
      "boundStreamLastUpdateTimeMs",
      json.nullable(value.bound_stream_last_update_time_ms, json.string),
    ),
    #(
      "closedCaptionsType",
      json.nullable(value.closed_captions_type, fn(e) {
        json.string(closed_captions_type_to_string(e))
      }),
    ),
    #("enableAutoStart", json.nullable(value.enable_auto_start, json.bool)),
    #("enableAutoStop", json.nullable(value.enable_auto_stop, json.bool)),
    #(
      "enableClosedCaptions",
      json.nullable(value.enable_closed_captions, json.bool),
    ),
    #(
      "enableContentEncryption",
      json.nullable(value.enable_content_encryption, json.bool),
    ),
    #("enableDvr", json.nullable(value.enable_dvr, json.bool)),
    #("enableEmbed", json.nullable(value.enable_embed, json.bool)),
    #("enableLowLatency", json.nullable(value.enable_low_latency, json.bool)),
    #(
      "latencyPreference",
      json.nullable(value.latency_preference, fn(e) {
        json.string(latency_preference_to_string(e))
      }),
    ),
    #("mesh", json.nullable(value.mesh, json.string)),
    #(
      "monitorStream",
      json.nullable(value.monitor_stream, monitor_stream_info_to_json),
    ),
    #(
      "projection",
      json.nullable(value.projection, fn(e) {
        json.string(projection_to_string(e))
      }),
    ),
    #("recordFromStart", json.nullable(value.record_from_start, json.bool)),
    #("startWithSlate", json.nullable(value.start_with_slate, json.bool)),
    #(
      "stereoLayout",
      json.nullable(value.stereo_layout, fn(e) {
        json.string(stereo_layout_to_string(e))
      }),
    ),
  ])
}

pub type ClosedCaptionsType {
  ClosedCaptionsTypeClosedCaptionsTypeUnspecified
  ClosedCaptionsTypeClosedCaptionsDisabled
  ClosedCaptionsTypeClosedCaptionsHttpPost
  ClosedCaptionsTypeClosedCaptionsEmbedded
}

pub fn closed_captions_type_to_string(value: ClosedCaptionsType) -> String {
  case value {
    ClosedCaptionsTypeClosedCaptionsTypeUnspecified ->
      "closedCaptionsTypeUnspecified"
    ClosedCaptionsTypeClosedCaptionsDisabled -> "closedCaptionsDisabled"
    ClosedCaptionsTypeClosedCaptionsHttpPost -> "closedCaptionsHttpPost"
    ClosedCaptionsTypeClosedCaptionsEmbedded -> "closedCaptionsEmbedded"
  }
}

pub fn closed_captions_type_decoder() -> Decoder(ClosedCaptionsType) {
  use value <- decode.then(decode.string)
  case value {
    "closedCaptionsTypeUnspecified" ->
      decode.success(ClosedCaptionsTypeClosedCaptionsTypeUnspecified)
    "closedCaptionsDisabled" ->
      decode.success(ClosedCaptionsTypeClosedCaptionsDisabled)
    "closedCaptionsHttpPost" ->
      decode.success(ClosedCaptionsTypeClosedCaptionsHttpPost)
    "closedCaptionsEmbedded" ->
      decode.success(ClosedCaptionsTypeClosedCaptionsEmbedded)
    _ ->
      decode.failure(
        ClosedCaptionsTypeClosedCaptionsTypeUnspecified,
        "a valid ClosedCaptionsType",
      )
  }
}

/// If both this and enable_low_latency are set, they must match. LATENCY_NORMAL should match enable_low_latency=false LATENCY_LOW should match enable_low_latency=true LATENCY_ULTRA_LOW should have enable_low_latency omitted.
pub type LatencyPreference {
  LatencyPreferenceLatencyPreferenceUnspecified
  LatencyPreferenceNormal
  LatencyPreferenceLow
  LatencyPreferenceUltraLow
}

pub fn latency_preference_to_string(value: LatencyPreference) -> String {
  case value {
    LatencyPreferenceLatencyPreferenceUnspecified ->
      "latencyPreferenceUnspecified"
    LatencyPreferenceNormal -> "normal"
    LatencyPreferenceLow -> "low"
    LatencyPreferenceUltraLow -> "ultraLow"
  }
}

pub fn latency_preference_decoder() -> Decoder(LatencyPreference) {
  use value <- decode.then(decode.string)
  case value {
    "latencyPreferenceUnspecified" ->
      decode.success(LatencyPreferenceLatencyPreferenceUnspecified)
    "normal" -> decode.success(LatencyPreferenceNormal)
    "low" -> decode.success(LatencyPreferenceLow)
    "ultraLow" -> decode.success(LatencyPreferenceUltraLow)
    _ ->
      decode.failure(
        LatencyPreferenceLatencyPreferenceUnspecified,
        "a valid LatencyPreference",
      )
  }
}

/// The projection format of this broadcast. This defaults to rectangular.
pub type Projection {
  ProjectionProjectionUnspecified
  ProjectionRectangular
  ProjectionValue360
  ProjectionMesh
}

pub fn projection_to_string(value: Projection) -> String {
  case value {
    ProjectionProjectionUnspecified -> "projectionUnspecified"
    ProjectionRectangular -> "rectangular"
    ProjectionValue360 -> "360"
    ProjectionMesh -> "mesh"
  }
}

pub fn projection_decoder() -> Decoder(Projection) {
  use value <- decode.then(decode.string)
  case value {
    "projectionUnspecified" -> decode.success(ProjectionProjectionUnspecified)
    "rectangular" -> decode.success(ProjectionRectangular)
    "360" -> decode.success(ProjectionValue360)
    "mesh" -> decode.success(ProjectionMesh)
    _ -> decode.failure(ProjectionProjectionUnspecified, "a valid Projection")
  }
}

/// The 3D stereo layout of this broadcast. This defaults to mono.
pub type StereoLayout {
  StereoLayoutStereoLayoutUnspecified
  StereoLayoutMono
  StereoLayoutLeftRight
  StereoLayoutTopBottom
}

pub fn stereo_layout_to_string(value: StereoLayout) -> String {
  case value {
    StereoLayoutStereoLayoutUnspecified -> "stereoLayoutUnspecified"
    StereoLayoutMono -> "mono"
    StereoLayoutLeftRight -> "leftRight"
    StereoLayoutTopBottom -> "topBottom"
  }
}

pub fn stereo_layout_decoder() -> Decoder(StereoLayout) {
  use value <- decode.then(decode.string)
  case value {
    "stereoLayoutUnspecified" ->
      decode.success(StereoLayoutStereoLayoutUnspecified)
    "mono" -> decode.success(StereoLayoutMono)
    "leftRight" -> decode.success(StereoLayoutLeftRight)
    "topBottom" -> decode.success(StereoLayoutTopBottom)
    _ ->
      decode.failure(
        StereoLayoutStereoLayoutUnspecified,
        "a valid StereoLayout",
      )
  }
}

pub type LiveBroadcastListResponse {
  LiveBroadcastListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(LiveBroadcast)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn live_broadcast_list_response_decoder() -> Decoder(
  LiveBroadcastListResponse,
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
    decode.optional(decode.list(live_broadcast_decoder())),
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
  decode.success(LiveBroadcastListResponse(
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

pub fn live_broadcast_list_response_to_json(
  value: LiveBroadcastListResponse,
) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, live_broadcast_to_json)
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

/// Monetization settings of a broadcast.
pub type LiveBroadcastMonetizationDetails {
  LiveBroadcastMonetizationDetails(cuepoint_schedule: Option(CuepointSchedule))
}

pub fn live_broadcast_monetization_details_decoder() -> Decoder(
  LiveBroadcastMonetizationDetails,
) {
  use cuepoint_schedule <- decode.optional_field(
    "cuepointSchedule",
    option.None,
    decode.optional(cuepoint.cuepoint_schedule_decoder()),
  )
  decode.success(LiveBroadcastMonetizationDetails(cuepoint_schedule))
}

pub fn live_broadcast_monetization_details_to_json(
  value: LiveBroadcastMonetizationDetails,
) -> Json {
  json.object([
    #(
      "cuepointSchedule",
      json.nullable(value.cuepoint_schedule, cuepoint.cuepoint_schedule_to_json),
    ),
  ])
}

/// Basic broadcast information.
pub type LiveBroadcastSnippet {
  LiveBroadcastSnippet(
    actual_end_time: Option(String),
    actual_start_time: Option(String),
    category_id: Option(String),
    channel_id: Option(String),
    description: Option(String),
    is_default_broadcast: Option(Bool),
    live_chat_id: Option(String),
    published_at: Option(String),
    scheduled_end_time: Option(String),
    scheduled_start_time: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn live_broadcast_snippet_decoder() -> Decoder(LiveBroadcastSnippet) {
  use actual_end_time <- decode.optional_field(
    "actualEndTime",
    option.None,
    decode.optional(decode.string),
  )
  use actual_start_time <- decode.optional_field(
    "actualStartTime",
    option.None,
    decode.optional(decode.string),
  )
  use category_id <- decode.optional_field(
    "categoryId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use is_default_broadcast <- decode.optional_field(
    "isDefaultBroadcast",
    option.None,
    decode.optional(decode.bool),
  )
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use scheduled_end_time <- decode.optional_field(
    "scheduledEndTime",
    option.None,
    decode.optional(decode.string),
  )
  use scheduled_start_time <- decode.optional_field(
    "scheduledStartTime",
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
  decode.success(LiveBroadcastSnippet(
    actual_end_time,
    actual_start_time,
    category_id,
    channel_id,
    description,
    is_default_broadcast,
    live_chat_id,
    published_at,
    scheduled_end_time,
    scheduled_start_time,
    thumbnails,
    title,
  ))
}

pub fn live_broadcast_snippet_to_json(value: LiveBroadcastSnippet) -> Json {
  json.object([
    #("actualEndTime", json.nullable(value.actual_end_time, json.string)),
    #("actualStartTime", json.nullable(value.actual_start_time, json.string)),
    #("categoryId", json.nullable(value.category_id, json.string)),
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #(
      "isDefaultBroadcast",
      json.nullable(value.is_default_broadcast, json.bool),
    ),
    #("liveChatId", json.nullable(value.live_chat_id, json.string)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #("scheduledEndTime", json.nullable(value.scheduled_end_time, json.string)),
    #(
      "scheduledStartTime",
      json.nullable(value.scheduled_start_time, json.string),
    ),
    #(
      "thumbnails",
      json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
    ),
    #("title", json.nullable(value.title, json.string)),
  ])
}

/// Statistics about the live broadcast. These represent a snapshot of the values at the time of the request. Statistics are only returned for live broadcasts.
pub type LiveBroadcastStatistics {
  LiveBroadcastStatistics(concurrent_viewers: Option(String))
}

pub fn live_broadcast_statistics_decoder() -> Decoder(LiveBroadcastStatistics) {
  use concurrent_viewers <- decode.optional_field(
    "concurrentViewers",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveBroadcastStatistics(concurrent_viewers))
}

pub fn live_broadcast_statistics_to_json(
  value: LiveBroadcastStatistics,
) -> Json {
  json.object([
    #("concurrentViewers", json.nullable(value.concurrent_viewers, json.string)),
  ])
}

/// Live broadcast state.
pub type LiveBroadcastStatus {
  LiveBroadcastStatus(
    life_cycle_status: Option(LifeCycleStatus),
    live_broadcast_priority: Option(LiveBroadcastPriority),
    made_for_kids: Option(Bool),
    privacy_status: Option(PrivacyStatus),
    recording_status: Option(RecordingStatus),
    self_declared_made_for_kids: Option(Bool),
  )
}

pub fn live_broadcast_status_decoder() -> Decoder(LiveBroadcastStatus) {
  use life_cycle_status <- decode.optional_field(
    "lifeCycleStatus",
    option.None,
    decode.optional(life_cycle_status_decoder()),
  )
  use live_broadcast_priority <- decode.optional_field(
    "liveBroadcastPriority",
    option.None,
    decode.optional(live_broadcast_priority_decoder()),
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
  use recording_status <- decode.optional_field(
    "recordingStatus",
    option.None,
    decode.optional(recording_status_decoder()),
  )
  use self_declared_made_for_kids <- decode.optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(LiveBroadcastStatus(
    life_cycle_status,
    live_broadcast_priority,
    made_for_kids,
    privacy_status,
    recording_status,
    self_declared_made_for_kids,
  ))
}

pub fn live_broadcast_status_to_json(value: LiveBroadcastStatus) -> Json {
  json.object([
    #(
      "lifeCycleStatus",
      json.nullable(value.life_cycle_status, fn(e) {
        json.string(life_cycle_status_to_string(e))
      }),
    ),
    #(
      "liveBroadcastPriority",
      json.nullable(value.live_broadcast_priority, fn(e) {
        json.string(live_broadcast_priority_to_string(e))
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
      "recordingStatus",
      json.nullable(value.recording_status, fn(e) {
        json.string(recording_status_to_string(e))
      }),
    ),
    #(
      "selfDeclaredMadeForKids",
      json.nullable(value.self_declared_made_for_kids, json.bool),
    ),
  ])
}

/// The broadcast's status. The status can be updated using the API's liveBroadcasts.transition method.
pub type LifeCycleStatus {
  LifeCycleStatusLifeCycleStatusUnspecified
  LifeCycleStatusCreated
  LifeCycleStatusReady
  LifeCycleStatusTesting
  LifeCycleStatusLive
  LifeCycleStatusComplete
  LifeCycleStatusRevoked
  LifeCycleStatusTestStarting
  LifeCycleStatusLiveStarting
}

pub fn life_cycle_status_to_string(value: LifeCycleStatus) -> String {
  case value {
    LifeCycleStatusLifeCycleStatusUnspecified -> "lifeCycleStatusUnspecified"
    LifeCycleStatusCreated -> "created"
    LifeCycleStatusReady -> "ready"
    LifeCycleStatusTesting -> "testing"
    LifeCycleStatusLive -> "live"
    LifeCycleStatusComplete -> "complete"
    LifeCycleStatusRevoked -> "revoked"
    LifeCycleStatusTestStarting -> "testStarting"
    LifeCycleStatusLiveStarting -> "liveStarting"
  }
}

pub fn life_cycle_status_decoder() -> Decoder(LifeCycleStatus) {
  use value <- decode.then(decode.string)
  case value {
    "lifeCycleStatusUnspecified" ->
      decode.success(LifeCycleStatusLifeCycleStatusUnspecified)
    "created" -> decode.success(LifeCycleStatusCreated)
    "ready" -> decode.success(LifeCycleStatusReady)
    "testing" -> decode.success(LifeCycleStatusTesting)
    "live" -> decode.success(LifeCycleStatusLive)
    "complete" -> decode.success(LifeCycleStatusComplete)
    "revoked" -> decode.success(LifeCycleStatusRevoked)
    "testStarting" -> decode.success(LifeCycleStatusTestStarting)
    "liveStarting" -> decode.success(LifeCycleStatusLiveStarting)
    _ ->
      decode.failure(
        LifeCycleStatusLifeCycleStatusUnspecified,
        "a valid LifeCycleStatus",
      )
  }
}

/// Priority of the live broadcast event (internal state).
pub type LiveBroadcastPriority {
  LiveBroadcastPriorityLiveBroadcastPriorityUnspecified
  LiveBroadcastPriorityLow
  LiveBroadcastPriorityNormal
  LiveBroadcastPriorityHigh
}

pub fn live_broadcast_priority_to_string(
  value: LiveBroadcastPriority,
) -> String {
  case value {
    LiveBroadcastPriorityLiveBroadcastPriorityUnspecified ->
      "liveBroadcastPriorityUnspecified"
    LiveBroadcastPriorityLow -> "low"
    LiveBroadcastPriorityNormal -> "normal"
    LiveBroadcastPriorityHigh -> "high"
  }
}

pub fn live_broadcast_priority_decoder() -> Decoder(LiveBroadcastPriority) {
  use value <- decode.then(decode.string)
  case value {
    "liveBroadcastPriorityUnspecified" ->
      decode.success(LiveBroadcastPriorityLiveBroadcastPriorityUnspecified)
    "low" -> decode.success(LiveBroadcastPriorityLow)
    "normal" -> decode.success(LiveBroadcastPriorityNormal)
    "high" -> decode.success(LiveBroadcastPriorityHigh)
    _ ->
      decode.failure(
        LiveBroadcastPriorityLiveBroadcastPriorityUnspecified,
        "a valid LiveBroadcastPriority",
      )
  }
}

/// The broadcast's privacy status. Note that the broadcast represents exactly one YouTube video, so the privacy settings are identical to those supported for videos. In addition, you can set this field by modifying the broadcast resource or by setting the privacyStatus field of the corresponding video resource.
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

/// The broadcast's recording status.
pub type RecordingStatus {
  RecordingStatusLiveBroadcastRecordingStatusUnspecified
  RecordingStatusNotRecording
  RecordingStatusRecording
  RecordingStatusRecorded
}

pub fn recording_status_to_string(value: RecordingStatus) -> String {
  case value {
    RecordingStatusLiveBroadcastRecordingStatusUnspecified ->
      "liveBroadcastRecordingStatusUnspecified"
    RecordingStatusNotRecording -> "notRecording"
    RecordingStatusRecording -> "recording"
    RecordingStatusRecorded -> "recorded"
  }
}

pub fn recording_status_decoder() -> Decoder(RecordingStatus) {
  use value <- decode.then(decode.string)
  case value {
    "liveBroadcastRecordingStatusUnspecified" ->
      decode.success(RecordingStatusLiveBroadcastRecordingStatusUnspecified)
    "notRecording" -> decode.success(RecordingStatusNotRecording)
    "recording" -> decode.success(RecordingStatusRecording)
    "recorded" -> decode.success(RecordingStatusRecorded)
    _ ->
      decode.failure(
        RecordingStatusLiveBroadcastRecordingStatusUnspecified,
        "a valid RecordingStatus",
      )
  }
}

/// A `__liveChatBan__` resource represents a ban for a YouTube live chat.
pub type LiveChatBan {
  LiveChatBan(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveChatBanSnippet),
  )
}

pub fn live_chat_ban_decoder() -> Decoder(LiveChatBan) {
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
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_chat_ban_snippet_decoder()),
  )
  decode.success(LiveChatBan(etag, id, kind, snippet))
}

pub fn live_chat_ban_to_json(value: LiveChatBan) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, live_chat_ban_snippet_to_json)),
  ])
}

pub type LiveChatBanSnippet {
  LiveChatBanSnippet(
    ban_duration_seconds: Option(String),
    banned_user_details: Option(ChannelProfileDetails),
    live_chat_id: Option(String),
    type_: Option(LiveChatBanSnippetType),
  )
}

pub fn live_chat_ban_snippet_decoder() -> Decoder(LiveChatBanSnippet) {
  use ban_duration_seconds <- decode.optional_field(
    "banDurationSeconds",
    option.None,
    decode.optional(decode.string),
  )
  use banned_user_details <- decode.optional_field(
    "bannedUserDetails",
    option.None,
    decode.optional(channel.channel_profile_details_decoder()),
  )
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(live_chat_ban_snippet_type_decoder()),
  )
  decode.success(LiveChatBanSnippet(
    ban_duration_seconds,
    banned_user_details,
    live_chat_id,
    type_,
  ))
}

pub fn live_chat_ban_snippet_to_json(value: LiveChatBanSnippet) -> Json {
  json.object([
    #(
      "banDurationSeconds",
      json.nullable(value.ban_duration_seconds, json.string),
    ),
    #(
      "bannedUserDetails",
      json.nullable(
        value.banned_user_details,
        channel.channel_profile_details_to_json,
      ),
    ),
    #("liveChatId", json.nullable(value.live_chat_id, json.string)),
    #(
      "type",
      json.nullable(value.type_, fn(e) {
        json.string(live_chat_ban_snippet_type_to_string(e))
      }),
    ),
  ])
}

/// The type of ban.
pub type LiveChatBanSnippetType {
  LiveChatBanSnippetTypeLiveChatBanTypeUnspecified
  LiveChatBanSnippetTypePermanent
  LiveChatBanSnippetTypeTemporary
}

pub fn live_chat_ban_snippet_type_to_string(
  value: LiveChatBanSnippetType,
) -> String {
  case value {
    LiveChatBanSnippetTypeLiveChatBanTypeUnspecified ->
      "liveChatBanTypeUnspecified"
    LiveChatBanSnippetTypePermanent -> "permanent"
    LiveChatBanSnippetTypeTemporary -> "temporary"
  }
}

pub fn live_chat_ban_snippet_type_decoder() -> Decoder(LiveChatBanSnippetType) {
  use value <- decode.then(decode.string)
  case value {
    "liveChatBanTypeUnspecified" ->
      decode.success(LiveChatBanSnippetTypeLiveChatBanTypeUnspecified)
    "permanent" -> decode.success(LiveChatBanSnippetTypePermanent)
    "temporary" -> decode.success(LiveChatBanSnippetTypeTemporary)
    _ ->
      decode.failure(
        LiveChatBanSnippetTypeLiveChatBanTypeUnspecified,
        "a valid LiveChatBanSnippetType",
      )
  }
}

pub type LiveChatFanFundingEventDetails {
  LiveChatFanFundingEventDetails(
    amount_display_string: Option(String),
    amount_micros: Option(String),
    currency: Option(String),
    user_comment: Option(String),
  )
}

pub fn live_chat_fan_funding_event_details_decoder() -> Decoder(
  LiveChatFanFundingEventDetails,
) {
  use amount_display_string <- decode.optional_field(
    "amountDisplayString",
    option.None,
    decode.optional(decode.string),
  )
  use amount_micros <- decode.optional_field(
    "amountMicros",
    option.None,
    decode.optional(decode.string),
  )
  use currency <- decode.optional_field(
    "currency",
    option.None,
    decode.optional(decode.string),
  )
  use user_comment <- decode.optional_field(
    "userComment",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatFanFundingEventDetails(
    amount_display_string,
    amount_micros,
    currency,
    user_comment,
  ))
}

pub fn live_chat_fan_funding_event_details_to_json(
  value: LiveChatFanFundingEventDetails,
) -> Json {
  json.object([
    #(
      "amountDisplayString",
      json.nullable(value.amount_display_string, json.string),
    ),
    #("amountMicros", json.nullable(value.amount_micros, json.string)),
    #("currency", json.nullable(value.currency, json.string)),
    #("userComment", json.nullable(value.user_comment, json.string)),
  ])
}

/// Details about the gift event, this is only set if the type is `giftEvent`.
pub type LiveChatGiftDetails {
  LiveChatGiftDetails(
    alt_text: Option(String),
    combo_count: Option(Int),
    gift_duration: Option(String),
    gift_name: Option(String),
    gift_url: Option(String),
    has_visual_effect: Option(Bool),
    jewels_amount: Option(Int),
    language: Option(String),
  )
}

pub fn live_chat_gift_details_decoder() -> Decoder(LiveChatGiftDetails) {
  use alt_text <- decode.optional_field(
    "altText",
    option.None,
    decode.optional(decode.string),
  )
  use combo_count <- decode.optional_field(
    "comboCount",
    option.None,
    decode.optional(decode.int),
  )
  use gift_duration <- decode.optional_field(
    "giftDuration",
    option.None,
    decode.optional(decode.string),
  )
  use gift_name <- decode.optional_field(
    "giftName",
    option.None,
    decode.optional(decode.string),
  )
  use gift_url <- decode.optional_field(
    "giftUrl",
    option.None,
    decode.optional(decode.string),
  )
  use has_visual_effect <- decode.optional_field(
    "hasVisualEffect",
    option.None,
    decode.optional(decode.bool),
  )
  use jewels_amount <- decode.optional_field(
    "jewelsAmount",
    option.None,
    decode.optional(decode.int),
  )
  use language <- decode.optional_field(
    "language",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatGiftDetails(
    alt_text,
    combo_count,
    gift_duration,
    gift_name,
    gift_url,
    has_visual_effect,
    jewels_amount,
    language,
  ))
}

pub fn live_chat_gift_details_to_json(value: LiveChatGiftDetails) -> Json {
  json.object([
    #("altText", json.nullable(value.alt_text, json.string)),
    #("comboCount", json.nullable(value.combo_count, json.int)),
    #("giftDuration", json.nullable(value.gift_duration, json.string)),
    #("giftName", json.nullable(value.gift_name, json.string)),
    #("giftUrl", json.nullable(value.gift_url, json.string)),
    #("hasVisualEffect", json.nullable(value.has_visual_effect, json.bool)),
    #("jewelsAmount", json.nullable(value.jewels_amount, json.int)),
    #("language", json.nullable(value.language, json.string)),
  ])
}

pub type LiveChatGiftMembershipReceivedDetails {
  LiveChatGiftMembershipReceivedDetails(
    associated_membership_gifting_message_id: Option(String),
    gifter_channel_id: Option(String),
    member_level_name: Option(String),
  )
}

pub fn live_chat_gift_membership_received_details_decoder() -> Decoder(
  LiveChatGiftMembershipReceivedDetails,
) {
  use associated_membership_gifting_message_id <- decode.optional_field(
    "associatedMembershipGiftingMessageId",
    option.None,
    decode.optional(decode.string),
  )
  use gifter_channel_id <- decode.optional_field(
    "gifterChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use member_level_name <- decode.optional_field(
    "memberLevelName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatGiftMembershipReceivedDetails(
    associated_membership_gifting_message_id,
    gifter_channel_id,
    member_level_name,
  ))
}

pub fn live_chat_gift_membership_received_details_to_json(
  value: LiveChatGiftMembershipReceivedDetails,
) -> Json {
  json.object([
    #(
      "associatedMembershipGiftingMessageId",
      json.nullable(value.associated_membership_gifting_message_id, json.string),
    ),
    #("gifterChannelId", json.nullable(value.gifter_channel_id, json.string)),
    #("memberLevelName", json.nullable(value.member_level_name, json.string)),
  ])
}

pub type LiveChatMemberMilestoneChatDetails {
  LiveChatMemberMilestoneChatDetails(
    member_level_name: Option(String),
    member_month: Option(Int),
    user_comment: Option(String),
  )
}

pub fn live_chat_member_milestone_chat_details_decoder() -> Decoder(
  LiveChatMemberMilestoneChatDetails,
) {
  use member_level_name <- decode.optional_field(
    "memberLevelName",
    option.None,
    decode.optional(decode.string),
  )
  use member_month <- decode.optional_field(
    "memberMonth",
    option.None,
    decode.optional(decode.int),
  )
  use user_comment <- decode.optional_field(
    "userComment",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMemberMilestoneChatDetails(
    member_level_name,
    member_month,
    user_comment,
  ))
}

pub fn live_chat_member_milestone_chat_details_to_json(
  value: LiveChatMemberMilestoneChatDetails,
) -> Json {
  json.object([
    #("memberLevelName", json.nullable(value.member_level_name, json.string)),
    #("memberMonth", json.nullable(value.member_month, json.int)),
    #("userComment", json.nullable(value.user_comment, json.string)),
  ])
}

pub type LiveChatMembershipGiftingDetails {
  LiveChatMembershipGiftingDetails(
    gift_memberships_count: Option(Int),
    gift_memberships_level_name: Option(String),
  )
}

pub fn live_chat_membership_gifting_details_decoder() -> Decoder(
  LiveChatMembershipGiftingDetails,
) {
  use gift_memberships_count <- decode.optional_field(
    "giftMembershipsCount",
    option.None,
    decode.optional(decode.int),
  )
  use gift_memberships_level_name <- decode.optional_field(
    "giftMembershipsLevelName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMembershipGiftingDetails(
    gift_memberships_count,
    gift_memberships_level_name,
  ))
}

pub fn live_chat_membership_gifting_details_to_json(
  value: LiveChatMembershipGiftingDetails,
) -> Json {
  json.object([
    #(
      "giftMembershipsCount",
      json.nullable(value.gift_memberships_count, json.int),
    ),
    #(
      "giftMembershipsLevelName",
      json.nullable(value.gift_memberships_level_name, json.string),
    ),
  ])
}

/// A *liveChatMessage* resource represents a chat message in a YouTube Live Chat.
pub type LiveChatMessage {
  LiveChatMessage(
    author_details: Option(LiveChatMessageAuthorDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveChatMessageSnippet),
  )
}

pub fn live_chat_message_decoder() -> Decoder(LiveChatMessage) {
  use author_details <- decode.optional_field(
    "authorDetails",
    option.None,
    decode.optional(live_chat_message_author_details_decoder()),
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
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_chat_message_snippet_decoder()),
  )
  decode.success(LiveChatMessage(author_details, etag, id, kind, snippet))
}

pub fn live_chat_message_to_json(value: LiveChatMessage) -> Json {
  json.object([
    #(
      "authorDetails",
      json.nullable(
        value.author_details,
        live_chat_message_author_details_to_json,
      ),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "snippet",
      json.nullable(value.snippet, live_chat_message_snippet_to_json),
    ),
  ])
}

pub type LiveChatMessageAuthorDetails {
  LiveChatMessageAuthorDetails(
    channel_id: Option(String),
    channel_url: Option(String),
    display_name: Option(String),
    is_chat_moderator: Option(Bool),
    is_chat_owner: Option(Bool),
    is_chat_sponsor: Option(Bool),
    is_verified: Option(Bool),
    profile_image_url: Option(String),
  )
}

pub fn live_chat_message_author_details_decoder() -> Decoder(
  LiveChatMessageAuthorDetails,
) {
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
  use is_chat_moderator <- decode.optional_field(
    "isChatModerator",
    option.None,
    decode.optional(decode.bool),
  )
  use is_chat_owner <- decode.optional_field(
    "isChatOwner",
    option.None,
    decode.optional(decode.bool),
  )
  use is_chat_sponsor <- decode.optional_field(
    "isChatSponsor",
    option.None,
    decode.optional(decode.bool),
  )
  use is_verified <- decode.optional_field(
    "isVerified",
    option.None,
    decode.optional(decode.bool),
  )
  use profile_image_url <- decode.optional_field(
    "profileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMessageAuthorDetails(
    channel_id,
    channel_url,
    display_name,
    is_chat_moderator,
    is_chat_owner,
    is_chat_sponsor,
    is_verified,
    profile_image_url,
  ))
}

pub fn live_chat_message_author_details_to_json(
  value: LiveChatMessageAuthorDetails,
) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("channelUrl", json.nullable(value.channel_url, json.string)),
    #("displayName", json.nullable(value.display_name, json.string)),
    #("isChatModerator", json.nullable(value.is_chat_moderator, json.bool)),
    #("isChatOwner", json.nullable(value.is_chat_owner, json.bool)),
    #("isChatSponsor", json.nullable(value.is_chat_sponsor, json.bool)),
    #("isVerified", json.nullable(value.is_verified, json.bool)),
    #("profileImageUrl", json.nullable(value.profile_image_url, json.string)),
  ])
}

pub type LiveChatMessageDeletedDetails {
  LiveChatMessageDeletedDetails(deleted_message_id: Option(String))
}

pub fn live_chat_message_deleted_details_decoder() -> Decoder(
  LiveChatMessageDeletedDetails,
) {
  use deleted_message_id <- decode.optional_field(
    "deletedMessageId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMessageDeletedDetails(deleted_message_id))
}

pub fn live_chat_message_deleted_details_to_json(
  value: LiveChatMessageDeletedDetails,
) -> Json {
  json.object([
    #("deletedMessageId", json.nullable(value.deleted_message_id, json.string)),
  ])
}

pub type LiveChatMessageListResponse {
  LiveChatMessageListResponse(
    active_poll_item: Option(LiveChatMessage),
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(LiveChatMessage)),
    kind: Option(String),
    next_page_token: Option(String),
    offline_at: Option(String),
    page_info: Option(PageInfo),
    polling_interval_millis: Option(Int),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn live_chat_message_list_response_decoder() -> Decoder(
  LiveChatMessageListResponse,
) {
  use active_poll_item <- decode.optional_field(
    "activePollItem",
    option.None,
    decode.optional(live_chat_message_decoder()),
  )
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
    decode.optional(decode.list(live_chat_message_decoder())),
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
  use offline_at <- decode.optional_field(
    "offlineAt",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use polling_interval_millis <- decode.optional_field(
    "pollingIntervalMillis",
    option.None,
    decode.optional(decode.int),
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
  decode.success(LiveChatMessageListResponse(
    active_poll_item,
    etag,
    event_id,
    items,
    kind,
    next_page_token,
    offline_at,
    page_info,
    polling_interval_millis,
    token_pagination,
    visitor_id,
  ))
}

pub fn live_chat_message_list_response_to_json(
  value: LiveChatMessageListResponse,
) -> Json {
  json.object([
    #(
      "activePollItem",
      json.nullable(value.active_poll_item, live_chat_message_to_json),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, live_chat_message_to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("nextPageToken", json.nullable(value.next_page_token, json.string)),
    #("offlineAt", json.nullable(value.offline_at, json.string)),
    #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
    #(
      "pollingIntervalMillis",
      json.nullable(value.polling_interval_millis, json.int),
    ),
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

pub type LiveChatMessageRetractedDetails {
  LiveChatMessageRetractedDetails(retracted_message_id: Option(String))
}

pub fn live_chat_message_retracted_details_decoder() -> Decoder(
  LiveChatMessageRetractedDetails,
) {
  use retracted_message_id <- decode.optional_field(
    "retractedMessageId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMessageRetractedDetails(retracted_message_id))
}

pub fn live_chat_message_retracted_details_to_json(
  value: LiveChatMessageRetractedDetails,
) -> Json {
  json.object([
    #(
      "retractedMessageId",
      json.nullable(value.retracted_message_id, json.string),
    ),
  ])
}

/// Next ID: 35
pub type LiveChatMessageSnippet {
  LiveChatMessageSnippet(
    author_channel_id: Option(String),
    display_message: Option(String),
    fan_funding_event_details: Option(LiveChatFanFundingEventDetails),
    gift_details: Option(LiveChatGiftDetails),
    gift_membership_received_details: Option(
      LiveChatGiftMembershipReceivedDetails,
    ),
    has_display_content: Option(Bool),
    live_chat_id: Option(String),
    member_milestone_chat_details: Option(LiveChatMemberMilestoneChatDetails),
    membership_gifting_details: Option(LiveChatMembershipGiftingDetails),
    message_deleted_details: Option(LiveChatMessageDeletedDetails),
    message_retracted_details: Option(LiveChatMessageRetractedDetails),
    new_sponsor_details: Option(LiveChatNewSponsorDetails),
    poll_details: Option(LiveChatPollDetails),
    published_at: Option(String),
    super_chat_details: Option(LiveChatSuperChatDetails),
    super_sticker_details: Option(LiveChatSuperStickerDetails),
    text_message_details: Option(LiveChatTextMessageDetails),
    type_: Option(LiveChatMessageSnippetType),
    user_banned_details: Option(LiveChatUserBannedMessageDetails),
  )
}

pub fn live_chat_message_snippet_decoder() -> Decoder(LiveChatMessageSnippet) {
  use author_channel_id <- decode.optional_field(
    "authorChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use display_message <- decode.optional_field(
    "displayMessage",
    option.None,
    decode.optional(decode.string),
  )
  use fan_funding_event_details <- decode.optional_field(
    "fanFundingEventDetails",
    option.None,
    decode.optional(live_chat_fan_funding_event_details_decoder()),
  )
  use gift_details <- decode.optional_field(
    "giftDetails",
    option.None,
    decode.optional(live_chat_gift_details_decoder()),
  )
  use gift_membership_received_details <- decode.optional_field(
    "giftMembershipReceivedDetails",
    option.None,
    decode.optional(live_chat_gift_membership_received_details_decoder()),
  )
  use has_display_content <- decode.optional_field(
    "hasDisplayContent",
    option.None,
    decode.optional(decode.bool),
  )
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use member_milestone_chat_details <- decode.optional_field(
    "memberMilestoneChatDetails",
    option.None,
    decode.optional(live_chat_member_milestone_chat_details_decoder()),
  )
  use membership_gifting_details <- decode.optional_field(
    "membershipGiftingDetails",
    option.None,
    decode.optional(live_chat_membership_gifting_details_decoder()),
  )
  use message_deleted_details <- decode.optional_field(
    "messageDeletedDetails",
    option.None,
    decode.optional(live_chat_message_deleted_details_decoder()),
  )
  use message_retracted_details <- decode.optional_field(
    "messageRetractedDetails",
    option.None,
    decode.optional(live_chat_message_retracted_details_decoder()),
  )
  use new_sponsor_details <- decode.optional_field(
    "newSponsorDetails",
    option.None,
    decode.optional(live_chat_new_sponsor_details_decoder()),
  )
  use poll_details <- decode.optional_field(
    "pollDetails",
    option.None,
    decode.optional(live_chat_poll_details_decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use super_chat_details <- decode.optional_field(
    "superChatDetails",
    option.None,
    decode.optional(live_chat_super_chat_details_decoder()),
  )
  use super_sticker_details <- decode.optional_field(
    "superStickerDetails",
    option.None,
    decode.optional(live_chat_super_sticker_details_decoder()),
  )
  use text_message_details <- decode.optional_field(
    "textMessageDetails",
    option.None,
    decode.optional(live_chat_text_message_details_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(live_chat_message_snippet_type_decoder()),
  )
  use user_banned_details <- decode.optional_field(
    "userBannedDetails",
    option.None,
    decode.optional(live_chat_user_banned_message_details_decoder()),
  )
  decode.success(LiveChatMessageSnippet(
    author_channel_id,
    display_message,
    fan_funding_event_details,
    gift_details,
    gift_membership_received_details,
    has_display_content,
    live_chat_id,
    member_milestone_chat_details,
    membership_gifting_details,
    message_deleted_details,
    message_retracted_details,
    new_sponsor_details,
    poll_details,
    published_at,
    super_chat_details,
    super_sticker_details,
    text_message_details,
    type_,
    user_banned_details,
  ))
}

pub fn live_chat_message_snippet_to_json(
  value: LiveChatMessageSnippet,
) -> Json {
  json.object([
    #("authorChannelId", json.nullable(value.author_channel_id, json.string)),
    #("displayMessage", json.nullable(value.display_message, json.string)),
    #(
      "fanFundingEventDetails",
      json.nullable(
        value.fan_funding_event_details,
        live_chat_fan_funding_event_details_to_json,
      ),
    ),
    #(
      "giftDetails",
      json.nullable(value.gift_details, live_chat_gift_details_to_json),
    ),
    #(
      "giftMembershipReceivedDetails",
      json.nullable(
        value.gift_membership_received_details,
        live_chat_gift_membership_received_details_to_json,
      ),
    ),
    #("hasDisplayContent", json.nullable(value.has_display_content, json.bool)),
    #("liveChatId", json.nullable(value.live_chat_id, json.string)),
    #(
      "memberMilestoneChatDetails",
      json.nullable(
        value.member_milestone_chat_details,
        live_chat_member_milestone_chat_details_to_json,
      ),
    ),
    #(
      "membershipGiftingDetails",
      json.nullable(
        value.membership_gifting_details,
        live_chat_membership_gifting_details_to_json,
      ),
    ),
    #(
      "messageDeletedDetails",
      json.nullable(
        value.message_deleted_details,
        live_chat_message_deleted_details_to_json,
      ),
    ),
    #(
      "messageRetractedDetails",
      json.nullable(
        value.message_retracted_details,
        live_chat_message_retracted_details_to_json,
      ),
    ),
    #(
      "newSponsorDetails",
      json.nullable(
        value.new_sponsor_details,
        live_chat_new_sponsor_details_to_json,
      ),
    ),
    #(
      "pollDetails",
      json.nullable(value.poll_details, live_chat_poll_details_to_json),
    ),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #(
      "superChatDetails",
      json.nullable(
        value.super_chat_details,
        live_chat_super_chat_details_to_json,
      ),
    ),
    #(
      "superStickerDetails",
      json.nullable(
        value.super_sticker_details,
        live_chat_super_sticker_details_to_json,
      ),
    ),
    #(
      "textMessageDetails",
      json.nullable(
        value.text_message_details,
        live_chat_text_message_details_to_json,
      ),
    ),
    #(
      "type",
      json.nullable(value.type_, fn(e) {
        json.string(live_chat_message_snippet_type_to_string(e))
      }),
    ),
    #(
      "userBannedDetails",
      json.nullable(
        value.user_banned_details,
        live_chat_user_banned_message_details_to_json,
      ),
    ),
  ])
}

/// The type of message, this will always be present, it determines the contents of the message as well as which fields will be present.
pub type LiveChatMessageSnippetType {
  LiveChatMessageSnippetTypeInvalidType
  LiveChatMessageSnippetTypeTextMessageEvent
  LiveChatMessageSnippetTypeTombstone
  LiveChatMessageSnippetTypeFanFundingEvent
  LiveChatMessageSnippetTypeChatEndedEvent
  LiveChatMessageSnippetTypeSponsorOnlyModeStartedEvent
  LiveChatMessageSnippetTypeSponsorOnlyModeEndedEvent
  LiveChatMessageSnippetTypeNewSponsorEvent
  LiveChatMessageSnippetTypeMemberMilestoneChatEvent
  LiveChatMessageSnippetTypeMembershipGiftingEvent
  LiveChatMessageSnippetTypeGiftMembershipReceivedEvent
  LiveChatMessageSnippetTypeMessageDeletedEvent
  LiveChatMessageSnippetTypeMessageRetractedEvent
  LiveChatMessageSnippetTypeUserBannedEvent
  LiveChatMessageSnippetTypeSuperChatEvent
  LiveChatMessageSnippetTypeSuperStickerEvent
  LiveChatMessageSnippetTypePollEvent
  LiveChatMessageSnippetTypeGiftEvent
}

pub fn live_chat_message_snippet_type_to_string(
  value: LiveChatMessageSnippetType,
) -> String {
  case value {
    LiveChatMessageSnippetTypeInvalidType -> "invalidType"
    LiveChatMessageSnippetTypeTextMessageEvent -> "textMessageEvent"
    LiveChatMessageSnippetTypeTombstone -> "tombstone"
    LiveChatMessageSnippetTypeFanFundingEvent -> "fanFundingEvent"
    LiveChatMessageSnippetTypeChatEndedEvent -> "chatEndedEvent"
    LiveChatMessageSnippetTypeSponsorOnlyModeStartedEvent ->
      "sponsorOnlyModeStartedEvent"
    LiveChatMessageSnippetTypeSponsorOnlyModeEndedEvent ->
      "sponsorOnlyModeEndedEvent"
    LiveChatMessageSnippetTypeNewSponsorEvent -> "newSponsorEvent"
    LiveChatMessageSnippetTypeMemberMilestoneChatEvent ->
      "memberMilestoneChatEvent"
    LiveChatMessageSnippetTypeMembershipGiftingEvent -> "membershipGiftingEvent"
    LiveChatMessageSnippetTypeGiftMembershipReceivedEvent ->
      "giftMembershipReceivedEvent"
    LiveChatMessageSnippetTypeMessageDeletedEvent -> "messageDeletedEvent"
    LiveChatMessageSnippetTypeMessageRetractedEvent -> "messageRetractedEvent"
    LiveChatMessageSnippetTypeUserBannedEvent -> "userBannedEvent"
    LiveChatMessageSnippetTypeSuperChatEvent -> "superChatEvent"
    LiveChatMessageSnippetTypeSuperStickerEvent -> "superStickerEvent"
    LiveChatMessageSnippetTypePollEvent -> "pollEvent"
    LiveChatMessageSnippetTypeGiftEvent -> "giftEvent"
  }
}

pub fn live_chat_message_snippet_type_decoder() -> Decoder(
  LiveChatMessageSnippetType,
) {
  use value <- decode.then(decode.string)
  case value {
    "invalidType" -> decode.success(LiveChatMessageSnippetTypeInvalidType)
    "textMessageEvent" ->
      decode.success(LiveChatMessageSnippetTypeTextMessageEvent)
    "tombstone" -> decode.success(LiveChatMessageSnippetTypeTombstone)
    "fanFundingEvent" ->
      decode.success(LiveChatMessageSnippetTypeFanFundingEvent)
    "chatEndedEvent" -> decode.success(LiveChatMessageSnippetTypeChatEndedEvent)
    "sponsorOnlyModeStartedEvent" ->
      decode.success(LiveChatMessageSnippetTypeSponsorOnlyModeStartedEvent)
    "sponsorOnlyModeEndedEvent" ->
      decode.success(LiveChatMessageSnippetTypeSponsorOnlyModeEndedEvent)
    "newSponsorEvent" ->
      decode.success(LiveChatMessageSnippetTypeNewSponsorEvent)
    "memberMilestoneChatEvent" ->
      decode.success(LiveChatMessageSnippetTypeMemberMilestoneChatEvent)
    "membershipGiftingEvent" ->
      decode.success(LiveChatMessageSnippetTypeMembershipGiftingEvent)
    "giftMembershipReceivedEvent" ->
      decode.success(LiveChatMessageSnippetTypeGiftMembershipReceivedEvent)
    "messageDeletedEvent" ->
      decode.success(LiveChatMessageSnippetTypeMessageDeletedEvent)
    "messageRetractedEvent" ->
      decode.success(LiveChatMessageSnippetTypeMessageRetractedEvent)
    "userBannedEvent" ->
      decode.success(LiveChatMessageSnippetTypeUserBannedEvent)
    "superChatEvent" -> decode.success(LiveChatMessageSnippetTypeSuperChatEvent)
    "superStickerEvent" ->
      decode.success(LiveChatMessageSnippetTypeSuperStickerEvent)
    "pollEvent" -> decode.success(LiveChatMessageSnippetTypePollEvent)
    "giftEvent" -> decode.success(LiveChatMessageSnippetTypeGiftEvent)
    _ ->
      decode.failure(
        LiveChatMessageSnippetTypeInvalidType,
        "a valid LiveChatMessageSnippetType",
      )
  }
}

/// A *liveChatModerator* resource represents a moderator for a YouTube live chat. A chat moderator has the ability to ban/unban users from a chat, remove message, etc.
pub type LiveChatModerator {
  LiveChatModerator(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveChatModeratorSnippet),
  )
}

pub fn live_chat_moderator_decoder() -> Decoder(LiveChatModerator) {
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
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_chat_moderator_snippet_decoder()),
  )
  decode.success(LiveChatModerator(etag, id, kind, snippet))
}

pub fn live_chat_moderator_to_json(value: LiveChatModerator) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "snippet",
      json.nullable(value.snippet, live_chat_moderator_snippet_to_json),
    ),
  ])
}

pub type LiveChatModeratorListResponse {
  LiveChatModeratorListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(LiveChatModerator)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn live_chat_moderator_list_response_decoder() -> Decoder(
  LiveChatModeratorListResponse,
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
    decode.optional(decode.list(live_chat_moderator_decoder())),
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
  decode.success(LiveChatModeratorListResponse(
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

pub fn live_chat_moderator_list_response_to_json(
  value: LiveChatModeratorListResponse,
) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, live_chat_moderator_to_json)
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

pub type LiveChatModeratorSnippet {
  LiveChatModeratorSnippet(
    live_chat_id: Option(String),
    moderator_details: Option(ChannelProfileDetails),
  )
}

pub fn live_chat_moderator_snippet_decoder() -> Decoder(
  LiveChatModeratorSnippet,
) {
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use moderator_details <- decode.optional_field(
    "moderatorDetails",
    option.None,
    decode.optional(channel.channel_profile_details_decoder()),
  )
  decode.success(LiveChatModeratorSnippet(live_chat_id, moderator_details))
}

pub fn live_chat_moderator_snippet_to_json(
  value: LiveChatModeratorSnippet,
) -> Json {
  json.object([
    #("liveChatId", json.nullable(value.live_chat_id, json.string)),
    #(
      "moderatorDetails",
      json.nullable(
        value.moderator_details,
        channel.channel_profile_details_to_json,
      ),
    ),
  ])
}

pub type LiveChatNewSponsorDetails {
  LiveChatNewSponsorDetails(
    is_upgrade: Option(Bool),
    member_level_name: Option(String),
  )
}

pub fn live_chat_new_sponsor_details_decoder() -> Decoder(
  LiveChatNewSponsorDetails,
) {
  use is_upgrade <- decode.optional_field(
    "isUpgrade",
    option.None,
    decode.optional(decode.bool),
  )
  use member_level_name <- decode.optional_field(
    "memberLevelName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatNewSponsorDetails(is_upgrade, member_level_name))
}

pub fn live_chat_new_sponsor_details_to_json(
  value: LiveChatNewSponsorDetails,
) -> Json {
  json.object([
    #("isUpgrade", json.nullable(value.is_upgrade, json.bool)),
    #("memberLevelName", json.nullable(value.member_level_name, json.string)),
  ])
}

pub type LiveChatPollDetails {
  LiveChatPollDetails(
    metadata: Option(LiveChatPollDetailsPollMetadata),
    status: Option(LiveChatPollDetailsStatus),
  )
}

pub fn live_chat_poll_details_decoder() -> Decoder(LiveChatPollDetails) {
  use metadata <- decode.optional_field(
    "metadata",
    option.None,
    decode.optional(live_chat_poll_details_poll_metadata_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(live_chat_poll_details_status_decoder()),
  )
  decode.success(LiveChatPollDetails(metadata, status))
}

pub fn live_chat_poll_details_to_json(value: LiveChatPollDetails) -> Json {
  json.object([
    #(
      "metadata",
      json.nullable(
        value.metadata,
        live_chat_poll_details_poll_metadata_to_json,
      ),
    ),
    #(
      "status",
      json.nullable(value.status, fn(e) {
        json.string(live_chat_poll_details_status_to_string(e))
      }),
    ),
  ])
}

pub type LiveChatPollDetailsStatus {
  LiveChatPollDetailsStatusUnknown
  LiveChatPollDetailsStatusActive
  LiveChatPollDetailsStatusClosed
}

pub fn live_chat_poll_details_status_to_string(
  value: LiveChatPollDetailsStatus,
) -> String {
  case value {
    LiveChatPollDetailsStatusUnknown -> "unknown"
    LiveChatPollDetailsStatusActive -> "active"
    LiveChatPollDetailsStatusClosed -> "closed"
  }
}

pub fn live_chat_poll_details_status_decoder() -> Decoder(
  LiveChatPollDetailsStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "unknown" -> decode.success(LiveChatPollDetailsStatusUnknown)
    "active" -> decode.success(LiveChatPollDetailsStatusActive)
    "closed" -> decode.success(LiveChatPollDetailsStatusClosed)
    _ ->
      decode.failure(
        LiveChatPollDetailsStatusUnknown,
        "a valid LiveChatPollDetailsStatus",
      )
  }
}

pub type LiveChatPollDetailsPollMetadata {
  LiveChatPollDetailsPollMetadata(
    options: Option(List(LiveChatPollDetailsPollMetadataPollOption)),
    question_text: Option(String),
  )
}

pub fn live_chat_poll_details_poll_metadata_decoder() -> Decoder(
  LiveChatPollDetailsPollMetadata,
) {
  use options <- decode.optional_field(
    "options",
    option.None,
    decode.optional(
      decode.list(live_chat_poll_details_poll_metadata_poll_option_decoder()),
    ),
  )
  use question_text <- decode.optional_field(
    "questionText",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatPollDetailsPollMetadata(options, question_text))
}

pub fn live_chat_poll_details_poll_metadata_to_json(
  value: LiveChatPollDetailsPollMetadata,
) -> Json {
  json.object([
    #(
      "options",
      json.nullable(value.options, fn(items) {
        json.array(
          items,
          live_chat_poll_details_poll_metadata_poll_option_to_json,
        )
      }),
    ),
    #("questionText", json.nullable(value.question_text, json.string)),
  ])
}

pub type LiveChatPollDetailsPollMetadataPollOption {
  LiveChatPollDetailsPollMetadataPollOption(
    option_text: Option(String),
    tally: Option(String),
  )
}

pub fn live_chat_poll_details_poll_metadata_poll_option_decoder() -> Decoder(
  LiveChatPollDetailsPollMetadataPollOption,
) {
  use option_text <- decode.optional_field(
    "optionText",
    option.None,
    decode.optional(decode.string),
  )
  use tally <- decode.optional_field(
    "tally",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatPollDetailsPollMetadataPollOption(option_text, tally))
}

pub fn live_chat_poll_details_poll_metadata_poll_option_to_json(
  value: LiveChatPollDetailsPollMetadataPollOption,
) -> Json {
  json.object([
    #("optionText", json.nullable(value.option_text, json.string)),
    #("tally", json.nullable(value.tally, json.string)),
  ])
}

pub type LiveChatSuperChatDetails {
  LiveChatSuperChatDetails(
    amount_display_string: Option(String),
    amount_micros: Option(String),
    currency: Option(String),
    tier: Option(Int),
    user_comment: Option(String),
  )
}

pub fn live_chat_super_chat_details_decoder() -> Decoder(
  LiveChatSuperChatDetails,
) {
  use amount_display_string <- decode.optional_field(
    "amountDisplayString",
    option.None,
    decode.optional(decode.string),
  )
  use amount_micros <- decode.optional_field(
    "amountMicros",
    option.None,
    decode.optional(decode.string),
  )
  use currency <- decode.optional_field(
    "currency",
    option.None,
    decode.optional(decode.string),
  )
  use tier <- decode.optional_field(
    "tier",
    option.None,
    decode.optional(decode.int),
  )
  use user_comment <- decode.optional_field(
    "userComment",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatSuperChatDetails(
    amount_display_string,
    amount_micros,
    currency,
    tier,
    user_comment,
  ))
}

pub fn live_chat_super_chat_details_to_json(
  value: LiveChatSuperChatDetails,
) -> Json {
  json.object([
    #(
      "amountDisplayString",
      json.nullable(value.amount_display_string, json.string),
    ),
    #("amountMicros", json.nullable(value.amount_micros, json.string)),
    #("currency", json.nullable(value.currency, json.string)),
    #("tier", json.nullable(value.tier, json.int)),
    #("userComment", json.nullable(value.user_comment, json.string)),
  ])
}

pub type LiveChatSuperStickerDetails {
  LiveChatSuperStickerDetails(
    amount_display_string: Option(String),
    amount_micros: Option(String),
    currency: Option(String),
    super_sticker_metadata: Option(SuperStickerMetadata),
    tier: Option(Int),
  )
}

pub fn live_chat_super_sticker_details_decoder() -> Decoder(
  LiveChatSuperStickerDetails,
) {
  use amount_display_string <- decode.optional_field(
    "amountDisplayString",
    option.None,
    decode.optional(decode.string),
  )
  use amount_micros <- decode.optional_field(
    "amountMicros",
    option.None,
    decode.optional(decode.string),
  )
  use currency <- decode.optional_field(
    "currency",
    option.None,
    decode.optional(decode.string),
  )
  use super_sticker_metadata <- decode.optional_field(
    "superStickerMetadata",
    option.None,
    decode.optional(super.super_sticker_metadata_decoder()),
  )
  use tier <- decode.optional_field(
    "tier",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(LiveChatSuperStickerDetails(
    amount_display_string,
    amount_micros,
    currency,
    super_sticker_metadata,
    tier,
  ))
}

pub fn live_chat_super_sticker_details_to_json(
  value: LiveChatSuperStickerDetails,
) -> Json {
  json.object([
    #(
      "amountDisplayString",
      json.nullable(value.amount_display_string, json.string),
    ),
    #("amountMicros", json.nullable(value.amount_micros, json.string)),
    #("currency", json.nullable(value.currency, json.string)),
    #(
      "superStickerMetadata",
      json.nullable(
        value.super_sticker_metadata,
        super.super_sticker_metadata_to_json,
      ),
    ),
    #("tier", json.nullable(value.tier, json.int)),
  ])
}

pub type LiveChatTextMessageDetails {
  LiveChatTextMessageDetails(message_text: Option(String))
}

pub fn live_chat_text_message_details_decoder() -> Decoder(
  LiveChatTextMessageDetails,
) {
  use message_text <- decode.optional_field(
    "messageText",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatTextMessageDetails(message_text))
}

pub fn live_chat_text_message_details_to_json(
  value: LiveChatTextMessageDetails,
) -> Json {
  json.object([#("messageText", json.nullable(value.message_text, json.string))])
}

pub type LiveChatUserBannedMessageDetails {
  LiveChatUserBannedMessageDetails(
    ban_duration_seconds: Option(String),
    ban_type: Option(BanType),
    banned_user_details: Option(ChannelProfileDetails),
  )
}

pub fn live_chat_user_banned_message_details_decoder() -> Decoder(
  LiveChatUserBannedMessageDetails,
) {
  use ban_duration_seconds <- decode.optional_field(
    "banDurationSeconds",
    option.None,
    decode.optional(decode.string),
  )
  use ban_type <- decode.optional_field(
    "banType",
    option.None,
    decode.optional(ban_type_decoder()),
  )
  use banned_user_details <- decode.optional_field(
    "bannedUserDetails",
    option.None,
    decode.optional(channel.channel_profile_details_decoder()),
  )
  decode.success(LiveChatUserBannedMessageDetails(
    ban_duration_seconds,
    ban_type,
    banned_user_details,
  ))
}

pub fn live_chat_user_banned_message_details_to_json(
  value: LiveChatUserBannedMessageDetails,
) -> Json {
  json.object([
    #(
      "banDurationSeconds",
      json.nullable(value.ban_duration_seconds, json.string),
    ),
    #(
      "banType",
      json.nullable(value.ban_type, fn(e) { json.string(ban_type_to_string(e)) }),
    ),
    #(
      "bannedUserDetails",
      json.nullable(
        value.banned_user_details,
        channel.channel_profile_details_to_json,
      ),
    ),
  ])
}

/// The type of ban.
pub type BanType {
  BanTypePermanent
  BanTypeTemporary
}

pub fn ban_type_to_string(value: BanType) -> String {
  case value {
    BanTypePermanent -> "permanent"
    BanTypeTemporary -> "temporary"
  }
}

pub fn ban_type_decoder() -> Decoder(BanType) {
  use value <- decode.then(decode.string)
  case value {
    "permanent" -> decode.success(BanTypePermanent)
    "temporary" -> decode.success(BanTypeTemporary)
    _ -> decode.failure(BanTypePermanent, "a valid BanType")
  }
}

/// A live stream describes a live ingestion point.
pub type LiveStream {
  LiveStream(
    cdn: Option(CdnSettings),
    content_details: Option(LiveStreamContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveStreamSnippet),
    status: Option(LiveStreamStatus),
  )
}

pub fn live_stream_decoder() -> Decoder(LiveStream) {
  use cdn <- decode.optional_field(
    "cdn",
    option.None,
    decode.optional(cdn_settings_decoder()),
  )
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(live_stream_content_details_decoder()),
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
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_stream_snippet_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(live_stream_status_decoder()),
  )
  decode.success(LiveStream(
    cdn,
    content_details,
    etag,
    id,
    kind,
    snippet,
    status,
  ))
}

pub fn live_stream_to_json(value: LiveStream) -> Json {
  json.object([
    #("cdn", json.nullable(value.cdn, cdn_settings_to_json)),
    #(
      "contentDetails",
      json.nullable(value.content_details, live_stream_content_details_to_json),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, live_stream_snippet_to_json)),
    #("status", json.nullable(value.status, live_stream_status_to_json)),
  ])
}

pub type LiveStreamConfigurationIssue {
  LiveStreamConfigurationIssue(
    description: Option(String),
    reason: Option(String),
    severity: Option(Severity),
    type_: Option(LiveStreamConfigurationIssueType),
  )
}

pub fn live_stream_configuration_issue_decoder() -> Decoder(
  LiveStreamConfigurationIssue,
) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use reason <- decode.optional_field(
    "reason",
    option.None,
    decode.optional(decode.string),
  )
  use severity <- decode.optional_field(
    "severity",
    option.None,
    decode.optional(severity_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(live_stream_configuration_issue_type_decoder()),
  )
  decode.success(LiveStreamConfigurationIssue(
    description,
    reason,
    severity,
    type_,
  ))
}

pub fn live_stream_configuration_issue_to_json(
  value: LiveStreamConfigurationIssue,
) -> Json {
  json.object([
    #("description", json.nullable(value.description, json.string)),
    #("reason", json.nullable(value.reason, json.string)),
    #(
      "severity",
      json.nullable(value.severity, fn(e) { json.string(severity_to_string(e)) }),
    ),
    #(
      "type",
      json.nullable(value.type_, fn(e) {
        json.string(live_stream_configuration_issue_type_to_string(e))
      }),
    ),
  ])
}

/// How severe this issue is to the stream.
pub type Severity {
  SeverityInfo
  SeverityWarning
  SeverityError
}

pub fn severity_to_string(value: Severity) -> String {
  case value {
    SeverityInfo -> "info"
    SeverityWarning -> "warning"
    SeverityError -> "error"
  }
}

pub fn severity_decoder() -> Decoder(Severity) {
  use value <- decode.then(decode.string)
  case value {
    "info" -> decode.success(SeverityInfo)
    "warning" -> decode.success(SeverityWarning)
    "error" -> decode.success(SeverityError)
    _ -> decode.failure(SeverityInfo, "a valid Severity")
  }
}

/// The kind of error happening.
pub type LiveStreamConfigurationIssueType {
  LiveStreamConfigurationIssueTypeGopSizeOver
  LiveStreamConfigurationIssueTypeGopSizeLong
  LiveStreamConfigurationIssueTypeGopSizeShort
  LiveStreamConfigurationIssueTypeOpenGop
  LiveStreamConfigurationIssueTypeBadContainer
  LiveStreamConfigurationIssueTypeAudioBitrateHigh
  LiveStreamConfigurationIssueTypeAudioBitrateLow
  LiveStreamConfigurationIssueTypeAudioSampleRate
  LiveStreamConfigurationIssueTypeBitrateHigh
  LiveStreamConfigurationIssueTypeBitrateLow
  LiveStreamConfigurationIssueTypeAudioCodec
  LiveStreamConfigurationIssueTypeVideoCodec
  LiveStreamConfigurationIssueTypeNoAudioStream
  LiveStreamConfigurationIssueTypeNoVideoStream
  LiveStreamConfigurationIssueTypeMultipleVideoStreams
  LiveStreamConfigurationIssueTypeMultipleAudioStreams
  LiveStreamConfigurationIssueTypeAudioTooManyChannels
  LiveStreamConfigurationIssueTypeInterlacedVideo
  LiveStreamConfigurationIssueTypeFrameRateHigh
  LiveStreamConfigurationIssueTypeResolutionMismatch
  LiveStreamConfigurationIssueTypeVideoCodecMismatch
  LiveStreamConfigurationIssueTypeVideoInterlaceMismatch
  LiveStreamConfigurationIssueTypeVideoProfileMismatch
  LiveStreamConfigurationIssueTypeVideoBitrateMismatch
  LiveStreamConfigurationIssueTypeFramerateMismatch
  LiveStreamConfigurationIssueTypeGopMismatch
  LiveStreamConfigurationIssueTypeAudioSampleRateMismatch
  LiveStreamConfigurationIssueTypeAudioStereoMismatch
  LiveStreamConfigurationIssueTypeAudioCodecMismatch
  LiveStreamConfigurationIssueTypeAudioBitrateMismatch
  LiveStreamConfigurationIssueTypeVideoResolutionSuboptimal
  LiveStreamConfigurationIssueTypeVideoResolutionUnsupported
  LiveStreamConfigurationIssueTypeVideoIngestionStarved
  LiveStreamConfigurationIssueTypeVideoIngestionFasterThanRealtime
}

pub fn live_stream_configuration_issue_type_to_string(
  value: LiveStreamConfigurationIssueType,
) -> String {
  case value {
    LiveStreamConfigurationIssueTypeGopSizeOver -> "gopSizeOver"
    LiveStreamConfigurationIssueTypeGopSizeLong -> "gopSizeLong"
    LiveStreamConfigurationIssueTypeGopSizeShort -> "gopSizeShort"
    LiveStreamConfigurationIssueTypeOpenGop -> "openGop"
    LiveStreamConfigurationIssueTypeBadContainer -> "badContainer"
    LiveStreamConfigurationIssueTypeAudioBitrateHigh -> "audioBitrateHigh"
    LiveStreamConfigurationIssueTypeAudioBitrateLow -> "audioBitrateLow"
    LiveStreamConfigurationIssueTypeAudioSampleRate -> "audioSampleRate"
    LiveStreamConfigurationIssueTypeBitrateHigh -> "bitrateHigh"
    LiveStreamConfigurationIssueTypeBitrateLow -> "bitrateLow"
    LiveStreamConfigurationIssueTypeAudioCodec -> "audioCodec"
    LiveStreamConfigurationIssueTypeVideoCodec -> "videoCodec"
    LiveStreamConfigurationIssueTypeNoAudioStream -> "noAudioStream"
    LiveStreamConfigurationIssueTypeNoVideoStream -> "noVideoStream"
    LiveStreamConfigurationIssueTypeMultipleVideoStreams ->
      "multipleVideoStreams"
    LiveStreamConfigurationIssueTypeMultipleAudioStreams ->
      "multipleAudioStreams"
    LiveStreamConfigurationIssueTypeAudioTooManyChannels ->
      "audioTooManyChannels"
    LiveStreamConfigurationIssueTypeInterlacedVideo -> "interlacedVideo"
    LiveStreamConfigurationIssueTypeFrameRateHigh -> "frameRateHigh"
    LiveStreamConfigurationIssueTypeResolutionMismatch -> "resolutionMismatch"
    LiveStreamConfigurationIssueTypeVideoCodecMismatch -> "videoCodecMismatch"
    LiveStreamConfigurationIssueTypeVideoInterlaceMismatch ->
      "videoInterlaceMismatch"
    LiveStreamConfigurationIssueTypeVideoProfileMismatch ->
      "videoProfileMismatch"
    LiveStreamConfigurationIssueTypeVideoBitrateMismatch ->
      "videoBitrateMismatch"
    LiveStreamConfigurationIssueTypeFramerateMismatch -> "framerateMismatch"
    LiveStreamConfigurationIssueTypeGopMismatch -> "gopMismatch"
    LiveStreamConfigurationIssueTypeAudioSampleRateMismatch ->
      "audioSampleRateMismatch"
    LiveStreamConfigurationIssueTypeAudioStereoMismatch -> "audioStereoMismatch"
    LiveStreamConfigurationIssueTypeAudioCodecMismatch -> "audioCodecMismatch"
    LiveStreamConfigurationIssueTypeAudioBitrateMismatch ->
      "audioBitrateMismatch"
    LiveStreamConfigurationIssueTypeVideoResolutionSuboptimal ->
      "videoResolutionSuboptimal"
    LiveStreamConfigurationIssueTypeVideoResolutionUnsupported ->
      "videoResolutionUnsupported"
    LiveStreamConfigurationIssueTypeVideoIngestionStarved ->
      "videoIngestionStarved"
    LiveStreamConfigurationIssueTypeVideoIngestionFasterThanRealtime ->
      "videoIngestionFasterThanRealtime"
  }
}

pub fn live_stream_configuration_issue_type_decoder() -> Decoder(
  LiveStreamConfigurationIssueType,
) {
  use value <- decode.then(decode.string)
  case value {
    "gopSizeOver" -> decode.success(LiveStreamConfigurationIssueTypeGopSizeOver)
    "gopSizeLong" -> decode.success(LiveStreamConfigurationIssueTypeGopSizeLong)
    "gopSizeShort" ->
      decode.success(LiveStreamConfigurationIssueTypeGopSizeShort)
    "openGop" -> decode.success(LiveStreamConfigurationIssueTypeOpenGop)
    "badContainer" ->
      decode.success(LiveStreamConfigurationIssueTypeBadContainer)
    "audioBitrateHigh" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioBitrateHigh)
    "audioBitrateLow" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioBitrateLow)
    "audioSampleRate" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioSampleRate)
    "bitrateHigh" -> decode.success(LiveStreamConfigurationIssueTypeBitrateHigh)
    "bitrateLow" -> decode.success(LiveStreamConfigurationIssueTypeBitrateLow)
    "audioCodec" -> decode.success(LiveStreamConfigurationIssueTypeAudioCodec)
    "videoCodec" -> decode.success(LiveStreamConfigurationIssueTypeVideoCodec)
    "noAudioStream" ->
      decode.success(LiveStreamConfigurationIssueTypeNoAudioStream)
    "noVideoStream" ->
      decode.success(LiveStreamConfigurationIssueTypeNoVideoStream)
    "multipleVideoStreams" ->
      decode.success(LiveStreamConfigurationIssueTypeMultipleVideoStreams)
    "multipleAudioStreams" ->
      decode.success(LiveStreamConfigurationIssueTypeMultipleAudioStreams)
    "audioTooManyChannels" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioTooManyChannels)
    "interlacedVideo" ->
      decode.success(LiveStreamConfigurationIssueTypeInterlacedVideo)
    "frameRateHigh" ->
      decode.success(LiveStreamConfigurationIssueTypeFrameRateHigh)
    "resolutionMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeResolutionMismatch)
    "videoCodecMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoCodecMismatch)
    "videoInterlaceMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoInterlaceMismatch)
    "videoProfileMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoProfileMismatch)
    "videoBitrateMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoBitrateMismatch)
    "framerateMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeFramerateMismatch)
    "gopMismatch" -> decode.success(LiveStreamConfigurationIssueTypeGopMismatch)
    "audioSampleRateMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioSampleRateMismatch)
    "audioStereoMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioStereoMismatch)
    "audioCodecMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioCodecMismatch)
    "audioBitrateMismatch" ->
      decode.success(LiveStreamConfigurationIssueTypeAudioBitrateMismatch)
    "videoResolutionSuboptimal" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoResolutionSuboptimal)
    "videoResolutionUnsupported" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoResolutionUnsupported)
    "videoIngestionStarved" ->
      decode.success(LiveStreamConfigurationIssueTypeVideoIngestionStarved)
    "videoIngestionFasterThanRealtime" ->
      decode.success(
        LiveStreamConfigurationIssueTypeVideoIngestionFasterThanRealtime,
      )
    _ ->
      decode.failure(
        LiveStreamConfigurationIssueTypeGopSizeOver,
        "a valid LiveStreamConfigurationIssueType",
      )
  }
}

/// Detailed settings of a stream.
pub type LiveStreamContentDetails {
  LiveStreamContentDetails(
    closed_captions_ingestion_url: Option(String),
    is_reusable: Option(Bool),
  )
}

pub fn live_stream_content_details_decoder() -> Decoder(
  LiveStreamContentDetails,
) {
  use closed_captions_ingestion_url <- decode.optional_field(
    "closedCaptionsIngestionUrl",
    option.None,
    decode.optional(decode.string),
  )
  use is_reusable <- decode.optional_field(
    "isReusable",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(LiveStreamContentDetails(
    closed_captions_ingestion_url,
    is_reusable,
  ))
}

pub fn live_stream_content_details_to_json(
  value: LiveStreamContentDetails,
) -> Json {
  json.object([
    #(
      "closedCaptionsIngestionUrl",
      json.nullable(value.closed_captions_ingestion_url, json.string),
    ),
    #("isReusable", json.nullable(value.is_reusable, json.bool)),
  ])
}

pub type LiveStreamHealthStatus {
  LiveStreamHealthStatus(
    configuration_issues: Option(List(LiveStreamConfigurationIssue)),
    last_update_time_seconds: Option(String),
    status: Option(LiveStreamHealthStatusStatus),
  )
}

pub fn live_stream_health_status_decoder() -> Decoder(LiveStreamHealthStatus) {
  use configuration_issues <- decode.optional_field(
    "configurationIssues",
    option.None,
    decode.optional(decode.list(live_stream_configuration_issue_decoder())),
  )
  use last_update_time_seconds <- decode.optional_field(
    "lastUpdateTimeSeconds",
    option.None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(live_stream_health_status_status_decoder()),
  )
  decode.success(LiveStreamHealthStatus(
    configuration_issues,
    last_update_time_seconds,
    status,
  ))
}

pub fn live_stream_health_status_to_json(
  value: LiveStreamHealthStatus,
) -> Json {
  json.object([
    #(
      "configurationIssues",
      json.nullable(value.configuration_issues, fn(items) {
        json.array(items, live_stream_configuration_issue_to_json)
      }),
    ),
    #(
      "lastUpdateTimeSeconds",
      json.nullable(value.last_update_time_seconds, json.string),
    ),
    #(
      "status",
      json.nullable(value.status, fn(e) {
        json.string(live_stream_health_status_status_to_string(e))
      }),
    ),
  ])
}

/// The status code of this stream
pub type LiveStreamHealthStatusStatus {
  LiveStreamHealthStatusStatusGood
  LiveStreamHealthStatusStatusOk
  LiveStreamHealthStatusStatusBad
  LiveStreamHealthStatusStatusNoData
  LiveStreamHealthStatusStatusRevoked
}

pub fn live_stream_health_status_status_to_string(
  value: LiveStreamHealthStatusStatus,
) -> String {
  case value {
    LiveStreamHealthStatusStatusGood -> "good"
    LiveStreamHealthStatusStatusOk -> "ok"
    LiveStreamHealthStatusStatusBad -> "bad"
    LiveStreamHealthStatusStatusNoData -> "noData"
    LiveStreamHealthStatusStatusRevoked -> "revoked"
  }
}

pub fn live_stream_health_status_status_decoder() -> Decoder(
  LiveStreamHealthStatusStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "good" -> decode.success(LiveStreamHealthStatusStatusGood)
    "ok" -> decode.success(LiveStreamHealthStatusStatusOk)
    "bad" -> decode.success(LiveStreamHealthStatusStatusBad)
    "noData" -> decode.success(LiveStreamHealthStatusStatusNoData)
    "revoked" -> decode.success(LiveStreamHealthStatusStatusRevoked)
    _ ->
      decode.failure(
        LiveStreamHealthStatusStatusGood,
        "a valid LiveStreamHealthStatusStatus",
      )
  }
}

pub type LiveStreamListResponse {
  LiveStreamListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(LiveStream)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn live_stream_list_response_decoder() -> Decoder(LiveStreamListResponse) {
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
    decode.optional(decode.list(live_stream_decoder())),
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
  decode.success(LiveStreamListResponse(
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

pub fn live_stream_list_response_to_json(
  value: LiveStreamListResponse,
) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, live_stream_to_json)
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

pub type LiveStreamSnippet {
  LiveStreamSnippet(
    channel_id: Option(String),
    description: Option(String),
    is_default_stream: Option(Bool),
    published_at: Option(String),
    title: Option(String),
  )
}

pub fn live_stream_snippet_decoder() -> Decoder(LiveStreamSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use is_default_stream <- decode.optional_field(
    "isDefaultStream",
    option.None,
    decode.optional(decode.bool),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveStreamSnippet(
    channel_id,
    description,
    is_default_stream,
    published_at,
    title,
  ))
}

pub fn live_stream_snippet_to_json(value: LiveStreamSnippet) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #("isDefaultStream", json.nullable(value.is_default_stream, json.bool)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #("title", json.nullable(value.title, json.string)),
  ])
}

/// Brief description of the live stream status.
pub type LiveStreamStatus {
  LiveStreamStatus(
    health_status: Option(LiveStreamHealthStatus),
    stream_status: Option(StreamStatus),
  )
}

pub fn live_stream_status_decoder() -> Decoder(LiveStreamStatus) {
  use health_status <- decode.optional_field(
    "healthStatus",
    option.None,
    decode.optional(live_stream_health_status_decoder()),
  )
  use stream_status <- decode.optional_field(
    "streamStatus",
    option.None,
    decode.optional(stream_status_decoder()),
  )
  decode.success(LiveStreamStatus(health_status, stream_status))
}

pub fn live_stream_status_to_json(value: LiveStreamStatus) -> Json {
  json.object([
    #(
      "healthStatus",
      json.nullable(value.health_status, live_stream_health_status_to_json),
    ),
    #(
      "streamStatus",
      json.nullable(value.stream_status, fn(e) {
        json.string(stream_status_to_string(e))
      }),
    ),
  ])
}

pub type StreamStatus {
  StreamStatusCreated
  StreamStatusReady
  StreamStatusActive
  StreamStatusInactive
  StreamStatusError
}

pub fn stream_status_to_string(value: StreamStatus) -> String {
  case value {
    StreamStatusCreated -> "created"
    StreamStatusReady -> "ready"
    StreamStatusActive -> "active"
    StreamStatusInactive -> "inactive"
    StreamStatusError -> "error"
  }
}

pub fn stream_status_decoder() -> Decoder(StreamStatus) {
  use value <- decode.then(decode.string)
  case value {
    "created" -> decode.success(StreamStatusCreated)
    "ready" -> decode.success(StreamStatusReady)
    "active" -> decode.success(StreamStatusActive)
    "inactive" -> decode.success(StreamStatusInactive)
    "error" -> decode.success(StreamStatusError)
    _ -> decode.failure(StreamStatusCreated, "a valid StreamStatus")
  }
}

/// Settings and Info of the monitor stream
pub type MonitorStreamInfo {
  MonitorStreamInfo(
    broadcast_stream_delay_ms: Option(Int),
    embed_html: Option(String),
    enable_monitor_stream: Option(Bool),
  )
}

pub fn monitor_stream_info_decoder() -> Decoder(MonitorStreamInfo) {
  use broadcast_stream_delay_ms <- decode.optional_field(
    "broadcastStreamDelayMs",
    option.None,
    decode.optional(decode.int),
  )
  use embed_html <- decode.optional_field(
    "embedHtml",
    option.None,
    decode.optional(decode.string),
  )
  use enable_monitor_stream <- decode.optional_field(
    "enableMonitorStream",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(MonitorStreamInfo(
    broadcast_stream_delay_ms,
    embed_html,
    enable_monitor_stream,
  ))
}

pub fn monitor_stream_info_to_json(value: MonitorStreamInfo) -> Json {
  json.object([
    #(
      "broadcastStreamDelayMs",
      json.nullable(value.broadcast_stream_delay_ms, json.int),
    ),
    #("embedHtml", json.nullable(value.embed_html, json.string)),
    #(
      "enableMonitorStream",
      json.nullable(value.enable_monitor_stream, json.bool),
    ),
  ])
}
