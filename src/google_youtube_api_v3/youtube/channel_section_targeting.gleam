//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// ChannelSection targeting setting.
pub type ChannelSectionTargeting {
  ChannelSectionTargeting(
    countries: Option(List(String)),
    languages: Option(List(String)),
    regions: Option(List(String)),
  )
}

pub fn decoder() -> Decoder(ChannelSectionTargeting) {
  use countries <- decode.optional_field(
    "countries",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use languages <- decode.optional_field(
    "languages",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use regions <- decode.optional_field(
    "regions",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(ChannelSectionTargeting(countries, languages, regions))
}

pub fn to_json(value: ChannelSectionTargeting) -> Json {
  json.object([
    #(
      "countries",
      json.nullable(value.countries, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "languages",
      json.nullable(value.languages, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "regions",
      json.nullable(value.regions, fn(items) { json.array(items, json.string) }),
    ),
  ])
}
