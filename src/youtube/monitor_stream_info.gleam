//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Settings and Info of the monitor stream
pub type MonitorStreamInfo {
  MonitorStreamInfo(
    broadcast_stream_delay_ms: option.Option(Int),
    embed_html: option.Option(String),
    enable_monitor_stream: option.Option(Bool),
  )
}
