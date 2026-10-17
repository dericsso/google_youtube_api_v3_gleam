import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

/// A *comment* represents a single YouTube comment.
pub type Comment {
  Comment(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(CommentSnippet),
  )
}

pub fn comment_decoder() -> Decoder(Comment) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
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
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(comment_snippet_decoder()),
  )
  decode.success(Comment(etag, id, kind, snippet))
}

pub fn comment_to_json(value: Comment) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, comment_snippet_to_json)),
  ])
}

pub type CommentListResponse {
  CommentListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(Comment)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn comment_list_response_decoder() -> Decoder(CommentListResponse) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(comment_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(CommentListResponse(
    etag,
    event_id,
    items,
    kind,
    next_page_token,
    page_info,
    token_pagination,
    visitor_id,
  ))
}

pub fn comment_list_response_to_json(value: CommentListResponse) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, comment_to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("nextPageToken", json.nullable(value.next_page_token, json.string)),
    #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
    #(
      "tokenPagination",
      json.nullable(
        value.token_pagination,
        token_pagination.token_pagination_to_json,
      ),
    ),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}

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

pub fn comment_snippet_decoder() -> Decoder(CommentSnippet) {
  use author_channel_id <- decode.optional_field(
    "authorChannelId",
    option.None,
    decode.optional(comment_snippet_author_channel_id_decoder()),
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
  decode.success(CommentSnippet(
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
  ))
}

pub fn comment_snippet_to_json(value: CommentSnippet) -> Json {
  json.object([
    #(
      "authorChannelId",
      json.nullable(
        value.author_channel_id,
        comment_snippet_author_channel_id_to_json,
      ),
    ),
    #("authorChannelUrl", json.nullable(value.author_channel_url, json.string)),
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
      json.nullable(value.moderation_status, fn(e) {
        json.string(moderation_status_to_string(e))
      }),
    ),
    #("parentId", json.nullable(value.parent_id, json.string)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #("textDisplay", json.nullable(value.text_display, json.string)),
    #("textOriginal", json.nullable(value.text_original, json.string)),
    #("updatedAt", json.nullable(value.updated_at, json.string)),
    #("videoId", json.nullable(value.video_id, json.string)),
    #(
      "viewerRating",
      json.nullable(value.viewer_rating, fn(e) {
        json.string(viewer_rating_to_string(e))
      }),
    ),
  ])
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

/// Contains the id of the author's YouTube channel, if any.
pub type CommentSnippetAuthorChannelId {
  CommentSnippetAuthorChannelId(value: Option(String))
}

pub fn comment_snippet_author_channel_id_decoder() -> Decoder(
  CommentSnippetAuthorChannelId,
) {
  use value <- decode.optional_field(
    "value",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(CommentSnippetAuthorChannelId(value))
}

pub fn comment_snippet_author_channel_id_to_json(
  value: CommentSnippetAuthorChannelId,
) -> Json {
  json.object([#("value", json.nullable(value.value, json.string))])
}

/// A *comment thread* represents information that applies to a top level comment and all its replies. It can also include the top level comment itself and some of the replies.
pub type CommentThread {
  CommentThread(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    replies: Option(CommentThreadReplies),
    snippet: Option(CommentThreadSnippet),
  )
}

pub fn comment_thread_decoder() -> Decoder(CommentThread) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
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
  use replies <- decode.optional_field(
    "replies",
    option.None,
    decode.optional(comment_thread_replies_decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(comment_thread_snippet_decoder()),
  )
  decode.success(CommentThread(etag, id, kind, replies, snippet))
}

pub fn comment_thread_to_json(value: CommentThread) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("replies", json.nullable(value.replies, comment_thread_replies_to_json)),
    #("snippet", json.nullable(value.snippet, comment_thread_snippet_to_json)),
  ])
}

pub type CommentThreadListResponse {
  CommentThreadListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(CommentThread)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn comment_thread_list_response_decoder() -> Decoder(
  CommentThreadListResponse,
) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use event_id <- decode.optional_field(
    "eventId",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(comment_thread_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(CommentThreadListResponse(
    etag,
    event_id,
    items,
    kind,
    next_page_token,
    page_info,
    token_pagination,
    visitor_id,
  ))
}

pub fn comment_thread_list_response_to_json(
  value: CommentThreadListResponse,
) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("eventId", json.nullable(value.event_id, json.string)),
    #(
      "items",
      json.nullable(value.items, fn(items) {
        json.array(items, comment_thread_to_json)
      }),
    ),
    #("kind", json.nullable(value.kind, json.string)),
    #("nextPageToken", json.nullable(value.next_page_token, json.string)),
    #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
    #(
      "tokenPagination",
      json.nullable(
        value.token_pagination,
        token_pagination.token_pagination_to_json,
      ),
    ),
    #("visitorId", json.nullable(value.visitor_id, json.string)),
  ])
}

/// Comments written in (direct or indirect) reply to the top level comment.
pub type CommentThreadReplies {
  CommentThreadReplies(comments: Option(List(Comment)))
}

pub fn comment_thread_replies_decoder() -> Decoder(CommentThreadReplies) {
  use comments <- decode.optional_field(
    "comments",
    option.None,
    decode.optional(decode.list(comment_decoder())),
  )
  decode.success(CommentThreadReplies(comments))
}

pub fn comment_thread_replies_to_json(value: CommentThreadReplies) -> Json {
  json.object([
    #(
      "comments",
      json.nullable(value.comments, fn(items) {
        json.array(items, comment_to_json)
      }),
    ),
  ])
}

/// Basic details about a comment thread.
pub type CommentThreadSnippet {
  CommentThreadSnippet(
    can_reply: Option(Bool),
    channel_id: Option(String),
    is_public: Option(Bool),
    top_level_comment: Option(Comment),
    total_reply_count: Option(Int),
    video_id: Option(String),
  )
}

pub fn comment_thread_snippet_decoder() -> Decoder(CommentThreadSnippet) {
  use can_reply <- decode.optional_field(
    "canReply",
    option.None,
    decode.optional(decode.bool),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use is_public <- decode.optional_field(
    "isPublic",
    option.None,
    decode.optional(decode.bool),
  )
  use top_level_comment <- decode.optional_field(
    "topLevelComment",
    option.None,
    decode.optional(comment_decoder()),
  )
  use total_reply_count <- decode.optional_field(
    "totalReplyCount",
    option.None,
    decode.optional(decode.int),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(CommentThreadSnippet(
    can_reply,
    channel_id,
    is_public,
    top_level_comment,
    total_reply_count,
    video_id,
  ))
}

pub fn comment_thread_snippet_to_json(value: CommentThreadSnippet) -> Json {
  json.object([
    #("canReply", json.nullable(value.can_reply, json.bool)),
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("isPublic", json.nullable(value.is_public, json.bool)),
    #(
      "topLevelComment",
      json.nullable(value.top_level_comment, comment_to_json),
    ),
    #("totalReplyCount", json.nullable(value.total_reply_count, json.int)),
    #("videoId", json.nullable(value.video_id, json.string)),
  ])
}
