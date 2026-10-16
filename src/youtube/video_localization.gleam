//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Localized versions of certain video properties (e.g. title).
pub type VideoLocalization {
  VideoLocalization(
    description: option.Option(String),
    title: option.Option(String),
  )
}
