//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option

/// ChannelSection targeting setting.
pub type ChannelSectionTargeting {
  ChannelSectionTargeting(
    countries: option.Option(List(String)),
    languages: option.Option(List(String)),
    regions: option.Option(List(String)),
  )
}

pub fn decoder() -> Decoder(ChannelSectionTargeting) {
  use countries <- optional_field(
    "countries",
    option.None,
    optional(list(string)),
  )
  use languages <- optional_field(
    "languages",
    option.None,
    optional(list(string)),
  )
  use regions <- optional_field("regions", option.None, optional(list(string)))
  success(ChannelSectionTargeting(countries, languages, regions))
}