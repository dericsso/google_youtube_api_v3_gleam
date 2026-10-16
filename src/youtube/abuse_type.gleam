//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type AbuseType {
  AbuseType(id: Option(String))
}

pub fn decoder() -> Decoder(AbuseType) {
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(AbuseType(id))
}

pub fn to_json(value: AbuseType) -> Json {
  json.object([#("id", json.nullable(value.id, json.string))])
}
