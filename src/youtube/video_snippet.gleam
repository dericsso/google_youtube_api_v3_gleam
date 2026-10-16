//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}
import youtube/video_localization.{type VideoLocalization}

/// Basic details about a video, including title, description, uploader, thumbnails and category.
pub type VideoSnippet {
  VideoSnippet(
    category_id: option.Option(String),
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    default_audio_language: option.Option(String),
    default_language: option.Option(String),
    description: option.Option(String),
    live_broadcast_content: option.Option(String),
    localized: option.Option(VideoLocalization),
    published_at: option.Option(String),
    tags: option.Option(List(String)),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}
