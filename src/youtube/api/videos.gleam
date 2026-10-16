//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import youtube/video.{type Video}
import youtube/video_abuse_report.{type VideoAbuseReport}

/// Retrieves a batch of VideoStat resources, possibly filtered. BatchGetStats is intentionally not atomic to provide a better user experience.
pub type BatchGetStatsParams {
  BatchGetStatsParams(
    id: Option(List(String)),
    on_behalf_of_content_owner: Option(String),
    part: Option(List(String)),
  )
}

pub fn batch_get_stats() -> BatchGetStatsParams {
  BatchGetStatsParams(option.None, option.None, option.None)
}

pub fn batch_get_stats_with_part(
  params: BatchGetStatsParams,
  value: List(String),
) -> BatchGetStatsParams {
  BatchGetStatsParams(
    params.id,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn batch_get_stats_add_part(
  params: BatchGetStatsParams,
  value: String,
) -> BatchGetStatsParams {
  BatchGetStatsParams(
    params.id,
    params.on_behalf_of_content_owner,
    case params.part {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn batch_get_stats_with_on_behalf_of_content_owner(
  params: BatchGetStatsParams,
  value: String,
) -> BatchGetStatsParams {
  BatchGetStatsParams(params.id, option.Some(value), params.part)
}

pub fn batch_get_stats_with_id(
  params: BatchGetStatsParams,
  value: List(String),
) -> BatchGetStatsParams {
  BatchGetStatsParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.part,
  )
}

pub fn batch_get_stats_add_id(
  params: BatchGetStatsParams,
  value: String,
) -> BatchGetStatsParams {
  BatchGetStatsParams(
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.on_behalf_of_content_owner,
    params.part,
  )
}

pub fn batch_get_stats_request(params: BatchGetStatsParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/videos:batchGetStats",
    list.flatten([
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.part {
        option.Some(v) -> list.map(v, fn(w) { #("part", w) })
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Deletes a resource.
pub type DeleteParams {
  DeleteParams(id: String, on_behalf_of_content_owner: Option(String))
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id, option.None)
}

pub fn delete_with_on_behalf_of_content_owner(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(params.id, option.Some(value))
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/videos",
    list.flatten([
      [#("id", params.id)],
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Retrieves the ratings that the authorized user gave to a list of specified videos.
pub type GetRatingParams {
  GetRatingParams(id: List(String), on_behalf_of_content_owner: Option(String))
}

pub fn get_rating(id: List(String)) -> GetRatingParams {
  GetRatingParams(id, option.None)
}

pub fn get_rating_add_id(
  params: GetRatingParams,
  value: String,
) -> GetRatingParams {
  GetRatingParams(
    list.append(params.id, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn get_rating_with_on_behalf_of_content_owner(
  params: GetRatingParams,
  value: String,
) -> GetRatingParams {
  GetRatingParams(params.id, option.Some(value))
}

pub fn get_rating_request(params: GetRatingParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/videos/getRating",
    list.flatten([
      list.map(params.id, fn(v) { #("id", v) }),
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Inserts a new resource into this collection.
pub type InsertParams {
  InsertParams(
    part: List(String),
    auto_levels: Option(Bool),
    notify_subscribers: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    stabilize: Option(Bool),
  )
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    list.append(params.part, [value]),
    params.auto_levels,
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn insert_with_stabilize(
  params: InsertParams,
  value: Bool,
) -> InsertParams {
  InsertParams(
    params.part,
    params.auto_levels,
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn insert_with_on_behalf_of_content_owner_channel(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.part,
    params.auto_levels,
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.stabilize,
  )
}

pub fn insert_with_on_behalf_of_content_owner(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.part,
    params.auto_levels,
    params.notify_subscribers,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn insert_with_notify_subscribers(
  params: InsertParams,
  value: Bool,
) -> InsertParams {
  InsertParams(
    params.part,
    params.auto_levels,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn insert_with_auto_levels(
  params: InsertParams,
  value: Bool,
) -> InsertParams {
  InsertParams(
    params.part,
    option.Some(value),
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn insert_request(params: InsertParams, body: Video) -> Request {
  Request(
    http.Post,
    "youtube/v3/videos",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.auto_levels {
        option.Some(v) -> [#("autoLevels", bool.to_string(v))]
        option.None -> []
      },
      case params.notify_subscribers {
        option.Some(v) -> [#("notifySubscribers", bool.to_string(v))]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner_channel {
        option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
        option.None -> []
      },
      case params.stabilize {
        option.Some(v) -> [#("stabilize", bool.to_string(v))]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.upload",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(video.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    chart: Option(ListChart),
    hl: Option(String),
    id: Option(List(String)),
    locale: Option(String),
    max_height: Option(Int),
    max_results: Option(Int),
    max_width: Option(Int),
    my_rating: Option(ListMyRating),
    on_behalf_of_content_owner: Option(String),
    page_token: Option(String),
    region_code: Option(String),
    video_category_id: Option(String),
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
    option.None,
    option.None,
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_video_category_id(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    option.Some(value),
  )
}

pub fn list_with_region_code(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    option.Some(value),
    params.video_category_id,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_on_behalf_of_content_owner(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    option.Some(value),
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_my_rating(
  params: ListParams,
  value: ListMyRating,
) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_max_width(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    option.Some(value),
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    option.Some(value),
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_max_height(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    params.locale,
    option.Some(value),
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_locale(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    params.id,
    option.Some(value),
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    option.Some(value),
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    params.hl,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_hl(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.chart,
    option.Some(value),
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_with_chart(params: ListParams, value: ListChart) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.hl,
    params.id,
    params.locale,
    params.max_height,
    params.max_results,
    params.max_width,
    params.my_rating,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.region_code,
    params.video_category_id,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/videos",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.chart {
        option.Some(v) -> [#("chart", list_chart_to_string(v))]
        option.None -> []
      },
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.locale {
        option.Some(v) -> [#("locale", v)]
        option.None -> []
      },
      case params.max_height {
        option.Some(v) -> [#("maxHeight", int.to_string(v))]
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.max_width {
        option.Some(v) -> [#("maxWidth", int.to_string(v))]
        option.None -> []
      },
      case params.my_rating {
        option.Some(v) -> [#("myRating", list_my_rating_to_string(v))]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.page_token {
        option.Some(v) -> [#("pageToken", v)]
        option.None -> []
      },
      case params.region_code {
        option.Some(v) -> [#("regionCode", v)]
        option.None -> []
      },
      case params.video_category_id {
        option.Some(v) -> [#("videoCategoryId", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Adds a like or dislike rating to a video or removes a rating from a video.
pub type RateParams {
  RateParams(id: String, rating: RateRating)
}

pub fn rate(id: String, rating: RateRating) -> RateParams {
  RateParams(id, rating)
}

pub fn rate_request(params: RateParams) -> Request {
  Request(
    http.Post,
    "youtube/v3/videos/rate",
    list.flatten([
      [#("id", params.id)],
      [#("rating", rate_rating_to_string(params.rating))],
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Report abuse for a video.
pub type ReportAbuseParams {
  ReportAbuseParams(on_behalf_of_content_owner: Option(String))
}

pub fn report_abuse() -> ReportAbuseParams {
  ReportAbuseParams(option.None)
}

pub fn report_abuse_with_on_behalf_of_content_owner(
  _params: ReportAbuseParams,
  value: String,
) -> ReportAbuseParams {
  ReportAbuseParams(option.Some(value))
}

pub fn report_abuse_request(
  params: ReportAbuseParams,
  body: VideoAbuseReport,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/videos/reportAbuse",
    list.flatten([
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(video_abuse_report.to_json(body))),
  )
}

/// Updates an existing resource.
pub type UpdateParams {
  UpdateParams(part: List(String), on_behalf_of_content_owner: Option(String))
}

pub fn update(part: List(String)) -> UpdateParams {
  UpdateParams(part, option.None)
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn update_with_on_behalf_of_content_owner(
  params: UpdateParams,
  value: String,
) -> UpdateParams {
  UpdateParams(params.part, option.Some(value))
}

pub fn update_request(params: UpdateParams, body: Video) -> Request {
  Request(
    http.Put,
    "youtube/v3/videos",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(video.to_json(body))),
  )
}

/// Return the videos that are in the specified chart.
pub type ListChart {
  ListChartChartUnspecified
  ListChartMostPopular
}

pub fn list_chart_to_string(value: ListChart) -> String {
  case value {
    ListChartChartUnspecified -> "chartUnspecified"
    ListChartMostPopular -> "mostPopular"
  }
}

pub fn list_chart_decoder() -> Decoder(ListChart) {
  use value <- decode.then(decode.string)
  case value {
    "chartUnspecified" -> decode.success(ListChartChartUnspecified)
    "mostPopular" -> decode.success(ListChartMostPopular)
    _ -> decode.failure(ListChartChartUnspecified, "a valid ListChart")
  }
}

/// Return videos liked/disliked by the authenticated user. Does not support RateType.RATED_TYPE_NONE.
pub type ListMyRating {
  ListMyRatingNone
  ListMyRatingLike
  ListMyRatingDislike
}

pub fn list_my_rating_to_string(value: ListMyRating) -> String {
  case value {
    ListMyRatingNone -> "none"
    ListMyRatingLike -> "like"
    ListMyRatingDislike -> "dislike"
  }
}

pub fn list_my_rating_decoder() -> Decoder(ListMyRating) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(ListMyRatingNone)
    "like" -> decode.success(ListMyRatingLike)
    "dislike" -> decode.success(ListMyRatingDislike)
    _ -> decode.failure(ListMyRatingNone, "a valid ListMyRating")
  }
}

pub type RateRating {
  RateRatingNone
  RateRatingLike
  RateRatingDislike
}

pub fn rate_rating_to_string(value: RateRating) -> String {
  case value {
    RateRatingNone -> "none"
    RateRatingLike -> "like"
    RateRatingDislike -> "dislike"
  }
}

pub fn rate_rating_decoder() -> Decoder(RateRating) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(RateRatingNone)
    "like" -> decode.success(RateRatingLike)
    "dislike" -> decode.success(RateRatingDislike)
    _ -> decode.failure(RateRatingNone, "a valid RateRating")
  }
}
