//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/availability_config.{type AvailabilityConfig}
import youtube/monitor_stream_info.{type MonitorStreamInfo}

/// Detailed settings of a broadcast.
pub type LiveBroadcastContentDetails {
  LiveBroadcastContentDetails(
    availability_config: option.Option(AvailabilityConfig),
    bound_stream_id: option.Option(String),
    bound_stream_last_update_time_ms: option.Option(String),
    closed_captions_type: option.Option(String),
    enable_auto_start: option.Option(Bool),
    enable_auto_stop: option.Option(Bool),
    enable_closed_captions: option.Option(Bool),
    enable_content_encryption: option.Option(Bool),
    enable_dvr: option.Option(Bool),
    enable_embed: option.Option(Bool),
    enable_low_latency: option.Option(Bool),
    latency_preference: option.Option(String),
    mesh: option.Option(String),
    monitor_stream: option.Option(MonitorStreamInfo),
    projection: option.Option(String),
    record_from_start: option.Option(Bool),
    start_with_slate: option.Option(Bool),
    stereo_layout: option.Option(String),
  )
}
