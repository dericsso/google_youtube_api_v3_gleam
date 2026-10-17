import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/video.{type Video, type VideoAbuseReport}

/// Retrieves a list of resources, possibly filtered.
pub type VideoAbuseReportReasonsListParams {
  VideoAbuseReportReasonsListParams(part: List(String), hl: Option(String))
}

pub fn video_abuse_report_reasons_list(
  part: List(String),
) -> VideoAbuseReportReasonsListParams {
  VideoAbuseReportReasonsListParams(part, option.None)
}

pub fn video_abuse_report_reasons_list_add_part(
  params: VideoAbuseReportReasonsListParams,
  value: String,
) -> VideoAbuseReportReasonsListParams {
  VideoAbuseReportReasonsListParams(
    list.append(params.part, [value]),
    params.hl,
  )
}

pub fn video_abuse_report_reasons_list_with_hl(
  params: VideoAbuseReportReasonsListParams,
  value: String,
) -> VideoAbuseReportReasonsListParams {
  VideoAbuseReportReasonsListParams(params.part, option.Some(value))
}

pub fn video_abuse_report_reasons_list_request(
  params: VideoAbuseReportReasonsListParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/videoAbuseReportReasons",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
    ],
    option.None,
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type VideoCategoriesListParams {
  VideoCategoriesListParams(
    part: List(String),
    hl: Option(String),
    id: Option(List(String)),
    region_code: Option(String),
  )
}

pub fn video_categories_list(part: List(String)) -> VideoCategoriesListParams {
  VideoCategoriesListParams(part, option.None, option.None, option.None)
}

pub fn video_categories_list_add_part(
  params: VideoCategoriesListParams,
  value: String,
) -> VideoCategoriesListParams {
  VideoCategoriesListParams(
    list.append(params.part, [value]),
    params.hl,
    params.id,
    params.region_code,
  )
}

pub fn video_categories_list_with_region_code(
  params: VideoCategoriesListParams,
  value: String,
) -> VideoCategoriesListParams {
  VideoCategoriesListParams(
    params.part,
    params.hl,
    params.id,
    option.Some(value),
  )
}

pub fn video_categories_list_with_id(
  params: VideoCategoriesListParams,
  value: List(String),
) -> VideoCategoriesListParams {
  VideoCategoriesListParams(
    params.part,
    params.hl,
    option.Some(value),
    params.region_code,
  )
}

pub fn video_categories_list_add_id(
  params: VideoCategoriesListParams,
  value: String,
) -> VideoCategoriesListParams {
  VideoCategoriesListParams(
    params.part,
    params.hl,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.region_code,
  )
}

pub fn video_categories_list_with_hl(
  params: VideoCategoriesListParams,
  value: String,
) -> VideoCategoriesListParams {
  VideoCategoriesListParams(
    params.part,
    option.Some(value),
    params.id,
    params.region_code,
  )
}

pub fn video_categories_list_request(
  params: VideoCategoriesListParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/videoCategories",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.region_code {
        option.Some(v) -> [#("regionCode", v)]
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

/// Returns the trainability status of a video.
pub type VideoTrainabilityGetParams {
  VideoTrainabilityGetParams(id: Option(String))
}

pub fn video_trainability_get() -> VideoTrainabilityGetParams {
  VideoTrainabilityGetParams(option.None)
}

pub fn video_trainability_get_with_id(
  _params: VideoTrainabilityGetParams,
  value: String,
) -> VideoTrainabilityGetParams {
  VideoTrainabilityGetParams(option.Some(value))
}

pub fn video_trainability_get_request(
  params: VideoTrainabilityGetParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/videoTrainability",
    list.flatten([
      case params.id {
        option.Some(v) -> [#("id", v)]
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

/// Retrieves a batch of VideoStat resources, possibly filtered. BatchGetStats is intentionally not atomic to provide a better user experience.
pub type VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(
    id: Option(List(String)),
    on_behalf_of_content_owner: Option(String),
    part: Option(List(String)),
  )
}

pub fn videos_batch_get_stats() -> VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(option.None, option.None, option.None)
}

pub fn videos_batch_get_stats_with_part(
  params: VideosBatchGetStatsParams,
  value: List(String),
) -> VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(
    params.id,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn videos_batch_get_stats_add_part(
  params: VideosBatchGetStatsParams,
  value: String,
) -> VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(
    params.id,
    params.on_behalf_of_content_owner,
    case params.part {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn videos_batch_get_stats_with_on_behalf_of_content_owner(
  params: VideosBatchGetStatsParams,
  value: String,
) -> VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(params.id, option.Some(value), params.part)
}

pub fn videos_batch_get_stats_with_id(
  params: VideosBatchGetStatsParams,
  value: List(String),
) -> VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.part,
  )
}

pub fn videos_batch_get_stats_add_id(
  params: VideosBatchGetStatsParams,
  value: String,
) -> VideosBatchGetStatsParams {
  VideosBatchGetStatsParams(
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.on_behalf_of_content_owner,
    params.part,
  )
}

pub fn videos_batch_get_stats_request(
  params: VideosBatchGetStatsParams,
) -> Request {
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
pub type VideosDeleteParams {
  VideosDeleteParams(id: String, on_behalf_of_content_owner: Option(String))
}

pub fn videos_delete(id: String) -> VideosDeleteParams {
  VideosDeleteParams(id, option.None)
}

pub fn videos_delete_with_on_behalf_of_content_owner(
  params: VideosDeleteParams,
  value: String,
) -> VideosDeleteParams {
  VideosDeleteParams(params.id, option.Some(value))
}

pub fn videos_delete_request(params: VideosDeleteParams) -> Request {
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
pub type VideosGetRatingParams {
  VideosGetRatingParams(
    id: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn videos_get_rating(id: List(String)) -> VideosGetRatingParams {
  VideosGetRatingParams(id, option.None)
}

pub fn videos_get_rating_add_id(
  params: VideosGetRatingParams,
  value: String,
) -> VideosGetRatingParams {
  VideosGetRatingParams(
    list.append(params.id, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn videos_get_rating_with_on_behalf_of_content_owner(
  params: VideosGetRatingParams,
  value: String,
) -> VideosGetRatingParams {
  VideosGetRatingParams(params.id, option.Some(value))
}

pub fn videos_get_rating_request(params: VideosGetRatingParams) -> Request {
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
pub type VideosInsertParams {
  VideosInsertParams(
    part: List(String),
    auto_levels: Option(Bool),
    notify_subscribers: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    stabilize: Option(Bool),
  )
}

pub fn videos_insert(part: List(String)) -> VideosInsertParams {
  VideosInsertParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn videos_insert_add_part(
  params: VideosInsertParams,
  value: String,
) -> VideosInsertParams {
  VideosInsertParams(
    list.append(params.part, [value]),
    params.auto_levels,
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn videos_insert_with_stabilize(
  params: VideosInsertParams,
  value: Bool,
) -> VideosInsertParams {
  VideosInsertParams(
    params.part,
    params.auto_levels,
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn videos_insert_with_on_behalf_of_content_owner_channel(
  params: VideosInsertParams,
  value: String,
) -> VideosInsertParams {
  VideosInsertParams(
    params.part,
    params.auto_levels,
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.stabilize,
  )
}

pub fn videos_insert_with_on_behalf_of_content_owner(
  params: VideosInsertParams,
  value: String,
) -> VideosInsertParams {
  VideosInsertParams(
    params.part,
    params.auto_levels,
    params.notify_subscribers,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn videos_insert_with_notify_subscribers(
  params: VideosInsertParams,
  value: Bool,
) -> VideosInsertParams {
  VideosInsertParams(
    params.part,
    params.auto_levels,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn videos_insert_with_auto_levels(
  params: VideosInsertParams,
  value: Bool,
) -> VideosInsertParams {
  VideosInsertParams(
    params.part,
    option.Some(value),
    params.notify_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stabilize,
  )
}

pub fn videos_insert_request(
  params: VideosInsertParams,
  body: Video,
) -> Request {
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
    option.Some(json.to_string(video.video_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type VideosListParams {
  VideosListParams(
    part: List(String),
    chart: Option(VideosListChart),
    hl: Option(String),
    id: Option(List(String)),
    locale: Option(String),
    max_height: Option(Int),
    max_results: Option(Int),
    max_width: Option(Int),
    my_rating: Option(VideosListMyRating),
    on_behalf_of_content_owner: Option(String),
    page_token: Option(String),
    region_code: Option(String),
    video_category_id: Option(String),
  )
}

pub fn videos_list(part: List(String)) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_add_part(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_video_category_id(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_region_code(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_page_token(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_on_behalf_of_content_owner(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_my_rating(
  params: VideosListParams,
  value: VideosListMyRating,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_max_width(
  params: VideosListParams,
  value: Int,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_max_results(
  params: VideosListParams,
  value: Int,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_max_height(
  params: VideosListParams,
  value: Int,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_locale(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_id(
  params: VideosListParams,
  value: List(String),
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_add_id(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_hl(
  params: VideosListParams,
  value: String,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_with_chart(
  params: VideosListParams,
  value: VideosListChart,
) -> VideosListParams {
  VideosListParams(
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

pub fn videos_list_request(params: VideosListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/videos",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.chart {
        option.Some(v) -> [#("chart", videos_list_chart_to_string(v))]
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
        option.Some(v) -> [#("myRating", videos_list_my_rating_to_string(v))]
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
pub type VideosRateParams {
  VideosRateParams(id: String, rating: VideosRateRating)
}

pub fn videos_rate(id: String, rating: VideosRateRating) -> VideosRateParams {
  VideosRateParams(id, rating)
}

pub fn videos_rate_request(params: VideosRateParams) -> Request {
  Request(
    http.Post,
    "youtube/v3/videos/rate",
    list.flatten([
      [#("id", params.id)],
      [#("rating", videos_rate_rating_to_string(params.rating))],
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
pub type VideosReportAbuseParams {
  VideosReportAbuseParams(on_behalf_of_content_owner: Option(String))
}

pub fn videos_report_abuse() -> VideosReportAbuseParams {
  VideosReportAbuseParams(option.None)
}

pub fn videos_report_abuse_with_on_behalf_of_content_owner(
  _params: VideosReportAbuseParams,
  value: String,
) -> VideosReportAbuseParams {
  VideosReportAbuseParams(option.Some(value))
}

pub fn videos_report_abuse_request(
  params: VideosReportAbuseParams,
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
    option.Some(json.to_string(video.video_abuse_report_to_json(body))),
  )
}

/// Updates an existing resource.
pub type VideosUpdateParams {
  VideosUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn videos_update(part: List(String)) -> VideosUpdateParams {
  VideosUpdateParams(part, option.None)
}

pub fn videos_update_add_part(
  params: VideosUpdateParams,
  value: String,
) -> VideosUpdateParams {
  VideosUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn videos_update_with_on_behalf_of_content_owner(
  params: VideosUpdateParams,
  value: String,
) -> VideosUpdateParams {
  VideosUpdateParams(params.part, option.Some(value))
}

pub fn videos_update_request(
  params: VideosUpdateParams,
  body: Video,
) -> Request {
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
    option.Some(json.to_string(video.video_to_json(body))),
  )
}

/// Return the videos that are in the specified chart.
pub type VideosListChart {
  VideosListChartChartUnspecified
  VideosListChartMostPopular
}

pub fn videos_list_chart_to_string(value: VideosListChart) -> String {
  case value {
    VideosListChartChartUnspecified -> "chartUnspecified"
    VideosListChartMostPopular -> "mostPopular"
  }
}

pub fn videos_list_chart_decoder() -> Decoder(VideosListChart) {
  use value <- decode.then(decode.string)
  case value {
    "chartUnspecified" -> decode.success(VideosListChartChartUnspecified)
    "mostPopular" -> decode.success(VideosListChartMostPopular)
    _ ->
      decode.failure(VideosListChartChartUnspecified, "a valid VideosListChart")
  }
}

/// Return videos liked/disliked by the authenticated user. Does not support RateType.RATED_TYPE_NONE.
pub type VideosListMyRating {
  VideosListMyRatingNone
  VideosListMyRatingLike
  VideosListMyRatingDislike
}

pub fn videos_list_my_rating_to_string(value: VideosListMyRating) -> String {
  case value {
    VideosListMyRatingNone -> "none"
    VideosListMyRatingLike -> "like"
    VideosListMyRatingDislike -> "dislike"
  }
}

pub fn videos_list_my_rating_decoder() -> Decoder(VideosListMyRating) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(VideosListMyRatingNone)
    "like" -> decode.success(VideosListMyRatingLike)
    "dislike" -> decode.success(VideosListMyRatingDislike)
    _ -> decode.failure(VideosListMyRatingNone, "a valid VideosListMyRating")
  }
}

pub type VideosRateRating {
  VideosRateRatingNone
  VideosRateRatingLike
  VideosRateRatingDislike
}

pub fn videos_rate_rating_to_string(value: VideosRateRating) -> String {
  case value {
    VideosRateRatingNone -> "none"
    VideosRateRatingLike -> "like"
    VideosRateRatingDislike -> "dislike"
  }
}

pub fn videos_rate_rating_decoder() -> Decoder(VideosRateRating) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(VideosRateRatingNone)
    "like" -> decode.success(VideosRateRatingLike)
    "dislike" -> decode.success(VideosRateRatingDislike)
    _ -> decode.failure(VideosRateRatingNone, "a valid VideosRateRating")
  }
}
