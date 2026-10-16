//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about the content of a YouTube Video. This is a subset of the information in VideoContentDetails specifically for the Videos.stats API.
pub type VideoStatsContentDetails {
  VideoStatsContentDetails(duration: option.Option(String))
}
