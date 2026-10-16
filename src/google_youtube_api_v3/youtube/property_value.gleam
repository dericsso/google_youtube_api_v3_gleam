//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A pair Property / Value.
pub type PropertyValue {
  PropertyValue(property: Option(String), value: Option(String))
}

pub fn decoder() -> Decoder(PropertyValue) {
  use property <- decode.optional_field(
    "property",
    option.None,
    decode.optional(decode.string),
  )
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PropertyValue(property, value))
}

pub fn to_json(value: PropertyValue) -> Json {
  json.object([
    #("property", json.nullable(value.property, json.string)),
    #("value", json.nullable(value.value, json.string)),
  ])
}
