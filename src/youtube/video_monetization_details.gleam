//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/access_policy.{type AccessPolicy}

/// Details about monetization of a YouTube Video.
pub type VideoMonetizationDetails {
  VideoMonetizationDetails(access: option.Option(AccessPolicy))
}
