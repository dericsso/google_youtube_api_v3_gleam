//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/localized_property.{type LocalizedProperty}

/// Branding properties for images associated with the channel.
pub type ImageSettings {
  ImageSettings(
    background_image_url: option.Option(LocalizedProperty),
    banner_external_url: option.Option(String),
    banner_image_url: option.Option(String),
    banner_mobile_extra_hd_image_url: option.Option(String),
    banner_mobile_hd_image_url: option.Option(String),
    banner_mobile_image_url: option.Option(String),
    banner_mobile_low_image_url: option.Option(String),
    banner_mobile_medium_hd_image_url: option.Option(String),
    banner_tablet_extra_hd_image_url: option.Option(String),
    banner_tablet_hd_image_url: option.Option(String),
    banner_tablet_image_url: option.Option(String),
    banner_tablet_low_image_url: option.Option(String),
    banner_tv_high_image_url: option.Option(String),
    banner_tv_image_url: option.Option(String),
    banner_tv_low_image_url: option.Option(String),
    banner_tv_medium_image_url: option.Option(String),
    large_branded_banner_image_imap_script: option.Option(LocalizedProperty),
    large_branded_banner_image_url: option.Option(LocalizedProperty),
    small_branded_banner_image_imap_script: option.Option(LocalizedProperty),
    small_branded_banner_image_url: option.Option(LocalizedProperty),
    tracking_image_url: option.Option(String),
    watch_icon_image_url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ImageSettings) {
  use background_image_url <- optional_field(
    "backgroundImageUrl",
    option.None,
    optional(localized_property.decoder()),
  )
  use banner_external_url <- optional_field(
    "bannerExternalUrl",
    option.None,
    optional(string),
  )
  use banner_image_url <- optional_field(
    "bannerImageUrl",
    option.None,
    optional(string),
  )
  use banner_mobile_extra_hd_image_url <- optional_field(
    "bannerMobileExtraHdImageUrl",
    option.None,
    optional(string),
  )
  use banner_mobile_hd_image_url <- optional_field(
    "bannerMobileHdImageUrl",
    option.None,
    optional(string),
  )
  use banner_mobile_image_url <- optional_field(
    "bannerMobileImageUrl",
    option.None,
    optional(string),
  )
  use banner_mobile_low_image_url <- optional_field(
    "bannerMobileLowImageUrl",
    option.None,
    optional(string),
  )
  use banner_mobile_medium_hd_image_url <- optional_field(
    "bannerMobileMediumHdImageUrl",
    option.None,
    optional(string),
  )
  use banner_tablet_extra_hd_image_url <- optional_field(
    "bannerTabletExtraHdImageUrl",
    option.None,
    optional(string),
  )
  use banner_tablet_hd_image_url <- optional_field(
    "bannerTabletHdImageUrl",
    option.None,
    optional(string),
  )
  use banner_tablet_image_url <- optional_field(
    "bannerTabletImageUrl",
    option.None,
    optional(string),
  )
  use banner_tablet_low_image_url <- optional_field(
    "bannerTabletLowImageUrl",
    option.None,
    optional(string),
  )
  use banner_tv_high_image_url <- optional_field(
    "bannerTvHighImageUrl",
    option.None,
    optional(string),
  )
  use banner_tv_image_url <- optional_field(
    "bannerTvImageUrl",
    option.None,
    optional(string),
  )
  use banner_tv_low_image_url <- optional_field(
    "bannerTvLowImageUrl",
    option.None,
    optional(string),
  )
  use banner_tv_medium_image_url <- optional_field(
    "bannerTvMediumImageUrl",
    option.None,
    optional(string),
  )
  use large_branded_banner_image_imap_script <- optional_field(
    "largeBrandedBannerImageImapScript",
    option.None,
    optional(localized_property.decoder()),
  )
  use large_branded_banner_image_url <- optional_field(
    "largeBrandedBannerImageUrl",
    option.None,
    optional(localized_property.decoder()),
  )
  use small_branded_banner_image_imap_script <- optional_field(
    "smallBrandedBannerImageImapScript",
    option.None,
    optional(localized_property.decoder()),
  )
  use small_branded_banner_image_url <- optional_field(
    "smallBrandedBannerImageUrl",
    option.None,
    optional(localized_property.decoder()),
  )
  use tracking_image_url <- optional_field(
    "trackingImageUrl",
    option.None,
    optional(string),
  )
  use watch_icon_image_url <- optional_field(
    "watchIconImageUrl",
    option.None,
    optional(string),
  )
  success(
    ImageSettings(
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
    ),
  )
}