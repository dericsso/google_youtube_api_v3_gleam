//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/comment.{type Comment}

/// Deletes a resource.
pub type DeleteParams {
  DeleteParams(id: String)
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id)
}

pub fn delete_request(params: DeleteParams) -> Request {
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
pub type InsertParams {
  InsertParams(part: List(String))
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(list.append(params.part, [value]))
}

pub fn insert_request(params: InsertParams, body: Comment) -> Request {
  Request(
    http.Post,
    "youtube/v3/comments",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.Some(json.to_string(comment.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    id: Option(List(String)),
    max_results: Option(Int),
    page_token: Option(String),
    parent_id: Option(String),
    text_format: Option(ListTextFormat),
  )
}

pub fn list(part: List(String)) -> ListParams {
  ListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.id,
    params.max_results,
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn list_with_text_format(
  params: ListParams,
  value: ListTextFormat,
) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    params.page_token,
    params.parent_id,
    option.Some(value),
  )
}

pub fn list_with_parent_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    params.page_token,
    option.Some(value),
    params.text_format,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    option.Some(value),
    params.parent_id,
    params.text_format,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.id,
    option.Some(value),
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.max_results,
    params.page_token,
    params.parent_id,
    params.text_format,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
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

pub fn list_request(params: ListParams) -> Request {
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
        option.Some(v) -> [#("textFormat", list_text_format_to_string(v))]
        option.None -> []
      },
    ]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.None,
  )
}

/// Expresses the caller's opinion that one or more comments should be flagged as spam.
pub type MarkAsSpamParams {
  MarkAsSpamParams(id: List(String))
}

pub fn mark_as_spam(id: List(String)) -> MarkAsSpamParams {
  MarkAsSpamParams(id)
}

pub fn mark_as_spam_add_id(
  params: MarkAsSpamParams,
  value: String,
) -> MarkAsSpamParams {
  MarkAsSpamParams(list.append(params.id, [value]))
}

pub fn mark_as_spam_request(params: MarkAsSpamParams) -> Request {
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
pub type SetModerationStatusParams {
  SetModerationStatusParams(
    id: List(String),
    moderation_status: SetModerationStatusModerationStatus,
    ban_author: Option(Bool),
  )
}

pub fn set_moderation_status(
  id: List(String),
  moderation_status: SetModerationStatusModerationStatus,
) -> SetModerationStatusParams {
  SetModerationStatusParams(id, moderation_status, option.None)
}

pub fn set_moderation_status_add_id(
  params: SetModerationStatusParams,
  value: String,
) -> SetModerationStatusParams {
  SetModerationStatusParams(
    list.append(params.id, [value]),
    params.moderation_status,
    params.ban_author,
  )
}

pub fn set_moderation_status_with_ban_author(
  params: SetModerationStatusParams,
  value: Bool,
) -> SetModerationStatusParams {
  SetModerationStatusParams(
    params.id,
    params.moderation_status,
    option.Some(value),
  )
}

pub fn set_moderation_status_request(
  params: SetModerationStatusParams,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/comments/setModerationStatus",
    list.flatten([
      list.map(params.id, fn(v) { #("id", v) }),
      [
        #(
          "moderationStatus",
          set_moderation_status_moderation_status_to_string(
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
pub type UpdateParams {
  UpdateParams(part: List(String))
}

pub fn update(part: List(String)) -> UpdateParams {
  UpdateParams(part)
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(list.append(params.part, [value]))
}

pub fn update_request(params: UpdateParams, body: Comment) -> Request {
  Request(
    http.Put,
    "youtube/v3/comments",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.Some(json.to_string(comment.to_json(body))),
  )
}

/// The requested text format for the returned comments.
pub type ListTextFormat {
  ListTextFormatTextFormatUnspecified
  ListTextFormatHtml
  ListTextFormatPlainText
}

pub fn list_text_format_to_string(value: ListTextFormat) -> String {
  case value {
    ListTextFormatTextFormatUnspecified -> "textFormatUnspecified"
    ListTextFormatHtml -> "html"
    ListTextFormatPlainText -> "plainText"
  }
}

pub fn list_text_format_decoder() -> Decoder(ListTextFormat) {
  use value <- decode.then(decode.string)
  case value {
    "textFormatUnspecified" ->
      decode.success(ListTextFormatTextFormatUnspecified)
    "html" -> decode.success(ListTextFormatHtml)
    "plainText" -> decode.success(ListTextFormatPlainText)
    _ ->
      decode.failure(
        ListTextFormatTextFormatUnspecified,
        "a valid ListTextFormat",
      )
  }
}

/// Specifies the requested moderation status. Note, comments can be in statuses, which are not available through this call. For example, this call does not allow to mark a comment as 'likely spam'. Valid values: 'heldForReview', 'published' or 'rejected'.
pub type SetModerationStatusModerationStatus {
  SetModerationStatusModerationStatusPublished
  SetModerationStatusModerationStatusHeldForReview
  SetModerationStatusModerationStatusLikelySpam
  SetModerationStatusModerationStatusRejected
}

pub fn set_moderation_status_moderation_status_to_string(
  value: SetModerationStatusModerationStatus,
) -> String {
  case value {
    SetModerationStatusModerationStatusPublished -> "published"
    SetModerationStatusModerationStatusHeldForReview -> "heldForReview"
    SetModerationStatusModerationStatusLikelySpam -> "likelySpam"
    SetModerationStatusModerationStatusRejected -> "rejected"
  }
}

pub fn set_moderation_status_moderation_status_decoder() -> Decoder(
  SetModerationStatusModerationStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "published" -> decode.success(SetModerationStatusModerationStatusPublished)
    "heldForReview" ->
      decode.success(SetModerationStatusModerationStatusHeldForReview)
    "likelySpam" ->
      decode.success(SetModerationStatusModerationStatusLikelySpam)
    "rejected" -> decode.success(SetModerationStatusModerationStatusRejected)
    _ ->
      decode.failure(
        SetModerationStatusModerationStatusPublished,
        "a valid SetModerationStatusModerationStatus",
      )
  }
}
