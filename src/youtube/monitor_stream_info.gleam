//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, bool, success}
import gleam/option

/// Settings and Info of the monitor stream
pub type MonitorStreamInfo {
  MonitorStreamInfo(
    broadcast_stream_delay_ms: option.Option(Int),
    embed_html: option.Option(String),
    enable_monitor_stream: option.Option(Bool),
  )
}

pub fn decoder() -> Decoder(MonitorStreamInfo) {
  use broadcast_stream_delay_ms <- optional_field(
    "broadcastStreamDelayMs",
    option.None,
    optional(int),
  )
  use embed_html <- optional_field("embedHtml", option.None, optional(string))
  use enable_monitor_stream <- optional_field(
    "enableMonitorStream",
    option.None,
    optional(bool),
  )
  success(
    MonitorStreamInfo(
      broadcast_stream_delay_ms,
      embed_html,
      enable_monitor_stream,
    ),
  )
}