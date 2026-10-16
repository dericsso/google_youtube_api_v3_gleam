//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Video processing progress and completion time estimate.
pub type VideoProcessingDetailsProcessingProgress {
  VideoProcessingDetailsProcessingProgress(
    parts_processed: option.Option(String),
    parts_total: option.Option(String),
    time_left_ms: option.Option(String),
  )
}
