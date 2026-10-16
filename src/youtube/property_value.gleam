//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// A pair Property / Value.
pub type PropertyValue {
  PropertyValue(property: option.Option(String), value: option.Option(String))
}

pub fn decoder() -> Decoder(PropertyValue) {
  use property <- optional_field("property", option.None, optional(string))
  use value <- optional_field("value", option.None, optional(string))
  success(PropertyValue(property, value))
}