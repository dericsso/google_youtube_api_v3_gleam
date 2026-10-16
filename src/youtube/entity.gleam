//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type Entity {
  Entity(
    id: option.Option(String),
    type_id: option.Option(String),
    url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(Entity) {
  use id <- optional_field("id", option.None, optional(string))
  use type_id <- optional_field("typeId", option.None, optional(string))
  use url <- optional_field("url", option.None, optional(string))
  success(Entity(id, type_id, url))
}