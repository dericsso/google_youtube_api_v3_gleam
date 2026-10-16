//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
    file_type: option.Option(String),
    video_streams: option.Option(List(VideoFileDetailsVideoStream)),
  )
}
