//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success, then, failure}
import gleam/option
import youtube/video_suggestions_tag_suggestion.{type VideoSuggestionsTagSuggestion}

/// Specifies suggestions on how to improve video content, including encoding hints, tag suggestions, and editor suggestions.
pub type VideoSuggestions {
  VideoSuggestions(
    editor_suggestions: option.Option(List(EditorSuggestions)),
    processing_errors: option.Option(List(ProcessingErrors)),
    processing_hints: option.Option(List(ProcessingHints)),
    processing_warnings: option.Option(List(ProcessingWarnings)),
    tag_suggestions: option.Option(List(VideoSuggestionsTagSuggestion)),
  )
}

pub fn decoder() -> Decoder(VideoSuggestions) {
  use editor_suggestions <- optional_field(
    "editorSuggestions",
    option.None,
    optional(list(editor_suggestions_decoder())),
  )
  use processing_errors <- optional_field(
    "processingErrors",
    option.None,
    optional(list(processing_errors_decoder())),
  )
  use processing_hints <- optional_field(
    "processingHints",
    option.None,
    optional(list(processing_hints_decoder())),
  )
  use processing_warnings <- optional_field(
    "processingWarnings",
    option.None,
    optional(list(processing_warnings_decoder())),
  )
  use tag_suggestions <- optional_field(
    "tagSuggestions",
    option.None,
    optional(list(video_suggestions_tag_suggestion.decoder())),
  )
  success(
    VideoSuggestions(
      editor_suggestions,
      processing_errors,
      processing_hints,
      processing_warnings,
      tag_suggestions,
    ),
  )
}

/// A list of video editing operations that might improve the video quality or playback experience of the uploaded video.
pub type EditorSuggestions {
  EditorSuggestionsVideoAutoLevels
  EditorSuggestionsVideoStabilize
  EditorSuggestionsVideoCrop
  EditorSuggestionsAudioQuietAudioSwap
}

pub fn editor_suggestions_to_string(value: EditorSuggestions) -> String {
  case value {
    EditorSuggestionsVideoAutoLevels -> "videoAutoLevels"
    EditorSuggestionsVideoStabilize -> "videoStabilize"
    EditorSuggestionsVideoCrop -> "videoCrop"
    EditorSuggestionsAudioQuietAudioSwap -> "audioQuietAudioSwap"
  }
}

pub fn editor_suggestions_decoder() -> Decoder(EditorSuggestions) {
  use value <- then(string)
  case value {
    "videoAutoLevels" -> success(EditorSuggestionsVideoAutoLevels)
    "videoStabilize" -> success(EditorSuggestionsVideoStabilize)
    "videoCrop" -> success(EditorSuggestionsVideoCrop)
    "audioQuietAudioSwap" -> success(EditorSuggestionsAudioQuietAudioSwap)
    _ -> failure(EditorSuggestionsVideoAutoLevels, "a valid EditorSuggestions")
  }
}

/// A list of errors that will prevent YouTube from successfully processing the uploaded video video. These errors indicate that, regardless of the video's current processing status, eventually, that status will almost certainly be failed.
pub type ProcessingErrors {
  ProcessingErrorsAudioFile
  ProcessingErrorsImageFile
  ProcessingErrorsProjectFile
  ProcessingErrorsNotAvideoFile
  ProcessingErrorsDocFile
  ProcessingErrorsArchiveFile
  ProcessingErrorsUnsupportedSpatialAudioLayout
}

pub fn processing_errors_to_string(value: ProcessingErrors) -> String {
  case value {
    ProcessingErrorsAudioFile -> "audioFile"
    ProcessingErrorsImageFile -> "imageFile"
    ProcessingErrorsProjectFile -> "projectFile"
    ProcessingErrorsNotAvideoFile -> "notAVideoFile"
    ProcessingErrorsDocFile -> "docFile"
    ProcessingErrorsArchiveFile -> "archiveFile"
    ProcessingErrorsUnsupportedSpatialAudioLayout -> "unsupportedSpatialAudioLayout"
  }
}

pub fn processing_errors_decoder() -> Decoder(ProcessingErrors) {
  use value <- then(string)
  case value {
    "audioFile" -> success(ProcessingErrorsAudioFile)
    "imageFile" -> success(ProcessingErrorsImageFile)
    "projectFile" -> success(ProcessingErrorsProjectFile)
    "notAVideoFile" -> success(ProcessingErrorsNotAvideoFile)
    "docFile" -> success(ProcessingErrorsDocFile)
    "archiveFile" -> success(ProcessingErrorsArchiveFile)
    "unsupportedSpatialAudioLayout" -> success(
      ProcessingErrorsUnsupportedSpatialAudioLayout,
    )
    _ -> failure(ProcessingErrorsAudioFile, "a valid ProcessingErrors")
  }
}

/// A list of suggestions that may improve YouTube's ability to process the video.
pub type ProcessingHints {
  ProcessingHintsNonStreamableMov
  ProcessingHintsSendBestQualityVideo
  ProcessingHintsSphericalVideo
  ProcessingHintsSpatialAudio
  ProcessingHintsVrVideo
  ProcessingHintsHdrVideo
}

pub fn processing_hints_to_string(value: ProcessingHints) -> String {
  case value {
    ProcessingHintsNonStreamableMov -> "nonStreamableMov"
    ProcessingHintsSendBestQualityVideo -> "sendBestQualityVideo"
    ProcessingHintsSphericalVideo -> "sphericalVideo"
    ProcessingHintsSpatialAudio -> "spatialAudio"
    ProcessingHintsVrVideo -> "vrVideo"
    ProcessingHintsHdrVideo -> "hdrVideo"
  }
}

pub fn processing_hints_decoder() -> Decoder(ProcessingHints) {
  use value <- then(string)
  case value {
    "nonStreamableMov" -> success(ProcessingHintsNonStreamableMov)
    "sendBestQualityVideo" -> success(ProcessingHintsSendBestQualityVideo)
    "sphericalVideo" -> success(ProcessingHintsSphericalVideo)
    "spatialAudio" -> success(ProcessingHintsSpatialAudio)
    "vrVideo" -> success(ProcessingHintsVrVideo)
    "hdrVideo" -> success(ProcessingHintsHdrVideo)
    _ -> failure(ProcessingHintsNonStreamableMov, "a valid ProcessingHints")
  }
}

/// A list of reasons why YouTube may have difficulty transcoding the uploaded video or that might result in an erroneous transcoding. These warnings are generated before YouTube actually processes the uploaded video file. In addition, they identify issues that are unlikely to cause the video processing to fail but that might cause problems such as sync issues, video artifacts, or a missing audio track.
pub type ProcessingWarnings {
  ProcessingWarningsUnknownContainer
  ProcessingWarningsUnknownVideoCodec
  ProcessingWarningsUnknownAudioCodec
  ProcessingWarningsInconsistentResolution
  ProcessingWarningsHasEditlist
  ProcessingWarningsProblematicVideoCodec
  ProcessingWarningsProblematicAudioCodec
  ProcessingWarningsUnsupportedVrStereoMode
  ProcessingWarningsUnsupportedSphericalProjectionType
  ProcessingWarningsUnsupportedHdrPixelFormat
  ProcessingWarningsUnsupportedHdrColorMetadata
  ProcessingWarningsProblematicHdrLookupTable
}

pub fn processing_warnings_to_string(value: ProcessingWarnings) -> String {
  case value {
    ProcessingWarningsUnknownContainer -> "unknownContainer"
    ProcessingWarningsUnknownVideoCodec -> "unknownVideoCodec"
    ProcessingWarningsUnknownAudioCodec -> "unknownAudioCodec"
    ProcessingWarningsInconsistentResolution -> "inconsistentResolution"
    ProcessingWarningsHasEditlist -> "hasEditlist"
    ProcessingWarningsProblematicVideoCodec -> "problematicVideoCodec"
    ProcessingWarningsProblematicAudioCodec -> "problematicAudioCodec"
    ProcessingWarningsUnsupportedVrStereoMode -> "unsupportedVrStereoMode"
    ProcessingWarningsUnsupportedSphericalProjectionType -> "unsupportedSphericalProjectionType"
    ProcessingWarningsUnsupportedHdrPixelFormat -> "unsupportedHdrPixelFormat"
    ProcessingWarningsUnsupportedHdrColorMetadata -> "unsupportedHdrColorMetadata"
    ProcessingWarningsProblematicHdrLookupTable -> "problematicHdrLookupTable"
  }
}

pub fn processing_warnings_decoder() -> Decoder(ProcessingWarnings) {
  use value <- then(string)
  case value {
    "unknownContainer" -> success(ProcessingWarningsUnknownContainer)
    "unknownVideoCodec" -> success(ProcessingWarningsUnknownVideoCodec)
    "unknownAudioCodec" -> success(ProcessingWarningsUnknownAudioCodec)
    "inconsistentResolution" -> success(
      ProcessingWarningsInconsistentResolution,
    )
    "hasEditlist" -> success(ProcessingWarningsHasEditlist)
    "problematicVideoCodec" -> success(ProcessingWarningsProblematicVideoCodec)
    "problematicAudioCodec" -> success(ProcessingWarningsProblematicAudioCodec)
    "unsupportedVrStereoMode" -> success(
      ProcessingWarningsUnsupportedVrStereoMode,
    )
    "unsupportedSphericalProjectionType" -> success(
      ProcessingWarningsUnsupportedSphericalProjectionType,
    )
    "unsupportedHdrPixelFormat" -> success(
      ProcessingWarningsUnsupportedHdrPixelFormat,
    )
    "unsupportedHdrColorMetadata" -> success(
      ProcessingWarningsUnsupportedHdrColorMetadata,
    )
    "problematicHdrLookupTable" -> success(
      ProcessingWarningsProblematicHdrLookupTable,
    )
    _ -> failure(
      ProcessingWarningsUnknownContainer,
      "a valid ProcessingWarnings",
    )
  }
}