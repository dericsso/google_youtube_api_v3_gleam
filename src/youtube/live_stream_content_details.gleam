//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Detailed settings of a stream.
pub type LiveStreamContentDetails {
  LiveStreamContentDetails(
    closed_captions_ingestion_url: option.Option(String),
    is_reusable: option.Option(Bool),
  )
}
