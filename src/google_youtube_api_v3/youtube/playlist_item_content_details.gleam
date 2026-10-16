//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type PlaylistItemContentDetails {
  PlaylistItemContentDetails(
    end_at: Option(String),
    note: Option(String),
    start_at: Option(String),
    video_id: Option(String),
    video_published_at: Option(String),
  )
}

pub fn decoder() -> Decoder(PlaylistItemContentDetails) {
  use end_at <- decode.optional_field(
    "endAt",
    option.None,
    decode.optional(decode.string),
  )
  use note <- decode.optional_field(
    "note",
    option.None,
    decode.optional(decode.string),
  )
  use start_at <- decode.optional_field(
    "startAt",
    option.None,
    decode.optional(decode.string),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  use video_published_at <- decode.optional_field(
    "videoPublishedAt",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistItemContentDetails(
    end_at,
    note,
    start_at,
    video_id,
    video_published_at,
  ))
}

pub fn to_json(value: PlaylistItemContentDetails) -> Json {
  json.object([
    #("endAt", json.nullable(value.end_at, json.string)),
    #("note", json.nullable(value.note, json.string)),
    #("startAt", json.nullable(value.start_at, json.string)),
    #("videoId", json.nullable(value.video_id, json.string)),
    #("videoPublishedAt", json.nullable(value.video_published_at, json.string)),
  ])
}
