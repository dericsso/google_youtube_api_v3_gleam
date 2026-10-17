//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/comment_snippet_author_channel_id.{type CommentSnippetAuthorChannelId}

/// Basic details about a comment, such as its author and text.
pub type CommentSnippet {
  CommentSnippet(
    author_channel_id: Option(CommentSnippetAuthorChannelId),
    author_channel_url: Option(String),
    author_display_name: Option(String),
    author_profile_image_url: Option(String),
    can_rate: Option(Bool),
    channel_id: Option(String),
    image_url: Option(String),
    like_count: Option(Int),
    moderation_status: Option(ModerationStatus),
    parent_id: Option(String),
    published_at: Option(String),
    text_display: Option(String),
    text_original: Option(String),
    updated_at: Option(String),
    video_id: Option(String),
    viewer_rating: Option(ViewerRating),
  )
}

pub fn decoder() -> Decoder(CommentSnippet) {
  use author_channel_id <- decode.optional_field(
    "authorChannelId",
    option.None,
    decode.optional(comment_snippet_author_channel_id.decoder()),
  )
  use author_channel_url <- decode.optional_field(
    "authorChannelUrl",
    option.None,
    decode.optional(decode.string),
  )
  use author_display_name <- decode.optional_field(
    "authorDisplayName",
    option.None,
    decode.optional(decode.string),
  )
  use author_profile_image_url <- decode.optional_field(
    "authorProfileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use can_rate <- decode.optional_field(
    "canRate",
    option.None,
    decode.optional(decode.bool),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use image_url <- decode.optional_field(
    "imageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use like_count <- decode.optional_field(
    "likeCount",
    option.None,
    decode.optional(decode.int),
  )
  use moderation_status <- decode.optional_field(
    "moderationStatus",
    option.None,
    decode.optional(moderation_status_decoder()),
  )
  use parent_id <- decode.optional_field(
    "parentId",
    option.None,
    decode.optional(decode.string),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use text_display <- decode.optional_field(
    "textDisplay",
    option.None,
    decode.optional(decode.string),
  )
  use text_original <- decode.optional_field(
    "textOriginal",
    option.None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updatedAt",
    option.None,
    decode.optional(decode.string),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  use viewer_rating <- decode.optional_field(
    "viewerRating",
    option.None,
    decode.optional(viewer_rating_decoder()),
  )
  decode.success(
    CommentSnippet(
      author_channel_id,
      author_channel_url,
      author_display_name,
      author_profile_image_url,
      can_rate,
      channel_id,
      image_url,
      like_count,
      moderation_status,
      parent_id,
      published_at,
      text_display,
      text_original,
      updated_at,
      video_id,
      viewer_rating,
    ),
  )
}

pub fn to_json(value: CommentSnippet) -> Json {
  json.object(
    [
      #(
        "authorChannelId",
        json.nullable(
          value.author_channel_id,
          comment_snippet_author_channel_id.to_json,
        ),
      ),
      #(
        "authorChannelUrl",
        json.nullable(value.author_channel_url, json.string),
      ),
      #(
        "authorDisplayName",
        json.nullable(value.author_display_name, json.string),
      ),
      #(
        "authorProfileImageUrl",
        json.nullable(value.author_profile_image_url, json.string),
      ),
      #("canRate", json.nullable(value.can_rate, json.bool)),
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("imageUrl", json.nullable(value.image_url, json.string)),
      #("likeCount", json.nullable(value.like_count, json.int)),
      #(
        "moderationStatus",
        json.nullable(
          value.moderation_status,
          fn(e)
          { json.string(moderation_status_to_string(e)) },
        ),
      ),
      #("parentId", json.nullable(value.parent_id, json.string)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #("textDisplay", json.nullable(value.text_display, json.string)),
      #("textOriginal", json.nullable(value.text_original, json.string)),
      #("updatedAt", json.nullable(value.updated_at, json.string)),
      #("videoId", json.nullable(value.video_id, json.string)),
      #(
        "viewerRating",
        json.nullable(
          value.viewer_rating,
          fn(e)
          { json.string(viewer_rating_to_string(e)) },
        ),
      ),
    ],
  )
}

/// The comment's moderation status. Will not be set if the comments were requested through the id filter.
pub type ModerationStatus {
  ModerationStatusPublished
  ModerationStatusHeldForReview
  ModerationStatusLikelySpam
  ModerationStatusRejected
}

pub fn moderation_status_to_string(value: ModerationStatus) -> String {
  case value {
    ModerationStatusPublished -> "published"
    ModerationStatusHeldForReview -> "heldForReview"
    ModerationStatusLikelySpam -> "likelySpam"
    ModerationStatusRejected -> "rejected"
  }
}

pub fn moderation_status_decoder() -> Decoder(ModerationStatus) {
  use value <- decode.then(decode.string)
  case value {
    "published" -> decode.success(ModerationStatusPublished)
    "heldForReview" -> decode.success(ModerationStatusHeldForReview)
    "likelySpam" -> decode.success(ModerationStatusLikelySpam)
    "rejected" -> decode.success(ModerationStatusRejected)
    _ -> decode.failure(ModerationStatusPublished, "a valid ModerationStatus")
  }
}

/// The rating the viewer has given to this comment. For the time being this will never return RATE_TYPE_DISLIKE and instead return RATE_TYPE_NONE. This may change in the future.
pub type ViewerRating {
  ViewerRatingNone
  ViewerRatingLike
  ViewerRatingDislike
}

pub fn viewer_rating_to_string(value: ViewerRating) -> String {
  case value {
    ViewerRatingNone -> "none"
    ViewerRatingLike -> "like"
    ViewerRatingDislike -> "dislike"
  }
}

pub fn viewer_rating_decoder() -> Decoder(ViewerRating) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(ViewerRatingNone)
    "like" -> decode.success(ViewerRatingLike)
    "dislike" -> decode.success(ViewerRatingDislike)
    _ -> decode.failure(ViewerRatingNone, "a valid ViewerRating")
  }
}