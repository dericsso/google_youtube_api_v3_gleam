//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/geo_point.{type GeoPoint}

/// Recording information associated with the video.
pub type VideoRecordingDetails {
  VideoRecordingDetails(
    location: option.Option(GeoPoint),
    location_description: option.Option(String),
    recording_date: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoRecordingDetails) {
  use location <- optional_field(
    "location",
    option.None,
    optional(geo_point.decoder()),
  )
  use location_description <- optional_field(
    "locationDescription",
    option.None,
    optional(string),
  )
  use recording_date <- optional_field(
    "recordingDate",
    option.None,
    optional(string),
  )
  success(VideoRecordingDetails(location, location_description, recording_date))
}