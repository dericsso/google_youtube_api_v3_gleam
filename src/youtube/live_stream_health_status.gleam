//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success, then, failure}
import gleam/option
import youtube/live_stream_configuration_issue.{type LiveStreamConfigurationIssue}

pub type LiveStreamHealthStatus {
  LiveStreamHealthStatus(
    configuration_issues: option.Option(List(LiveStreamConfigurationIssue)),
    last_update_time_seconds: option.Option(String),
    status: option.Option(Status),
  )
}

pub fn decoder() -> Decoder(LiveStreamHealthStatus) {
  use configuration_issues <- optional_field(
    "configurationIssues",
    option.None,
    optional(list(live_stream_configuration_issue.decoder())),
  )
  use last_update_time_seconds <- optional_field(
    "lastUpdateTimeSeconds",
    option.None,
    optional(string),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(status_decoder()),
  )
  success(
    LiveStreamHealthStatus(
      configuration_issues,
      last_update_time_seconds,
      status,
    ),
  )
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
  use value <- then(string)
  case value {
    "good" -> success(StatusGood)
    "ok" -> success(StatusOk)
    "bad" -> success(StatusBad)
    "noData" -> success(StatusNoData)
    "revoked" -> success(StatusRevoked)
    _ -> failure(StatusGood, "a valid Status")
  }
}