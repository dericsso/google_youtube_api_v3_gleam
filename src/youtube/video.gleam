//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
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
    age_gating: Option(VideoAgeGating),
    brand_partner: Option(BrandPartner),
    content_details: Option(VideoContentDetails),
    etag: Option(String),
    file_details: Option(VideoFileDetails),
    id: Option(String),
    kind: Option(String),
    live_streaming_details: Option(VideoLiveStreamingDetails),
    localizations: Option(Dict(String, VideoLocalization)),
    monetization_details: Option(VideoMonetizationDetails),
    paid_product_placement_details: Option(VideoPaidProductPlacementDetails),
    player: Option(VideoPlayer),
    processing_details: Option(VideoProcessingDetails),
    project_details: Option(VideoProjectDetails),
    recording_details: Option(VideoRecordingDetails),
    snippet: Option(VideoSnippet),
    statistics: Option(VideoStatistics),
    status: Option(VideoStatus),
    suggestions: Option(VideoSuggestions),
    topic_details: Option(VideoTopicDetails),
  )
}

pub fn decoder() -> Decoder(Video) {
  use age_gating <- decode.optional_field(
    "ageGating",
    option.None,
    decode.optional(video_age_gating.decoder()),
  )
  use brand_partner <- decode.optional_field(
    "brandPartner",
    option.None,
    decode.optional(brand_partner.decoder()),
  )
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(video_content_details.decoder()),
  )
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use file_details <- decode.optional_field(
    "fileDetails",
    option.None,
    decode.optional(video_file_details.decoder()),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use live_streaming_details <- decode.optional_field(
    "liveStreamingDetails",
    option.None,
    decode.optional(video_live_streaming_details.decoder()),
  )
  use localizations <- decode.optional_field(
    "localizations",
    option.None,
    decode.optional(decode.dict(decode.string, video_localization.decoder())),
  )
  use monetization_details <- decode.optional_field(
    "monetizationDetails",
    option.None,
    decode.optional(video_monetization_details.decoder()),
  )
  use paid_product_placement_details <- decode.optional_field(
    "paidProductPlacementDetails",
    option.None,
    decode.optional(video_paid_product_placement_details.decoder()),
  )
  use player <- decode.optional_field(
    "player",
    option.None,
    decode.optional(video_player.decoder()),
  )
  use processing_details <- decode.optional_field(
    "processingDetails",
    option.None,
    decode.optional(video_processing_details.decoder()),
  )
  use project_details <- decode.optional_field(
    "projectDetails",
    option.None,
    decode.optional(video_project_details.decoder()),
  )
  use recording_details <- decode.optional_field(
    "recordingDetails",
    option.None,
    decode.optional(video_recording_details.decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(video_snippet.decoder()),
  )
  use statistics <- decode.optional_field(
    "statistics",
    option.None,
    decode.optional(video_statistics.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(video_status.decoder()),
  )
  use suggestions <- decode.optional_field(
    "suggestions",
    option.None,
    decode.optional(video_suggestions.decoder()),
  )
  use topic_details <- decode.optional_field(
    "topicDetails",
    option.None,
    decode.optional(video_topic_details.decoder()),
  )
  decode.success(Video(
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
  ))
}

pub fn to_json(value: Video) -> Json {
  json.object([
    #("ageGating", json.nullable(value.age_gating, video_age_gating.to_json)),
    #("brandPartner", json.nullable(value.brand_partner, brand_partner.to_json)),
    #(
      "contentDetails",
      json.nullable(value.content_details, video_content_details.to_json),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #(
      "fileDetails",
      json.nullable(value.file_details, video_file_details.to_json),
    ),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "liveStreamingDetails",
      json.nullable(
        value.live_streaming_details,
        video_live_streaming_details.to_json,
      ),
    ),
    #(
      "localizations",
      json.nullable(value.localizations, fn(d) {
        json.dict(d, fn(k) { k }, video_localization.to_json)
      }),
    ),
    #(
      "monetizationDetails",
      json.nullable(
        value.monetization_details,
        video_monetization_details.to_json,
      ),
    ),
    #(
      "paidProductPlacementDetails",
      json.nullable(
        value.paid_product_placement_details,
        video_paid_product_placement_details.to_json,
      ),
    ),
    #("player", json.nullable(value.player, video_player.to_json)),
    #(
      "processingDetails",
      json.nullable(value.processing_details, video_processing_details.to_json),
    ),
    #(
      "projectDetails",
      json.nullable(value.project_details, video_project_details.to_json),
    ),
    #(
      "recordingDetails",
      json.nullable(value.recording_details, video_recording_details.to_json),
    ),
    #("snippet", json.nullable(value.snippet, video_snippet.to_json)),
    #("statistics", json.nullable(value.statistics, video_statistics.to_json)),
    #("status", json.nullable(value.status, video_status.to_json)),
    #(
      "suggestions",
      json.nullable(value.suggestions, video_suggestions.to_json),
    ),
    #(
      "topicDetails",
      json.nullable(value.topic_details, video_topic_details.to_json),
    ),
  ])
}
