//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about the brand partner linked to the video for Creator Initiated Linking (CIL). Next ID: 6
pub type BrandPartner {
  BrandPartner(
    channel_handle: option.Option(String),
    channel_id: option.Option(String),
  )
}
