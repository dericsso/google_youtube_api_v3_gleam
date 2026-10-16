//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_processing_details_processing_progress.{
  type VideoProcessingDetailsProcessingProgress,
}

/// Describes processing status and progress and availability of some other Video resource parts.
pub type VideoProcessingDetails {
  VideoProcessingDetails(
    editor_suggestions_availability: option.Option(String),
    file_details_availability: option.Option(String),
    processing_failure_reason: option.Option(String),
    processing_issues_availability: option.Option(String),
    processing_progress: option.Option(VideoProcessingDetailsProcessingProgress),
    processing_status: option.Option(String),
    tag_suggestions_availability: option.Option(String),
    thumbnails_availability: option.Option(String),
  )
}
