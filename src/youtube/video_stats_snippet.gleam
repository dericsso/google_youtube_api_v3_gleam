//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Basic details about a video. This is a subset of the information in VideoSnippet specifically for the Videos.stats API.
pub type VideoStatsSnippet {
  VideoStatsSnippet(publish_time: option.Option(String))
}
