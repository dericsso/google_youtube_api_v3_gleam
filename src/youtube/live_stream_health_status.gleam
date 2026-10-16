//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_stream_configuration_issue.{
  type LiveStreamConfigurationIssue,
}

pub type LiveStreamHealthStatus {
  LiveStreamHealthStatus(
    configuration_issues: option.Option(List(LiveStreamConfigurationIssue)),
    last_update_time_seconds: option.Option(String),
    status: option.Option(String),
  )
}
