//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/option
import youtube/brand_partner.{type BrandPartner}
import youtube/video_age_gating.{type VideoAgeGating}
import youtube/video_content_details.{type VideoContentDetails}
import youtube/video_file_details.{type VideoFileDetails}
import youtube/video_live_streaming_details.{type VideoLiveStreamingDetails}
import youtube/video_localization.{type VideoLocalization}
import youtube/video_monetization_details.{type VideoMonetizationDetails}
import youtube/video_paid_product_placement_details.{
  type VideoPaidProductPlacementDetails,
}
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
    paid_product_placement_details: option.Option(
      VideoPaidProductPlacementDetails,
    ),
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
