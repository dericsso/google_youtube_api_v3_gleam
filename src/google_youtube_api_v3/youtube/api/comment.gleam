import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/comment.{type Comment, type CommentThread}

/// Inserts a new resource into this collection.
pub type CommentThreadsInsertParams {
  CommentThreadsInsertParams(part: List(String))
}

pub fn comment_threads_insert(
  part: List(String),
) -> CommentThreadsInsertParams {
  CommentThreadsInsertParams(part)
}

pub fn comment_threads_insert_add_part(
  params: CommentThreadsInsertParams,
  value: String,
) -> CommentThreadsInsertParams {
  CommentThreadsInsertParams(list.append(params.part, [value]))
}

pub fn comment_threads_insert_request(
  params: CommentThreadsInsertParams,
  body: CommentThread,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/commentThreads",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.Some(json.to_string(comment.comment_thread_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type CommentThreadsListParams {
  CommentThreadsListParams(
    part: List(String),
    all_threads_related_to_channel_id: Option(String),
    channel_id: Option(String),
    id: Option(List(String)),
    max_results: Option(Int),
    moderation_status: Option(CommentThreadsListModerationStatus),
    order: Option(CommentThreadsListOrder),
    page_token: Option(String),
    search_terms: Option(String),
    text_format: Option(CommentThreadsListTextFormat),
    video_id: Option(String),
  )
}

pub fn comment_threads_list(part: List(String)) -> CommentThreadsListParams {
  CommentThreadsListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn comment_threads_list_add_part(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    list.append(params.part, [value]),
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_video_id(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    option.Some(value),
  )
}

pub fn comment_threads_list_with_text_format(
  params: CommentThreadsListParams,
  value: CommentThreadsListTextFormat,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    option.Some(value),
    params.video_id,
  )
}

pub fn comment_threads_list_with_search_terms(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    option.Some(value),
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_page_token(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    option.Some(value),
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_order(
  params: CommentThreadsListParams,
  value: CommentThreadsListOrder,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    option.Some(value),
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_moderation_status(
  params: CommentThreadsListParams,
  value: CommentThreadsListModerationStatus,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    params.max_results,
    option.Some(value),
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_max_results(
  params: CommentThreadsListParams,
  value: Int,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    params.id,
    option.Some(value),
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_id(
  params: CommentThreadsListParams,
  value: List(String),
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    option.Some(value),
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_add_id(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    params.channel_id,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_channel_id(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    params.all_threads_related_to_channel_id,
    option.Some(value),
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_with_all_threads_related_to_channel_id(
  params: CommentThreadsListParams,
  value: String,
) -> CommentThreadsListParams {
  CommentThreadsListParams(
    params.part,
    option.Some(value),
    params.channel_id,
    params.id,
    params.max_results,
    params.moderation_status,
    params.order,
    params.page_token,
    params.search_terms,
    params.text_format,
    params.video_id,
  )
}

pub fn comment_threads_list_request(
  params: CommentThreadsListParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/commentThreads",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.all_threads_related_to_channel_id {
        option.Some(v) -> [#("allThreadsRelatedToChannelId", v)]
        option.None -> []
      },
      case params.channel_id {
        option.Some(v) -> [#("channelId", v)]
        option.None -> []
      },
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.moderation_status {
        option.Some(v) -> [
          #(
            "moderationStatus",
            comment_threads_list_moderation_status_to_string(v),
          ),
        ]
        option.None -> []
      },
      case params.order {
        option.Some(v) -> [
          #("order", comment_threads_list_order_to_string(v)),
        ]
        option.None -> []
      },
      case params.page_token {
        option.Some(v) -> [#("pageToken", v)]
        option.None -> []
      },
      case params.search_terms {
        option.Some(v) -> [#("searchTerms", v)]
        option.None -> []
      },
      case params.text_format {
        option.Some(v) -> [
          #("textFormat", comment_threads_list_text_format_to_string(v)),
        ]
        option.None -> []
      },
      case params.video_id {
        option.Some(v) -> [#("videoId", v)]
        option.None -> []
      },
    ]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.None,
  )
}

/// Deletes a resource.
pub type CommentsDeleteParams {
  CommentsDeleteParams(id: String)
}

pub fn comments_delete(id: String) -> CommentsDeleteParams {
  CommentsDeleteParams(id)
}

pub fn comments_delete_request(params: CommentsDeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/comments",
    list.flatten([[#("id", params.id)]]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.None,
  )
}

/// Inserts a new resource into this collection.
pub type CommentsInsertParams {
  CommentsInsertParams(part: List(String))
}

pub fn comments_insert(part: List(String)) -> CommentsInsertParams {
  CommentsInsertParams(part)
}

pub fn comments_insert_add_part(
  params: CommentsInsertParams,
  value: String,
) -> CommentsInsertParams {
  CommentsInsertParams(list.append(params.part, [value]))
}

pub fn comments_insert_request(
  params: CommentsInsertParams,
  body: Comment,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/comments",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.Some(json.to_string(comment.comment_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type CommentsListParams {
  CommentsListParams(
    part: List(String),
    id: Option(List(String)),
    max_results: Option(Int),
    page_token: Option(String),
    parent_id: Option(String),
    text_format: Option(CommentsListTextFormat),
  )
}

pub fn comments_list(part: List(String)) -> CommentsListParams {
  CommentsListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn comments_list_add_part(
  params: CommentsListParams,
  value: String,
) -> CommentsListParams {
  CommentsListParams(
    list.append(params.part, [value]),
    params.id,
    params.max_results,
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn comments_list_with_text_format(
  params: CommentsListParams,
  value: CommentsListTextFormat,
) -> CommentsListParams {
  CommentsListParams(
    params.part,
    params.id,
    params.max_results,
    params.page_token,
    params.parent_id,
    option.Some(value),
  )
}

pub fn comments_list_with_parent_id(
  params: CommentsListParams,
  value: String,
) -> CommentsListParams {
  CommentsListParams(
    params.part,
    params.id,
    params.max_results,
    params.page_token,
    option.Some(value),
    params.text_format,
  )
}

pub fn comments_list_with_page_token(
  params: CommentsListParams,
  value: String,
) -> CommentsListParams {
  CommentsListParams(
    params.part,
    params.id,
    params.max_results,
    option.Some(value),
    params.parent_id,
    params.text_format,
  )
}

pub fn comments_list_with_max_results(
  params: CommentsListParams,
  value: Int,
) -> CommentsListParams {
  CommentsListParams(
    params.part,
    params.id,
    option.Some(value),
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn comments_list_with_id(
  params: CommentsListParams,
  value: List(String),
) -> CommentsListParams {
  CommentsListParams(
    params.part,
    option.Some(value),
    params.max_results,
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn comments_list_add_id(
  params: CommentsListParams,
  value: String,
) -> CommentsListParams {
  CommentsListParams(
    params.part,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.max_results,
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn comments_list_request(params: CommentsListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/comments",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.page_token {
        option.Some(v) -> [#("pageToken", v)]
        option.None -> []
      },
      case params.parent_id {
        option.Some(v) -> [#("parentId", v)]
        option.None -> []
      },
      case params.text_format {
        option.Some(v) -> [
          #("textFormat", comments_list_text_format_to_string(v)),
        ]
        option.None -> []
      },
    ]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.None,
  )
}

/// Expresses the caller's opinion that one or more comments should be flagged as spam.
pub type CommentsMarkAsSpamParams {
  CommentsMarkAsSpamParams(id: List(String))
}

pub fn comments_mark_as_spam(id: List(String)) -> CommentsMarkAsSpamParams {
  CommentsMarkAsSpamParams(id)
}

pub fn comments_mark_as_spam_add_id(
  params: CommentsMarkAsSpamParams,
  value: String,
) -> CommentsMarkAsSpamParams {
  CommentsMarkAsSpamParams(list.append(params.id, [value]))
}

pub fn comments_mark_as_spam_request(
  params: CommentsMarkAsSpamParams,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/comments/markAsSpam",
    list.flatten([list.map(params.id, fn(v) { #("id", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.None,
  )
}

/// Sets the moderation status of one or more comments.
pub type CommentsSetModerationStatusParams {
  CommentsSetModerationStatusParams(
    id: List(String),
    moderation_status: CommentsSetModerationStatusModerationStatus,
    ban_author: Option(Bool),
  )
}

pub fn comments_set_moderation_status(
  id: List(String),
  moderation_status: CommentsSetModerationStatusModerationStatus,
) -> CommentsSetModerationStatusParams {
  CommentsSetModerationStatusParams(id, moderation_status, option.None)
}

pub fn comments_set_moderation_status_add_id(
  params: CommentsSetModerationStatusParams,
  value: String,
) -> CommentsSetModerationStatusParams {
  CommentsSetModerationStatusParams(
    list.append(params.id, [value]),
    params.moderation_status,
    params.ban_author,
  )
}

pub fn comments_set_moderation_status_with_ban_author(
  params: CommentsSetModerationStatusParams,
  value: Bool,
) -> CommentsSetModerationStatusParams {
  CommentsSetModerationStatusParams(
    params.id,
    params.moderation_status,
    option.Some(value),
  )
}

pub fn comments_set_moderation_status_request(
  params: CommentsSetModerationStatusParams,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/comments/setModerationStatus",
    list.flatten([
      list.map(params.id, fn(v) { #("id", v) }),
      [
        #(
          "moderationStatus",
          comments_set_moderation_status_moderation_status_to_string(
            params.moderation_status,
          ),
        ),
      ],
      case params.ban_author {
        option.Some(v) -> [#("banAuthor", bool.to_string(v))]
        option.None -> []
      },
    ]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.None,
  )
}

/// Updates an existing resource.
pub type CommentsUpdateParams {
  CommentsUpdateParams(part: List(String))
}

pub fn comments_update(part: List(String)) -> CommentsUpdateParams {
  CommentsUpdateParams(part)
}

pub fn comments_update_add_part(
  params: CommentsUpdateParams,
  value: String,
) -> CommentsUpdateParams {
  CommentsUpdateParams(list.append(params.part, [value]))
}

pub fn comments_update_request(
  params: CommentsUpdateParams,
  body: Comment,
) -> Request {
  Request(
    http.Put,
    "youtube/v3/comments",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.Some(json.to_string(comment.comment_to_json(body))),
  )
}

/// Limits the returned comment threads to those with the specified moderation status. Not compatible with the 'id' filter. Valid values: published, heldForReview, likelySpam.
pub type CommentThreadsListModerationStatus {
  CommentThreadsListModerationStatusPublished
  CommentThreadsListModerationStatusHeldForReview
  CommentThreadsListModerationStatusLikelySpam
  CommentThreadsListModerationStatusRejected
}

pub fn comment_threads_list_moderation_status_to_string(
  value: CommentThreadsListModerationStatus,
) -> String {
  case value {
    CommentThreadsListModerationStatusPublished -> "published"
    CommentThreadsListModerationStatusHeldForReview -> "heldForReview"
    CommentThreadsListModerationStatusLikelySpam -> "likelySpam"
    CommentThreadsListModerationStatusRejected -> "rejected"
  }
}

pub fn comment_threads_list_moderation_status_decoder() -> Decoder(
  CommentThreadsListModerationStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "published" -> decode.success(CommentThreadsListModerationStatusPublished)
    "heldForReview" ->
      decode.success(CommentThreadsListModerationStatusHeldForReview)
    "likelySpam" -> decode.success(CommentThreadsListModerationStatusLikelySpam)
    "rejected" -> decode.success(CommentThreadsListModerationStatusRejected)
    _ ->
      decode.failure(
        CommentThreadsListModerationStatusPublished,
        "a valid CommentThreadsListModerationStatus",
      )
  }
}

pub type CommentThreadsListOrder {
  CommentThreadsListOrderOrderUnspecified
  CommentThreadsListOrderTime
  CommentThreadsListOrderRelevance
}

pub fn comment_threads_list_order_to_string(
  value: CommentThreadsListOrder,
) -> String {
  case value {
    CommentThreadsListOrderOrderUnspecified -> "orderUnspecified"
    CommentThreadsListOrderTime -> "time"
    CommentThreadsListOrderRelevance -> "relevance"
  }
}

pub fn comment_threads_list_order_decoder() -> Decoder(CommentThreadsListOrder) {
  use value <- decode.then(decode.string)
  case value {
    "orderUnspecified" ->
      decode.success(CommentThreadsListOrderOrderUnspecified)
    "time" -> decode.success(CommentThreadsListOrderTime)
    "relevance" -> decode.success(CommentThreadsListOrderRelevance)
    _ ->
      decode.failure(
        CommentThreadsListOrderOrderUnspecified,
        "a valid CommentThreadsListOrder",
      )
  }
}

/// The requested text format for the returned comments.
pub type CommentThreadsListTextFormat {
  CommentThreadsListTextFormatTextFormatUnspecified
  CommentThreadsListTextFormatHtml
  CommentThreadsListTextFormatPlainText
}

pub fn comment_threads_list_text_format_to_string(
  value: CommentThreadsListTextFormat,
) -> String {
  case value {
    CommentThreadsListTextFormatTextFormatUnspecified -> "textFormatUnspecified"
    CommentThreadsListTextFormatHtml -> "html"
    CommentThreadsListTextFormatPlainText -> "plainText"
  }
}

pub fn comment_threads_list_text_format_decoder() -> Decoder(
  CommentThreadsListTextFormat,
) {
  use value <- decode.then(decode.string)
  case value {
    "textFormatUnspecified" ->
      decode.success(CommentThreadsListTextFormatTextFormatUnspecified)
    "html" -> decode.success(CommentThreadsListTextFormatHtml)
    "plainText" -> decode.success(CommentThreadsListTextFormatPlainText)
    _ ->
      decode.failure(
        CommentThreadsListTextFormatTextFormatUnspecified,
        "a valid CommentThreadsListTextFormat",
      )
  }
}

/// The requested text format for the returned comments.
pub type CommentsListTextFormat {
  CommentsListTextFormatTextFormatUnspecified
  CommentsListTextFormatHtml
  CommentsListTextFormatPlainText
}

pub fn comments_list_text_format_to_string(
  value: CommentsListTextFormat,
) -> String {
  case value {
    CommentsListTextFormatTextFormatUnspecified -> "textFormatUnspecified"
    CommentsListTextFormatHtml -> "html"
    CommentsListTextFormatPlainText -> "plainText"
  }
}

pub fn comments_list_text_format_decoder() -> Decoder(CommentsListTextFormat) {
  use value <- decode.then(decode.string)
  case value {
    "textFormatUnspecified" ->
      decode.success(CommentsListTextFormatTextFormatUnspecified)
    "html" -> decode.success(CommentsListTextFormatHtml)
    "plainText" -> decode.success(CommentsListTextFormatPlainText)
    _ ->
      decode.failure(
        CommentsListTextFormatTextFormatUnspecified,
        "a valid CommentsListTextFormat",
      )
  }
}

/// Specifies the requested moderation status. Note, comments can be in statuses, which are not available through this call. For example, this call does not allow to mark a comment as 'likely spam'. Valid values: 'heldForReview', 'published' or 'rejected'.
pub type CommentsSetModerationStatusModerationStatus {
  CommentsSetModerationStatusModerationStatusPublished
  CommentsSetModerationStatusModerationStatusHeldForReview
  CommentsSetModerationStatusModerationStatusLikelySpam
  CommentsSetModerationStatusModerationStatusRejected
}

pub fn comments_set_moderation_status_moderation_status_to_string(
  value: CommentsSetModerationStatusModerationStatus,
) -> String {
  case value {
    CommentsSetModerationStatusModerationStatusPublished -> "published"
    CommentsSetModerationStatusModerationStatusHeldForReview -> "heldForReview"
    CommentsSetModerationStatusModerationStatusLikelySpam -> "likelySpam"
    CommentsSetModerationStatusModerationStatusRejected -> "rejected"
  }
}

pub fn comments_set_moderation_status_moderation_status_decoder() -> Decoder(
  CommentsSetModerationStatusModerationStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "published" ->
      decode.success(CommentsSetModerationStatusModerationStatusPublished)
    "heldForReview" ->
      decode.success(CommentsSetModerationStatusModerationStatusHeldForReview)
    "likelySpam" ->
      decode.success(CommentsSetModerationStatusModerationStatusLikelySpam)
    "rejected" ->
      decode.success(CommentsSetModerationStatusModerationStatusRejected)
    _ ->
      decode.failure(
        CommentsSetModerationStatusModerationStatusPublished,
        "a valid CommentsSetModerationStatusModerationStatus",
      )
  }
}
