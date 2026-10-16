//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Basic details about a caption track, such as its language and name.
pub type CaptionSnippet {
  CaptionSnippet(
    audio_track_type: option.Option(String),
    failure_reason: option.Option(String),
    is_auto_synced: option.Option(Bool),
    is_cc: option.Option(Bool),
    is_draft: option.Option(Bool),
    is_easy_reader: option.Option(Bool),
    is_large: option.Option(Bool),
    language: option.Option(String),
    last_updated: option.Option(String),
    name: option.Option(String),
    status: option.Option(String),
    track_kind: option.Option(String),
    video_id: option.Option(String),
  )
}
