//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Settings and Info of the monitor stream
pub type MonitorStreamInfo {
  MonitorStreamInfo(
    broadcast_stream_delay_ms: Option(Int),
    embed_html: Option(String),
    enable_monitor_stream: Option(Bool),
  )
}

pub fn decoder() -> Decoder(MonitorStreamInfo) {
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

pub fn to_json(value: MonitorStreamInfo) -> Json {
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
