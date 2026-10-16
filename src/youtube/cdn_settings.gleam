//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/ingestion_info.{type IngestionInfo}

/// Brief description of the live stream cdn settings.
pub type CdnSettings {
  CdnSettings(
    format: option.Option(String),
    frame_rate: option.Option(String),
    ingestion_info: option.Option(IngestionInfo),
    ingestion_type: option.Option(String),
    resolution: option.Option(String),
  )
}
