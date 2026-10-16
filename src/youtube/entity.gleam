//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type Entity {
  Entity(id: Option(String), type_id: Option(String), url: Option(String))
}

pub fn decoder() -> Decoder(Entity) {
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use type_id <- decode.optional_field(
    "typeId",
    option.None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field(
    "url",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(Entity(id, type_id, url))
}

pub fn to_json(value: Entity) -> Json {
  json.object([
    #("id", json.nullable(value.id, json.string)),
    #("typeId", json.nullable(value.type_id, json.string)),
    #("url", json.nullable(value.url, json.string)),
  ])
}
