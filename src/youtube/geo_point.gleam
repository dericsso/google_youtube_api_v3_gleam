//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, float, success}
import gleam/option

/// Geographical coordinates of a point, in WGS84.
pub type GeoPoint {
  GeoPoint(
    altitude: option.Option(Float),
    latitude: option.Option(Float),
    longitude: option.Option(Float),
  )
}

pub fn decoder() -> Decoder(GeoPoint) {
  use altitude <- optional_field("altitude", option.None, optional(float))
  use latitude <- optional_field("latitude", option.None, optional(float))
  use longitude <- optional_field("longitude", option.None, optional(float))
  success(GeoPoint(altitude, latitude, longitude))
}