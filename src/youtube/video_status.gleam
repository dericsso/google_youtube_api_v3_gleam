//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Basic details about a video category, such as its localized title. Next Id: 20
pub type VideoStatus {
  VideoStatus(
    contains_synthetic_media: option.Option(Bool),
    embeddable: option.Option(Bool),
    failure_reason: option.Option(String),
    license: option.Option(String),
    made_for_kids: option.Option(Bool),
    privacy_status: option.Option(String),
    public_stats_viewable: option.Option(Bool),
    publish_at: option.Option(String),
    rejection_reason: option.Option(String),
    self_declared_made_for_kids: option.Option(Bool),
    upload_status: option.Option(String),
  )
}
