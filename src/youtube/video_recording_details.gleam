//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/geo_point.{type GeoPoint}

/// Recording information associated with the video.
pub type VideoRecordingDetails {
  VideoRecordingDetails(
    location: Option(GeoPoint),
    location_description: Option(String),
    recording_date: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoRecordingDetails) {
  use location <- decode.optional_field(
    "location",
    option.None,
    decode.optional(geo_point.decoder()),
  )
  use location_description <- decode.optional_field(
    "locationDescription",
    option.None,
    decode.optional(decode.string),
  )
  use recording_date <- decode.optional_field(
    "recordingDate",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoRecordingDetails(
    location,
    location_description,
    recording_date,
  ))
}

pub fn to_json(value: VideoRecordingDetails) -> Json {
  json.object([
    #("location", json.nullable(value.location, geo_point.to_json)),
    #(
      "locationDescription",
      json.nullable(value.location_description, json.string),
    ),
    #("recordingDate", json.nullable(value.recording_date, json.string)),
  ])
}
