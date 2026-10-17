//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Geographical coordinates of a point, in WGS84.
pub type GeoPoint {
  GeoPoint(
    altitude: Option(Float),
    latitude: Option(Float),
    longitude: Option(Float),
  )
}

pub fn decoder() -> Decoder(GeoPoint) {
  use altitude <- decode.optional_field(
    "altitude",
    option.None,
    decode.optional(decode.float),
  )
  use latitude <- decode.optional_field(
    "latitude",
    option.None,
    decode.optional(decode.float),
  )
  use longitude <- decode.optional_field(
    "longitude",
    option.None,
    decode.optional(decode.float),
  )
  decode.success(GeoPoint(altitude, latitude, longitude))
}

pub fn to_json(value: GeoPoint) -> Json {
  json.object(
    [
      #("altitude", json.nullable(value.altitude, json.float)),
      #("latitude", json.nullable(value.latitude, json.float)),
      #("longitude", json.nullable(value.longitude, json.float)),
    ],
  )
}