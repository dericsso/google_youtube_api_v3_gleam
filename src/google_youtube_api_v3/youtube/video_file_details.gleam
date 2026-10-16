//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_file_details_audio_stream.{
  type VideoFileDetailsAudioStream,
}
import google_youtube_api_v3/youtube/video_file_details_video_stream.{
  type VideoFileDetailsVideoStream,
}

/// Describes original video file properties, including technical details about audio and video streams, but also metadata information like content length, digitization time, or geotagging information.
pub type VideoFileDetails {
  VideoFileDetails(
    audio_streams: Option(List(VideoFileDetailsAudioStream)),
    bitrate_bps: Option(String),
    container: Option(String),
    creation_time: Option(String),
    duration_ms: Option(String),
    file_name: Option(String),
    file_size: Option(String),
    file_type: Option(FileType),
    video_streams: Option(List(VideoFileDetailsVideoStream)),
  )
}

pub fn decoder() -> Decoder(VideoFileDetails) {
  use audio_streams <- decode.optional_field(
    "audioStreams",
    option.None,
    decode.optional(decode.list(video_file_details_audio_stream.decoder())),
  )
  use bitrate_bps <- decode.optional_field(
    "bitrateBps",
    option.None,
    decode.optional(decode.string),
  )
  use container <- decode.optional_field(
    "container",
    option.None,
    decode.optional(decode.string),
  )
  use creation_time <- decode.optional_field(
    "creationTime",
    option.None,
    decode.optional(decode.string),
  )
  use duration_ms <- decode.optional_field(
    "durationMs",
    option.None,
    decode.optional(decode.string),
  )
  use file_name <- decode.optional_field(
    "fileName",
    option.None,
    decode.optional(decode.string),
  )
  use file_size <- decode.optional_field(
    "fileSize",
    option.None,
    decode.optional(decode.string),
  )
  use file_type <- decode.optional_field(
    "fileType",
    option.None,
    decode.optional(file_type_decoder()),
  )
  use video_streams <- decode.optional_field(
    "videoStreams",
    option.None,
    decode.optional(decode.list(video_file_details_video_stream.decoder())),
  )
  decode.success(VideoFileDetails(
    audio_streams,
    bitrate_bps,
    container,
    creation_time,
    duration_ms,
    file_name,
    file_size,
    file_type,
    video_streams,
  ))
}

pub fn to_json(value: VideoFileDetails) -> Json {
  json.object([
    #(
      "audioStreams",
      json.nullable(value.audio_streams, fn(items) {
        json.array(items, video_file_details_audio_stream.to_json)
      }),
    ),
    #("bitrateBps", json.nullable(value.bitrate_bps, json.string)),
    #("container", json.nullable(value.container, json.string)),
    #("creationTime", json.nullable(value.creation_time, json.string)),
    #("durationMs", json.nullable(value.duration_ms, json.string)),
    #("fileName", json.nullable(value.file_name, json.string)),
    #("fileSize", json.nullable(value.file_size, json.string)),
    #(
      "fileType",
      json.nullable(value.file_type, fn(e) {
        json.string(file_type_to_string(e))
      }),
    ),
    #(
      "videoStreams",
      json.nullable(value.video_streams, fn(items) {
        json.array(items, video_file_details_video_stream.to_json)
      }),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "video" -> decode.success(FileTypeVideo)
    "audio" -> decode.success(FileTypeAudio)
    "image" -> decode.success(FileTypeImage)
    "archive" -> decode.success(FileTypeArchive)
    "document" -> decode.success(FileTypeDocument)
    "project" -> decode.success(FileTypeProject)
    "other" -> decode.success(FileTypeOther)
    _ -> decode.failure(FileTypeVideo, "a valid FileType")
  }
}
