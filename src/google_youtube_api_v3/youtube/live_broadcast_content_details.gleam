//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/availability_config.{type AvailabilityConfig}
import google_youtube_api_v3/youtube/monitor_stream_info.{type MonitorStreamInfo}

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

pub fn decoder() -> Decoder(LiveBroadcastContentDetails) {
  use availability_config <- decode.optional_field(
    "availabilityConfig",
    option.None,
    decode.optional(availability_config.decoder()),
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
    decode.optional(monitor_stream_info.decoder()),
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
  decode.success(
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

pub fn to_json(value: LiveBroadcastContentDetails) -> Json {
  json.object(
    [
      #(
        "availabilityConfig",
        json.nullable(value.availability_config, availability_config.to_json),
      ),
      #("boundStreamId", json.nullable(value.bound_stream_id, json.string)),
      #(
        "boundStreamLastUpdateTimeMs",
        json.nullable(value.bound_stream_last_update_time_ms, json.string),
      ),
      #(
        "closedCaptionsType",
        json.nullable(
          value.closed_captions_type,
          fn(e)
          { json.string(closed_captions_type_to_string(e)) },
        ),
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
        json.nullable(
          value.latency_preference,
          fn(e)
          { json.string(latency_preference_to_string(e)) },
        ),
      ),
      #("mesh", json.nullable(value.mesh, json.string)),
      #(
        "monitorStream",
        json.nullable(value.monitor_stream, monitor_stream_info.to_json),
      ),
      #(
        "projection",
        json.nullable(
          value.projection,
          fn(e)
          { json.string(projection_to_string(e)) },
        ),
      ),
      #("recordFromStart", json.nullable(value.record_from_start, json.bool)),
      #("startWithSlate", json.nullable(value.start_with_slate, json.bool)),
      #(
        "stereoLayout",
        json.nullable(
          value.stereo_layout,
          fn(e)
          { json.string(stereo_layout_to_string(e)) },
        ),
      ),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "closedCaptionsTypeUnspecified" -> decode.success(
      ClosedCaptionsTypeClosedCaptionsTypeUnspecified,
    )
    "closedCaptionsDisabled" -> decode.success(
      ClosedCaptionsTypeClosedCaptionsDisabled,
    )
    "closedCaptionsHttpPost" -> decode.success(
      ClosedCaptionsTypeClosedCaptionsHttpPost,
    )
    "closedCaptionsEmbedded" -> decode.success(
      ClosedCaptionsTypeClosedCaptionsEmbedded,
    )
    _ -> decode.failure(
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
  use value <- decode.then(decode.string)
  case value {
    "latencyPreferenceUnspecified" -> decode.success(
      LatencyPreferenceLatencyPreferenceUnspecified,
    )
    "normal" -> decode.success(LatencyPreferenceNormal)
    "low" -> decode.success(LatencyPreferenceLow)
    "ultraLow" -> decode.success(LatencyPreferenceUltraLow)
    _ -> decode.failure(
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
    "stereoLayoutUnspecified" -> decode.success(
      StereoLayoutStereoLayoutUnspecified,
    )
    "mono" -> decode.success(StereoLayoutMono)
    "leftRight" -> decode.success(StereoLayoutLeftRight)
    "topBottom" -> decode.success(StereoLayoutTopBottom)
    _ -> decode.failure(
      StereoLayoutStereoLayoutUnspecified,
      "a valid StereoLayout",
    )
  }
}