//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Rights management policy for YouTube resources.
pub type AccessPolicy {
  AccessPolicy(
    allowed: option.Option(Bool),
    exception: option.Option(List(String)),
  )
}
