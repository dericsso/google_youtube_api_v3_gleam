//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option
import youtube/availability_config.{type AvailabilityConfig}
import youtube/monitor_stream_info.{type MonitorStreamInfo}

/// Detailed settings of a broadcast.
pub type LiveBroadcastContentDetails {
  LiveBroadcastContentDetails(
    availability_config: option.Option(AvailabilityConfig),
    bound_stream_id: option.Option(String),
    bound_stream_last_update_time_ms: option.Option(String),
    closed_captions_type: option.Option(ClosedCaptionsType),
    enable_auto_start: option.Option(Bool),
    enable_auto_stop: option.Option(Bool),
    enable_closed_captions: option.Option(Bool),
    enable_content_encryption: option.Option(Bool),
    enable_dvr: option.Option(Bool),
    enable_embed: option.Option(Bool),
    enable_low_latency: option.Option(Bool),
    latency_preference: option.Option(LatencyPreference),
    mesh: option.Option(String),
    monitor_stream: option.Option(MonitorStreamInfo),
    projection: option.Option(Projection),
    record_from_start: option.Option(Bool),
    start_with_slate: option.Option(Bool),
    stereo_layout: option.Option(StereoLayout),
  )
}

pub fn decoder() -> Decoder(LiveBroadcastContentDetails) {
  use availability_config <- optional_field(
    "availabilityConfig",
    option.None,
    optional(availability_config.decoder()),
  )
  use bound_stream_id <- optional_field(
    "boundStreamId",
    option.None,
    optional(string),
  )
  use bound_stream_last_update_time_ms <- optional_field(
    "boundStreamLastUpdateTimeMs",
    option.None,
    optional(string),
  )
  use closed_captions_type <- optional_field(
    "closedCaptionsType",
    option.None,
    optional(closed_captions_type_decoder()),
  )
  use enable_auto_start <- optional_field(
    "enableAutoStart",
    option.None,
    optional(bool),
  )
  use enable_auto_stop <- optional_field(
    "enableAutoStop",
    option.None,
    optional(bool),
  )
  use enable_closed_captions <- optional_field(
    "enableClosedCaptions",
    option.None,
    optional(bool),
  )
  use enable_content_encryption <- optional_field(
    "enableContentEncryption",
    option.None,
    optional(bool),
  )
  use enable_dvr <- optional_field("enableDvr", option.None, optional(bool))
  use enable_embed <- optional_field("enableEmbed", option.None, optional(bool))
  use enable_low_latency <- optional_field(
    "enableLowLatency",
    option.None,
    optional(bool),
  )
  use latency_preference <- optional_field(
    "latencyPreference",
    option.None,
    optional(latency_preference_decoder()),
  )
  use mesh <- optional_field("mesh", option.None, optional(string))
  use monitor_stream <- optional_field(
    "monitorStream",
    option.None,
    optional(monitor_stream_info.decoder()),
  )
  use projection <- optional_field(
    "projection",
    option.None,
    optional(projection_decoder()),
  )
  use record_from_start <- optional_field(
    "recordFromStart",
    option.None,
    optional(bool),
  )
  use start_with_slate <- optional_field(
    "startWithSlate",
    option.None,
    optional(bool),
  )
  use stereo_layout <- optional_field(
    "stereoLayout",
    option.None,
    optional(stereo_layout_decoder()),
  )
  success(
    LiveBroadcastContentDetails(
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
    ),
  )
}

pub type ClosedCaptionsType {
  ClosedCaptionsTypeClosedCaptionsTypeUnspecified
  ClosedCaptionsTypeClosedCaptionsDisabled
  ClosedCaptionsTypeClosedCaptionsHttpPost
  ClosedCaptionsTypeClosedCaptionsEmbedded
}

pub fn closed_captions_type_to_string(value: ClosedCaptionsType) -> String {
  case value {
    ClosedCaptionsTypeClosedCaptionsTypeUnspecified -> "closedCaptionsTypeUnspecified"
    ClosedCaptionsTypeClosedCaptionsDisabled -> "closedCaptionsDisabled"
    ClosedCaptionsTypeClosedCaptionsHttpPost -> "closedCaptionsHttpPost"
    ClosedCaptionsTypeClosedCaptionsEmbedded -> "closedCaptionsEmbedded"
  }
}

pub fn closed_captions_type_decoder() -> Decoder(ClosedCaptionsType) {
  use value <- then(string)
  case value {
    "closedCaptionsTypeUnspecified" -> success(
      ClosedCaptionsTypeClosedCaptionsTypeUnspecified,
    )
    "closedCaptionsDisabled" -> success(
      ClosedCaptionsTypeClosedCaptionsDisabled,
    )
    "closedCaptionsHttpPost" -> success(
      ClosedCaptionsTypeClosedCaptionsHttpPost,
    )
    "closedCaptionsEmbedded" -> success(
      ClosedCaptionsTypeClosedCaptionsEmbedded,
    )
    _ -> failure(
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
    LatencyPreferenceLatencyPreferenceUnspecified -> "latencyPreferenceUnspecified"
    LatencyPreferenceNormal -> "normal"
    LatencyPreferenceLow -> "low"
    LatencyPreferenceUltraLow -> "ultraLow"
  }
}

pub fn latency_preference_decoder() -> Decoder(LatencyPreference) {
  use value <- then(string)
  case value {
    "latencyPreferenceUnspecified" -> success(
      LatencyPreferenceLatencyPreferenceUnspecified,
    )
    "normal" -> success(LatencyPreferenceNormal)
    "low" -> success(LatencyPreferenceLow)
    "ultraLow" -> success(LatencyPreferenceUltraLow)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "projectionUnspecified" -> success(ProjectionProjectionUnspecified)
    "rectangular" -> success(ProjectionRectangular)
    "360" -> success(ProjectionValue360)
    "mesh" -> success(ProjectionMesh)
    _ -> failure(ProjectionProjectionUnspecified, "a valid Projection")
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
  use value <- then(string)
  case value {
    "stereoLayoutUnspecified" -> success(StereoLayoutStereoLayoutUnspecified)
    "mono" -> success(StereoLayoutMono)
    "leftRight" -> success(StereoLayoutLeftRight)
    "topBottom" -> success(StereoLayoutTopBottom)
    _ -> failure(StereoLayoutStereoLayoutUnspecified, "a valid StereoLayout")
  }
}