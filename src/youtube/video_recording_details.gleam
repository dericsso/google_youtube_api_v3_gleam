//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
