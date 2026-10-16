//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/localized_property.{type LocalizedProperty}

/// Branding properties for images associated with the channel.
pub type ImageSettings {
  ImageSettings(
    background_image_url: Option(LocalizedProperty),
    banner_external_url: Option(String),
    banner_image_url: Option(String),
    banner_mobile_extra_hd_image_url: Option(String),
    banner_mobile_hd_image_url: Option(String),
    banner_mobile_image_url: Option(String),
    banner_mobile_low_image_url: Option(String),
    banner_mobile_medium_hd_image_url: Option(String),
    banner_tablet_extra_hd_image_url: Option(String),
    banner_tablet_hd_image_url: Option(String),
    banner_tablet_image_url: Option(String),
    banner_tablet_low_image_url: Option(String),
    banner_tv_high_image_url: Option(String),
    banner_tv_image_url: Option(String),
    banner_tv_low_image_url: Option(String),
    banner_tv_medium_image_url: Option(String),
    large_branded_banner_image_imap_script: Option(LocalizedProperty),
    large_branded_banner_image_url: Option(LocalizedProperty),
    small_branded_banner_image_imap_script: Option(LocalizedProperty),
    small_branded_banner_image_url: Option(LocalizedProperty),
    tracking_image_url: Option(String),
    watch_icon_image_url: Option(String),
  )
}

pub fn decoder() -> Decoder(ImageSettings) {
  use background_image_url <- decode.optional_field(
    "backgroundImageUrl",
    option.None,
    decode.optional(localized_property.decoder()),
  )
  use banner_external_url <- decode.optional_field(
    "bannerExternalUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_image_url <- decode.optional_field(
    "bannerImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_extra_hd_image_url <- decode.optional_field(
    "bannerMobileExtraHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_hd_image_url <- decode.optional_field(
    "bannerMobileHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_image_url <- decode.optional_field(
    "bannerMobileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_low_image_url <- decode.optional_field(
    "bannerMobileLowImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_mobile_medium_hd_image_url <- decode.optional_field(
    "bannerMobileMediumHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_extra_hd_image_url <- decode.optional_field(
    "bannerTabletExtraHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_hd_image_url <- decode.optional_field(
    "bannerTabletHdImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_image_url <- decode.optional_field(
    "bannerTabletImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tablet_low_image_url <- decode.optional_field(
    "bannerTabletLowImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_high_image_url <- decode.optional_field(
    "bannerTvHighImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_image_url <- decode.optional_field(
    "bannerTvImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_low_image_url <- decode.optional_field(
    "bannerTvLowImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use banner_tv_medium_image_url <- decode.optional_field(
    "bannerTvMediumImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use large_branded_banner_image_imap_script <- decode.optional_field(
    "largeBrandedBannerImageImapScript",
    option.None,
    decode.optional(localized_property.decoder()),
  )
  use large_branded_banner_image_url <- decode.optional_field(
    "largeBrandedBannerImageUrl",
    option.None,
    decode.optional(localized_property.decoder()),
  )
  use small_branded_banner_image_imap_script <- decode.optional_field(
    "smallBrandedBannerImageImapScript",
    option.None,
    decode.optional(localized_property.decoder()),
  )
  use small_branded_banner_image_url <- decode.optional_field(
    "smallBrandedBannerImageUrl",
    option.None,
    decode.optional(localized_property.decoder()),
  )
  use tracking_image_url <- decode.optional_field(
    "trackingImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use watch_icon_image_url <- decode.optional_field(
    "watchIconImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ImageSettings(
    background_image_url,
    banner_external_url,
    banner_image_url,
    banner_mobile_extra_hd_image_url,
    banner_mobile_hd_image_url,
    banner_mobile_image_url,
    banner_mobile_low_image_url,
    banner_mobile_medium_hd_image_url,
    banner_tablet_extra_hd_image_url,
    banner_tablet_hd_image_url,
    banner_tablet_image_url,
    banner_tablet_low_image_url,
    banner_tv_high_image_url,
    banner_tv_image_url,
    banner_tv_low_image_url,
    banner_tv_medium_image_url,
    large_branded_banner_image_imap_script,
    large_branded_banner_image_url,
    small_branded_banner_image_imap_script,
    small_branded_banner_image_url,
    tracking_image_url,
    watch_icon_image_url,
  ))
}

pub fn to_json(value: ImageSettings) -> Json {
  json.object([
    #(
      "backgroundImageUrl",
      json.nullable(value.background_image_url, localized_property.to_json),
    ),
    #(
      "bannerExternalUrl",
      json.nullable(value.banner_external_url, json.string),
    ),
    #("bannerImageUrl", json.nullable(value.banner_image_url, json.string)),
    #(
      "bannerMobileExtraHdImageUrl",
      json.nullable(value.banner_mobile_extra_hd_image_url, json.string),
    ),
    #(
      "bannerMobileHdImageUrl",
      json.nullable(value.banner_mobile_hd_image_url, json.string),
    ),
    #(
      "bannerMobileImageUrl",
      json.nullable(value.banner_mobile_image_url, json.string),
    ),
    #(
      "bannerMobileLowImageUrl",
      json.nullable(value.banner_mobile_low_image_url, json.string),
    ),
    #(
      "bannerMobileMediumHdImageUrl",
      json.nullable(value.banner_mobile_medium_hd_image_url, json.string),
    ),
    #(
      "bannerTabletExtraHdImageUrl",
      json.nullable(value.banner_tablet_extra_hd_image_url, json.string),
    ),
    #(
      "bannerTabletHdImageUrl",
      json.nullable(value.banner_tablet_hd_image_url, json.string),
    ),
    #(
      "bannerTabletImageUrl",
      json.nullable(value.banner_tablet_image_url, json.string),
    ),
    #(
      "bannerTabletLowImageUrl",
      json.nullable(value.banner_tablet_low_image_url, json.string),
    ),
    #(
      "bannerTvHighImageUrl",
      json.nullable(value.banner_tv_high_image_url, json.string),
    ),
    #("bannerTvImageUrl", json.nullable(value.banner_tv_image_url, json.string)),
    #(
      "bannerTvLowImageUrl",
      json.nullable(value.banner_tv_low_image_url, json.string),
    ),
    #(
      "bannerTvMediumImageUrl",
      json.nullable(value.banner_tv_medium_image_url, json.string),
    ),
    #(
      "largeBrandedBannerImageImapScript",
      json.nullable(
        value.large_branded_banner_image_imap_script,
        localized_property.to_json,
      ),
    ),
    #(
      "largeBrandedBannerImageUrl",
      json.nullable(
        value.large_branded_banner_image_url,
        localized_property.to_json,
      ),
    ),
    #(
      "smallBrandedBannerImageImapScript",
      json.nullable(
        value.small_branded_banner_image_imap_script,
        localized_property.to_json,
      ),
    ),
    #(
      "smallBrandedBannerImageUrl",
      json.nullable(
        value.small_branded_banner_image_url,
        localized_property.to_json,
      ),
    ),
    #("trackingImageUrl", json.nullable(value.tracking_image_url, json.string)),
    #(
      "watchIconImageUrl",
      json.nullable(value.watch_icon_image_url, json.string),
    ),
  ])
}
