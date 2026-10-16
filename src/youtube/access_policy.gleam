//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, list, success}
import gleam/option

/// Rights management policy for YouTube resources.
pub type AccessPolicy {
  AccessPolicy(
    allowed: option.Option(Bool),
    exception: option.Option(List(String)),
  )
}

pub fn decoder() -> Decoder(AccessPolicy) {
  use allowed <- optional_field("allowed", option.None, optional(bool))
  use exception <- optional_field(
    "exception",
    option.None,
    optional(list(string)),
  )
  success(AccessPolicy(allowed, exception))
}