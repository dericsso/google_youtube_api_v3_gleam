//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/entity.{type Entity}

pub type RelatedEntity {
  RelatedEntity(entity: option.Option(Entity))
}

pub fn decoder() -> Decoder(RelatedEntity) {
  use entity <- optional_field(
    "entity",
    option.None,
    optional(entity.decoder()),
  )
  success(RelatedEntity(entity))
}