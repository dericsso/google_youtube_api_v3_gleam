//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// ChannelSection targeting setting.
pub type ChannelSectionTargeting {
  ChannelSectionTargeting(
    countries: option.Option(List(String)),
    languages: option.Option(List(String)),
    regions: option.Option(List(String)),
  )
}
