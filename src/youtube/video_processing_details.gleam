//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/video_processing_details_processing_progress.{type VideoProcessingDetailsProcessingProgress}

/// Describes processing status and progress and availability of some other Video resource parts.
pub type VideoProcessingDetails {
  VideoProcessingDetails(
    editor_suggestions_availability: option.Option(String),
    file_details_availability: option.Option(String),
    processing_failure_reason: option.Option(ProcessingFailureReason),
    processing_issues_availability: option.Option(String),
    processing_progress: option.Option(VideoProcessingDetailsProcessingProgress),
    processing_status: option.Option(ProcessingStatus),
    tag_suggestions_availability: option.Option(String),
    thumbnails_availability: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoProcessingDetails) {
  use editor_suggestions_availability <- optional_field(
    "editorSuggestionsAvailability",
    option.None,
    optional(string),
  )
  use file_details_availability <- optional_field(
    "fileDetailsAvailability",
    option.None,
    optional(string),
  )
  use processing_failure_reason <- optional_field(
    "processingFailureReason",
    option.None,
    optional(processing_failure_reason_decoder()),
  )
  use processing_issues_availability <- optional_field(
    "processingIssuesAvailability",
    option.None,
    optional(string),
  )
  use processing_progress <- optional_field(
    "processingProgress",
    option.None,
    optional(video_processing_details_processing_progress.decoder()),
  )
  use processing_status <- optional_field(
    "processingStatus",
    option.None,
    optional(processing_status_decoder()),
  )
  use tag_suggestions_availability <- optional_field(
    "tagSuggestionsAvailability",
    option.None,
    optional(string),
  )
  use thumbnails_availability <- optional_field(
    "thumbnailsAvailability",
    option.None,
    optional(string),
  )
  success(
    VideoProcessingDetails(
      editor_suggestions_availability,
      file_details_availability,
      processing_failure_reason,
      processing_issues_availability,
      processing_progress,
      processing_status,
      tag_suggestions_availability,
      thumbnails_availability,
    ),
  )
}

/// The reason that YouTube failed to process the video. This property will only have a value if the processingStatus property's value is failed.
pub type ProcessingFailureReason {
  ProcessingFailureReasonUploadFailed
  ProcessingFailureReasonTranscodeFailed
  ProcessingFailureReasonStreamingFailed
  ProcessingFailureReasonOther
}

pub fn processing_failure_reason_to_string(value: ProcessingFailureReason) -> String {
  case value
  {
    ProcessingFailureReasonUploadFailed -> "uploadFailed"
    ProcessingFailureReasonTranscodeFailed -> "transcodeFailed"
    ProcessingFailureReasonStreamingFailed -> "streamingFailed"
    ProcessingFailureReasonOther -> "other"
  }
}

pub fn processing_failure_reason_decoder() -> Decoder(ProcessingFailureReason) {
  use value <- then(string)
  case value {
    "uploadFailed" -> success(ProcessingFailureReasonUploadFailed)
    "transcodeFailed" -> success(ProcessingFailureReasonTranscodeFailed)
    "streamingFailed" -> success(ProcessingFailureReasonStreamingFailed)
    "other" -> success(ProcessingFailureReasonOther)
    _ -> failure(
      ProcessingFailureReasonUploadFailed,
      "a valid ProcessingFailureReason",
    )
  }
}

/// The video's processing status. This value indicates whether YouTube was able to process the video or if the video is still being processed.
pub type ProcessingStatus {
  ProcessingStatusProcessing
  ProcessingStatusSucceeded
  ProcessingStatusFailed
  ProcessingStatusTerminated
}

pub fn processing_status_to_string(value: ProcessingStatus) -> String {
  case value {
    ProcessingStatusProcessing -> "processing"
    ProcessingStatusSucceeded -> "succeeded"
    ProcessingStatusFailed -> "failed"
    ProcessingStatusTerminated -> "terminated"
  }
}

pub fn processing_status_decoder() -> Decoder(ProcessingStatus) {
  use value <- then(string)
  case value {
    "processing" -> success(ProcessingStatusProcessing)
    "succeeded" -> success(ProcessingStatusSucceeded)
    "failed" -> success(ProcessingStatusFailed)
    "terminated" -> success(ProcessingStatusTerminated)
    _ -> failure(ProcessingStatusProcessing, "a valid ProcessingStatus")
  }
}