//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success, then, failure}
import gleam/option
import youtube/video_file_details_audio_stream.{type VideoFileDetailsAudioStream}
import youtube/video_file_details_video_stream.{type VideoFileDetailsVideoStream}

/// Describes original video file properties, including technical details about audio and video streams, but also metadata information like content length, digitization time, or geotagging information.
pub type VideoFileDetails {
  VideoFileDetails(
    audio_streams: option.Option(List(VideoFileDetailsAudioStream)),
    bitrate_bps: option.Option(String),
    container: option.Option(String),
    creation_time: option.Option(String),
    duration_ms: option.Option(String),
    file_name: option.Option(String),
    file_size: option.Option(String),
    file_type: option.Option(FileType),
    video_streams: option.Option(List(VideoFileDetailsVideoStream)),
  )
}

pub fn decoder() -> Decoder(VideoFileDetails) {
  use audio_streams <- optional_field(
    "audioStreams",
    option.None,
    optional(list(video_file_details_audio_stream.decoder())),
  )
  use bitrate_bps <- optional_field("bitrateBps", option.None, optional(string))
  use container <- optional_field("container", option.None, optional(string))
  use creation_time <- optional_field(
    "creationTime",
    option.None,
    optional(string),
  )
  use duration_ms <- optional_field("durationMs", option.None, optional(string))
  use file_name <- optional_field("fileName", option.None, optional(string))
  use file_size <- optional_field("fileSize", option.None, optional(string))
  use file_type <- optional_field(
    "fileType",
    option.None,
    optional(file_type_decoder()),
  )
  use video_streams <- optional_field(
    "videoStreams",
    option.None,
    optional(list(video_file_details_video_stream.decoder())),
  )
  success(
    VideoFileDetails(
      audio_streams,
      bitrate_bps,
      container,
      creation_time,
      duration_ms,
      file_name,
      file_size,
      file_type,
      video_streams,
    ),
  )
}

/// The uploaded file's type as detected by YouTube's video processing engine. Currently, YouTube only processes video files, but this field is present whether a video file or another type of file was uploaded.
pub type FileType {
  FileTypeVideo
  FileTypeAudio
  FileTypeImage
  FileTypeArchive
  FileTypeDocument
  FileTypeProject
  FileTypeOther
}

pub fn file_type_to_string(value: FileType) -> String {
  case value {
    FileTypeVideo -> "video"
    FileTypeAudio -> "audio"
    FileTypeImage -> "image"
    FileTypeArchive -> "archive"
    FileTypeDocument -> "document"
    FileTypeProject -> "project"
    FileTypeOther -> "other"
  }
}

pub fn file_type_decoder() -> Decoder(FileType) {
  use value <- then(string)
  case value {
    "video" -> success(FileTypeVideo)
    "audio" -> success(FileTypeAudio)
    "image" -> success(FileTypeImage)
    "archive" -> success(FileTypeArchive)
    "document" -> success(FileTypeDocument)
    "project" -> success(FileTypeProject)
    "other" -> success(FileTypeOther)
    _ -> failure(FileTypeVideo, "a valid FileType")
  }
}