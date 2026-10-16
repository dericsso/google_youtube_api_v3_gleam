//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, dict, success}
import gleam/option
import youtube/brand_partner.{type BrandPartner}
import youtube/video_age_gating.{type VideoAgeGating}
import youtube/video_content_details.{type VideoContentDetails}
import youtube/video_file_details.{type VideoFileDetails}
import youtube/video_live_streaming_details.{type VideoLiveStreamingDetails}
import youtube/video_localization.{type VideoLocalization}
import youtube/video_monetization_details.{type VideoMonetizationDetails}
import youtube/video_paid_product_placement_details.{type VideoPaidProductPlacementDetails}
import youtube/video_player.{type VideoPlayer}
import youtube/video_processing_details.{type VideoProcessingDetails}
import youtube/video_project_details.{type VideoProjectDetails}
import youtube/video_recording_details.{type VideoRecordingDetails}
import youtube/video_snippet.{type VideoSnippet}
import youtube/video_statistics.{type VideoStatistics}
import youtube/video_status.{type VideoStatus}
import youtube/video_suggestions.{type VideoSuggestions}
import youtube/video_topic_details.{type VideoTopicDetails}

/// A *video* resource represents a YouTube video.
pub type Video {
  Video(
    age_gating: option.Option(VideoAgeGating),
    brand_partner: option.Option(BrandPartner),
    content_details: option.Option(VideoContentDetails),
    etag: option.Option(String),
    file_details: option.Option(VideoFileDetails),
    id: option.Option(String),
    kind: option.Option(String),
    live_streaming_details: option.Option(VideoLiveStreamingDetails),
    localizations: option.Option(Dict(String, VideoLocalization)),
    monetization_details: option.Option(VideoMonetizationDetails),
    paid_product_placement_details:
    option.Option(VideoPaidProductPlacementDetails),
    player: option.Option(VideoPlayer),
    processing_details: option.Option(VideoProcessingDetails),
    project_details: option.Option(VideoProjectDetails),
    recording_details: option.Option(VideoRecordingDetails),
    snippet: option.Option(VideoSnippet),
    statistics: option.Option(VideoStatistics),
    status: option.Option(VideoStatus),
    suggestions: option.Option(VideoSuggestions),
    topic_details: option.Option(VideoTopicDetails),
  )
}

pub fn decoder() -> Decoder(Video) {
  use age_gating <- optional_field(
    "ageGating",
    option.None,
    optional(video_age_gating.decoder()),
  )
  use brand_partner <- optional_field(
    "brandPartner",
    option.None,
    optional(brand_partner.decoder()),
  )
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(video_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use file_details <- optional_field(
    "fileDetails",
    option.None,
    optional(video_file_details.decoder()),
  )
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use live_streaming_details <- optional_field(
    "liveStreamingDetails",
    option.None,
    optional(video_live_streaming_details.decoder()),
  )
  use localizations <- optional_field(
    "localizations",
    option.None,
    optional(dict(string, video_localization.decoder())),
  )
  use monetization_details <- optional_field(
    "monetizationDetails",
    option.None,
    optional(video_monetization_details.decoder()),
  )
  use paid_product_placement_details <- optional_field(
    "paidProductPlacementDetails",
    option.None,
    optional(video_paid_product_placement_details.decoder()),
  )
  use player <- optional_field(
    "player",
    option.None,
    optional(video_player.decoder()),
  )
  use processing_details <- optional_field(
    "processingDetails",
    option.None,
    optional(video_processing_details.decoder()),
  )
  use project_details <- optional_field(
    "projectDetails",
    option.None,
    optional(video_project_details.decoder()),
  )
  use recording_details <- optional_field(
    "recordingDetails",
    option.None,
    optional(video_recording_details.decoder()),
  )
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(video_snippet.decoder()),
  )
  use statistics <- optional_field(
    "statistics",
    option.None,
    optional(video_statistics.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(video_status.decoder()),
  )
  use suggestions <- optional_field(
    "suggestions",
    option.None,
    optional(video_suggestions.decoder()),
  )
  use topic_details <- optional_field(
    "topicDetails",
    option.None,
    optional(video_topic_details.decoder()),
  )
  success(
    Video(
      age_gating,
      brand_partner,
      content_details,
      etag,
      file_details,
      id,
      kind,
      live_streaming_details,
      localizations,
      monetization_details,
      paid_product_placement_details,
      player,
      processing_details,
      project_details,
      recording_details,
      snippet,
      statistics,
      status,
      suggestions,
      topic_details,
    ),
  )
}