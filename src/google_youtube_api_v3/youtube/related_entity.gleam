//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/entity.{type Entity}

pub type RelatedEntity {
  RelatedEntity(entity: Option(Entity))
}

pub fn decoder() -> Decoder(RelatedEntity) {
  use entity <- decode.optional_field(
    "entity",
    option.None,
    decode.optional(entity.decoder()),
  )
  decode.success(RelatedEntity(entity))
}

pub fn to_json(value: RelatedEntity) -> Json {
  json.object([#("entity", json.nullable(value.entity, entity.to_json))])
}
