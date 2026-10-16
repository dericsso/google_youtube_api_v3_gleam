//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Describes information necessary for ingesting an RTMP, HTTP, or SRT stream.
pub type IngestionInfo {
  IngestionInfo(
    backup_ingestion_address: option.Option(String),
    ingestion_address: option.Option(String),
    rtmps_backup_ingestion_address: option.Option(String),
    rtmps_ingestion_address: option.Option(String),
    stream_name: option.Option(String),
  )
}
