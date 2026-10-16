//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/live_stream_configuration_issue.{
  type LiveStreamConfigurationIssue,
}

pub type LiveStreamHealthStatus {
  LiveStreamHealthStatus(
    configuration_issues: Option(List(LiveStreamConfigurationIssue)),
    last_update_time_seconds: Option(String),
    status: Option(Status),
  )
}

pub fn decoder() -> Decoder(LiveStreamHealthStatus) {
  use configuration_issues <- decode.optional_field(
    "configurationIssues",
    option.None,
    decode.optional(decode.list(live_stream_configuration_issue.decoder())),
  )
  use last_update_time_seconds <- decode.optional_field(
    "lastUpdateTimeSeconds",
    option.None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(status_decoder()),
  )
  decode.success(LiveStreamHealthStatus(
    configuration_issues,
    last_update_time_seconds,
    status,
  ))
}

pub fn to_json(value: LiveStreamHealthStatus) -> Json {
  json.object([
    #(
      "configurationIssues",
      json.nullable(value.configuration_issues, fn(items) {
        json.array(items, live_stream_configuration_issue.to_json)
      }),
    ),
    #(
      "lastUpdateTimeSeconds",
      json.nullable(value.last_update_time_seconds, json.string),
    ),
    #(
      "status",
      json.nullable(value.status, fn(e) { json.string(status_to_string(e)) }),
    ),
  ])
}

/// The status code of this stream
pub type Status {
  StatusGood
  StatusOk
  StatusBad
  StatusNoData
  StatusRevoked
}

pub fn status_to_string(value: Status) -> String {
  case value {
    StatusGood -> "good"
    StatusOk -> "ok"
    StatusBad -> "bad"
    StatusNoData -> "noData"
    StatusRevoked -> "revoked"
  }
}

pub fn status_decoder() -> Decoder(Status) {
  use value <- decode.then(decode.string)
  case value {
    "good" -> decode.success(StatusGood)
    "ok" -> decode.success(StatusOk)
    "bad" -> decode.success(StatusBad)
    "noData" -> decode.success(StatusNoData)
    "revoked" -> decode.success(StatusRevoked)
    _ -> decode.failure(StatusGood, "a valid Status")
  }
}
