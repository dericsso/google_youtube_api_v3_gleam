//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, bool, success, then, failure}
import gleam/option
import youtube/comment_snippet_author_channel_id.{type CommentSnippetAuthorChannelId}

/// Basic details about a comment, such as its author and text.
pub type CommentSnippet {
  CommentSnippet(
    author_channel_id: option.Option(CommentSnippetAuthorChannelId),
    author_channel_url: option.Option(String),
    author_display_name: option.Option(String),
    author_profile_image_url: option.Option(String),
    can_rate: option.Option(Bool),
    channel_id: option.Option(String),
    image_url: option.Option(String),
    like_count: option.Option(Int),
    moderation_status: option.Option(ModerationStatus),
    parent_id: option.Option(String),
    published_at: option.Option(String),
    text_display: option.Option(String),
    text_original: option.Option(String),
    updated_at: option.Option(String),
    video_id: option.Option(String),
    viewer_rating: option.Option(ViewerRating),
  )
}

pub fn decoder() -> Decoder(CommentSnippet) {
  use author_channel_id <- optional_field(
    "authorChannelId",
    option.None,
    optional(comment_snippet_author_channel_id.decoder()),
  )
  use author_channel_url <- optional_field(
    "authorChannelUrl",
    option.None,
    optional(string),
  )
  use author_display_name <- optional_field(
    "authorDisplayName",
    option.None,
    optional(string),
  )
  use author_profile_image_url <- optional_field(
    "authorProfileImageUrl",
    option.None,
    optional(string),
  )
  use can_rate <- optional_field("canRate", option.None, optional(bool))
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use image_url <- optional_field("imageUrl", option.None, optional(string))
  use like_count <- optional_field("likeCount", option.None, optional(int))
  use moderation_status <- optional_field(
    "moderationStatus",
    option.None,
    optional(moderation_status_decoder()),
  )
  use parent_id <- optional_field("parentId", option.None, optional(string))
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use text_display <- optional_field(
    "textDisplay",
    option.None,
    optional(string),
  )
  use text_original <- optional_field(
    "textOriginal",
    option.None,
    optional(string),
  )
  use updated_at <- optional_field("updatedAt", option.None, optional(string))
  use video_id <- optional_field("videoId", option.None, optional(string))
  use viewer_rating <- optional_field(
    "viewerRating",
    option.None,
    optional(viewer_rating_decoder()),
  )
  success(
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
  use value <- then(string)
  case value {
    "published" -> success(ModerationStatusPublished)
    "heldForReview" -> success(ModerationStatusHeldForReview)
    "likelySpam" -> success(ModerationStatusLikelySpam)
    "rejected" -> success(ModerationStatusRejected)
    _ -> failure(ModerationStatusPublished, "a valid ModerationStatus")
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
  use value <- then(string)
  case value {
    "none" -> success(ViewerRatingNone)
    "like" -> success(ViewerRatingLike)
    "dislike" -> success(ViewerRatingDislike)
    _ -> failure(ViewerRatingNone, "a valid ViewerRating")
  }
}