//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_processing_details_processing_progress.{type VideoProcessingDetailsProcessingProgress}

/// Describes processing status and progress and availability of some other Video resource parts.
pub type VideoProcessingDetails {
  VideoProcessingDetails(
    editor_suggestions_availability: Option(String),
    file_details_availability: Option(String),
    processing_failure_reason: Option(ProcessingFailureReason),
    processing_issues_availability: Option(String),
    processing_progress: Option(VideoProcessingDetailsProcessingProgress),
    processing_status: Option(ProcessingStatus),
    tag_suggestions_availability: Option(String),
    thumbnails_availability: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoProcessingDetails) {
  use editor_suggestions_availability <- decode.optional_field(
    "editorSuggestionsAvailability",
    option.None,
    decode.optional(decode.string),
  )
  use file_details_availability <- decode.optional_field(
    "fileDetailsAvailability",
    option.None,
    decode.optional(decode.string),
  )
  use processing_failure_reason <- decode.optional_field(
    "processingFailureReason",
    option.None,
    decode.optional(processing_failure_reason_decoder()),
  )
  use processing_issues_availability <- decode.optional_field(
    "processingIssuesAvailability",
    option.None,
    decode.optional(decode.string),
  )
  use processing_progress <- decode.optional_field(
    "processingProgress",
    option.None,
    decode.optional(video_processing_details_processing_progress.decoder()),
  )
  use processing_status <- decode.optional_field(
    "processingStatus",
    option.None,
    decode.optional(processing_status_decoder()),
  )
  use tag_suggestions_availability <- decode.optional_field(
    "tagSuggestionsAvailability",
    option.None,
    decode.optional(decode.string),
  )
  use thumbnails_availability <- decode.optional_field(
    "thumbnailsAvailability",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
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

pub fn to_json(value: VideoProcessingDetails) -> Json {
  json.object(
    [
      #(
        "editorSuggestionsAvailability",
        json.nullable(value.editor_suggestions_availability, json.string),
      ),
      #(
        "fileDetailsAvailability",
        json.nullable(value.file_details_availability, json.string),
      ),
      #(
        "processingFailureReason",
        json.nullable(
          value.processing_failure_reason,
          fn(e)
          { json.string(processing_failure_reason_to_string(e)) },
        ),
      ),
      #(
        "processingIssuesAvailability",
        json.nullable(value.processing_issues_availability, json.string),
      ),
      #(
        "processingProgress",
        json.nullable(
          value.processing_progress,
          video_processing_details_processing_progress.to_json,
        ),
      ),
      #(
        "processingStatus",
        json.nullable(
          value.processing_status,
          fn(e)
          { json.string(processing_status_to_string(e)) },
        ),
      ),
      #(
        "tagSuggestionsAvailability",
        json.nullable(value.tag_suggestions_availability, json.string),
      ),
      #(
        "thumbnailsAvailability",
        json.nullable(value.thumbnails_availability, json.string),
      ),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "uploadFailed" -> decode.success(ProcessingFailureReasonUploadFailed)
    "transcodeFailed" -> decode.success(ProcessingFailureReasonTranscodeFailed)
    "streamingFailed" -> decode.success(ProcessingFailureReasonStreamingFailed)
    "other" -> decode.success(ProcessingFailureReasonOther)
    _ -> decode.failure(
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
  use value <- decode.then(decode.string)
  case value {
    "processing" -> decode.success(ProcessingStatusProcessing)
    "succeeded" -> decode.success(ProcessingStatusSucceeded)
    "failed" -> decode.success(ProcessingStatusFailed)
    "terminated" -> decode.success(ProcessingStatusTerminated)
    _ -> decode.failure(ProcessingStatusProcessing, "a valid ProcessingStatus")
  }
}