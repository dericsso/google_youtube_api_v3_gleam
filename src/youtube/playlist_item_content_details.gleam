//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type PlaylistItemContentDetails {
  PlaylistItemContentDetails(
    end_at: option.Option(String),
    note: option.Option(String),
    start_at: option.Option(String),
    video_id: option.Option(String),
    video_published_at: option.Option(String),
  )
}

pub fn decoder() -> Decoder(PlaylistItemContentDetails) {
  use end_at <- optional_field("endAt", option.None, optional(string))
  use note <- optional_field("note", option.None, optional(string))
  use start_at <- optional_field("startAt", option.None, optional(string))
  use video_id <- optional_field("videoId", option.None, optional(string))
  use video_published_at <- optional_field(
    "videoPublishedAt",
    option.None,
    optional(string),
  )
  success(
    PlaylistItemContentDetails(
      end_at,
      note,
      start_at,
      video_id,
      video_published_at,
    ),
  )
}