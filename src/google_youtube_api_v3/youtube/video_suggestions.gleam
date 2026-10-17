//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_suggestions_tag_suggestion.{type VideoSuggestionsTagSuggestion}

/// Specifies suggestions on how to improve video content, including encoding hints, tag suggestions, and editor suggestions.
pub type VideoSuggestions {
  VideoSuggestions(
    editor_suggestions: Option(List(EditorSuggestions)),
    processing_errors: Option(List(ProcessingErrors)),
    processing_hints: Option(List(ProcessingHints)),
    processing_warnings: Option(List(ProcessingWarnings)),
    tag_suggestions: Option(List(VideoSuggestionsTagSuggestion)),
  )
}

pub fn decoder() -> Decoder(VideoSuggestions) {
  use editor_suggestions <- decode.optional_field(
    "editorSuggestions",
    option.None,
    decode.optional(decode.list(editor_suggestions_decoder())),
  )
  use processing_errors <- decode.optional_field(
    "processingErrors",
    option.None,
    decode.optional(decode.list(processing_errors_decoder())),
  )
  use processing_hints <- decode.optional_field(
    "processingHints",
    option.None,
    decode.optional(decode.list(processing_hints_decoder())),
  )
  use processing_warnings <- decode.optional_field(
    "processingWarnings",
    option.None,
    decode.optional(decode.list(processing_warnings_decoder())),
  )
  use tag_suggestions <- decode.optional_field(
    "tagSuggestions",
    option.None,
    decode.optional(decode.list(video_suggestions_tag_suggestion.decoder())),
  )
  decode.success(
    VideoSuggestions(
      editor_suggestions,
      processing_errors,
      processing_hints,
      processing_warnings,
      tag_suggestions,
    ),
  )
}

pub fn to_json(value: VideoSuggestions) -> Json {
  json.object(
    [
      #(
        "editorSuggestions",
        json.nullable(
          value.editor_suggestions,
          fn(items)
          {
            json.array(
              items,
              fn(e)
              { json.string(editor_suggestions_to_string(e)) },
            )
          },
        ),
      ),
      #(
        "processingErrors",
        json.nullable(
          value.processing_errors,
          fn(items)
          {
            json.array(
              items,
              fn(e)
              { json.string(processing_errors_to_string(e)) },
            )
          },
        ),
      ),
      #(
        "processingHints",
        json.nullable(
          value.processing_hints,
          fn(items)
          {
            json.array(
              items,
              fn(e)
              { json.string(processing_hints_to_string(e)) },
            )
          },
        ),
      ),
      #(
        "processingWarnings",
        json.nullable(
          value.processing_warnings,
          fn(items)
          {
            json.array(
              items,
              fn(e)
              { json.string(processing_warnings_to_string(e)) },
            )
          },
        ),
      ),
      #(
        "tagSuggestions",
        json.nullable(
          value.tag_suggestions,
          fn(items)
          { json.array(items, video_suggestions_tag_suggestion.to_json) },
        ),
      ),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "videoAutoLevels" -> decode.success(EditorSuggestionsVideoAutoLevels)
    "videoStabilize" -> decode.success(EditorSuggestionsVideoStabilize)
    "videoCrop" -> decode.success(EditorSuggestionsVideoCrop)
    "audioQuietAudioSwap" -> decode.success(
      EditorSuggestionsAudioQuietAudioSwap,
    )
    _ -> decode.failure(
      EditorSuggestionsVideoAutoLevels,
      "a valid EditorSuggestions",
    )
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
  use value <- decode.then(decode.string)
  case value {
    "audioFile" -> decode.success(ProcessingErrorsAudioFile)
    "imageFile" -> decode.success(ProcessingErrorsImageFile)
    "projectFile" -> decode.success(ProcessingErrorsProjectFile)
    "notAVideoFile" -> decode.success(ProcessingErrorsNotAvideoFile)
    "docFile" -> decode.success(ProcessingErrorsDocFile)
    "archiveFile" -> decode.success(ProcessingErrorsArchiveFile)
    "unsupportedSpatialAudioLayout" -> decode.success(
      ProcessingErrorsUnsupportedSpatialAudioLayout,
    )
    _ -> decode.failure(ProcessingErrorsAudioFile, "a valid ProcessingErrors")
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
  use value <- decode.then(decode.string)
  case value {
    "nonStreamableMov" -> decode.success(ProcessingHintsNonStreamableMov)
    "sendBestQualityVideo" -> decode.success(
      ProcessingHintsSendBestQualityVideo,
    )
    "sphericalVideo" -> decode.success(ProcessingHintsSphericalVideo)
    "spatialAudio" -> decode.success(ProcessingHintsSpatialAudio)
    "vrVideo" -> decode.success(ProcessingHintsVrVideo)
    "hdrVideo" -> decode.success(ProcessingHintsHdrVideo)
    _ -> decode.failure(
      ProcessingHintsNonStreamableMov,
      "a valid ProcessingHints",
    )
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
  use value <- decode.then(decode.string)
  case value {
    "unknownContainer" -> decode.success(ProcessingWarningsUnknownContainer)
    "unknownVideoCodec" -> decode.success(ProcessingWarningsUnknownVideoCodec)
    "unknownAudioCodec" -> decode.success(ProcessingWarningsUnknownAudioCodec)
    "inconsistentResolution" -> decode.success(
      ProcessingWarningsInconsistentResolution,
    )
    "hasEditlist" -> decode.success(ProcessingWarningsHasEditlist)
    "problematicVideoCodec" -> decode.success(
      ProcessingWarningsProblematicVideoCodec,
    )
    "problematicAudioCodec" -> decode.success(
      ProcessingWarningsProblematicAudioCodec,
    )
    "unsupportedVrStereoMode" -> decode.success(
      ProcessingWarningsUnsupportedVrStereoMode,
    )
    "unsupportedSphericalProjectionType" -> decode.success(
      ProcessingWarningsUnsupportedSphericalProjectionType,
    )
    "unsupportedHdrPixelFormat" -> decode.success(
      ProcessingWarningsUnsupportedHdrPixelFormat,
    )
    "unsupportedHdrColorMetadata" -> decode.success(
      ProcessingWarningsUnsupportedHdrColorMetadata,
    )
    "problematicHdrLookupTable" -> decode.success(
      ProcessingWarningsProblematicHdrLookupTable,
    )
    _ -> decode.failure(
      ProcessingWarningsUnknownContainer,
      "a valid ProcessingWarnings",
    )
  }
}