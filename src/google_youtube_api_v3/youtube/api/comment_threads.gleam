//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/comment_thread.{type CommentThread}

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

pub fn insert_request(params: InsertParams, body: CommentThread) -> Request {
  Request(
    http.Post,
    "youtube/v3/commentThreads",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.force-ssl"],
    option.Some(json.to_string(comment_thread.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    all_threads_related_to_channel_id: Option(String),
    channel_id: Option(String),
    id: Option(List(String)),
    max_results: Option(Int),
    moderation_status: Option(ListModerationStatus),
    order: Option(ListOrder),
    page_token: Option(String),
    search_terms: Option(String),
    text_format: Option(ListTextFormat),
    video_id: Option(String),
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

pub fn list_with_video_id(params: ListParams, value: String) -> ListParams {
  ListParams(
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

pub fn list_with_text_format(
  params: ListParams,
  value: ListTextFormat,
) -> ListParams {
  ListParams(
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

pub fn list_with_search_terms(params: ListParams, value: String) -> ListParams {
  ListParams(
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

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
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

pub fn list_with_order(params: ListParams, value: ListOrder) -> ListParams {
  ListParams(
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

pub fn list_with_moderation_status(
  params: ListParams,
  value: ListModerationStatus,
) -> ListParams {
  ListParams(
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

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
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

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
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

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
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

pub fn list_with_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
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

pub fn list_with_all_threads_related_to_channel_id(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
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

pub fn list_request(params: ListParams) -> Request {
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
          #("moderationStatus", list_moderation_status_to_string(v)),
        ]
        option.None -> []
      },
      case params.order {
        option.Some(v) -> [#("order", list_order_to_string(v))]
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
        option.Some(v) -> [#("textFormat", list_text_format_to_string(v))]
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

/// Limits the returned comment threads to those with the specified moderation status. Not compatible with the 'id' filter. Valid values: published, heldForReview, likelySpam.
pub type ListModerationStatus {
  ListModerationStatusPublished
  ListModerationStatusHeldForReview
  ListModerationStatusLikelySpam
  ListModerationStatusRejected
}

pub fn list_moderation_status_to_string(value: ListModerationStatus) -> String {
  case value {
    ListModerationStatusPublished -> "published"
    ListModerationStatusHeldForReview -> "heldForReview"
    ListModerationStatusLikelySpam -> "likelySpam"
    ListModerationStatusRejected -> "rejected"
  }
}

pub fn list_moderation_status_decoder() -> Decoder(ListModerationStatus) {
  use value <- decode.then(decode.string)
  case value {
    "published" -> decode.success(ListModerationStatusPublished)
    "heldForReview" -> decode.success(ListModerationStatusHeldForReview)
    "likelySpam" -> decode.success(ListModerationStatusLikelySpam)
    "rejected" -> decode.success(ListModerationStatusRejected)
    _ ->
      decode.failure(
        ListModerationStatusPublished,
        "a valid ListModerationStatus",
      )
  }
}

pub type ListOrder {
  ListOrderOrderUnspecified
  ListOrderTime
  ListOrderRelevance
}

pub fn list_order_to_string(value: ListOrder) -> String {
  case value {
    ListOrderOrderUnspecified -> "orderUnspecified"
    ListOrderTime -> "time"
    ListOrderRelevance -> "relevance"
  }
}

pub fn list_order_decoder() -> Decoder(ListOrder) {
  use value <- decode.then(decode.string)
  case value {
    "orderUnspecified" -> decode.success(ListOrderOrderUnspecified)
    "time" -> decode.success(ListOrderTime)
    "relevance" -> decode.success(ListOrderRelevance)
    _ -> decode.failure(ListOrderOrderUnspecified, "a valid ListOrder")
  }
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
