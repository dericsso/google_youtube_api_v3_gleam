//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Geographical coordinates of a point, in WGS84.
pub type GeoPoint {
  GeoPoint(
    altitude: option.Option(Float),
    latitude: option.Option(Float),
    longitude: option.Option(Float),
  )
}
