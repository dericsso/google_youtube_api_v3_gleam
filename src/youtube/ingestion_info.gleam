//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
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

pub fn decoder() -> Decoder(IngestionInfo) {
  use backup_ingestion_address <- optional_field(
    "backupIngestionAddress",
    option.None,
    optional(string),
  )
  use ingestion_address <- optional_field(
    "ingestionAddress",
    option.None,
    optional(string),
  )
  use rtmps_backup_ingestion_address <- optional_field(
    "rtmpsBackupIngestionAddress",
    option.None,
    optional(string),
  )
  use rtmps_ingestion_address <- optional_field(
    "rtmpsIngestionAddress",
    option.None,
    optional(string),
  )
  use stream_name <- optional_field("streamName", option.None, optional(string))
  success(
    IngestionInfo(
      backup_ingestion_address,
      ingestion_address,
      rtmps_backup_ingestion_address,
      rtmps_ingestion_address,
      stream_name,
    ),
  )
}