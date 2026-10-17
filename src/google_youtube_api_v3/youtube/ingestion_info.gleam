//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Describes information necessary for ingesting an RTMP, HTTP, or SRT stream.
pub type IngestionInfo {
  IngestionInfo(
    backup_ingestion_address: Option(String),
    ingestion_address: Option(String),
    rtmps_backup_ingestion_address: Option(String),
    rtmps_ingestion_address: Option(String),
    stream_name: Option(String),
  )
}

pub fn decoder() -> Decoder(IngestionInfo) {
  use backup_ingestion_address <- decode.optional_field(
    "backupIngestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use ingestion_address <- decode.optional_field(
    "ingestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use rtmps_backup_ingestion_address <- decode.optional_field(
    "rtmpsBackupIngestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use rtmps_ingestion_address <- decode.optional_field(
    "rtmpsIngestionAddress",
    option.None,
    decode.optional(decode.string),
  )
  use stream_name <- decode.optional_field(
    "streamName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    IngestionInfo(
      backup_ingestion_address,
      ingestion_address,
      rtmps_backup_ingestion_address,
      rtmps_ingestion_address,
      stream_name,
    ),
  )
}

pub fn to_json(value: IngestionInfo) -> Json {
  json.object(
    [
      #(
        "backupIngestionAddress",
        json.nullable(value.backup_ingestion_address, json.string),
      ),
      #("ingestionAddress", json.nullable(value.ingestion_address, json.string)),
      #(
        "rtmpsBackupIngestionAddress",
        json.nullable(value.rtmps_backup_ingestion_address, json.string),
      ),
      #(
        "rtmpsIngestionAddress",
        json.nullable(value.rtmps_ingestion_address, json.string),
      ),
      #("streamName", json.nullable(value.stream_name, json.string)),
    ],
  )
}