//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
