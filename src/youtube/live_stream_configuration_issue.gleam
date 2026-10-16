//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

pub type LiveStreamConfigurationIssue {
  LiveStreamConfigurationIssue(
    description: option.Option(String),
    reason: option.Option(String),
    severity: option.Option(String),
    type_: option.Option(String),
  )
}
