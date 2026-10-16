//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of search resources
pub type ListParams {
  ListParams(
    part: List(String),
    channel_id: Option(String),
    channel_type: Option(ListChannelType),
    event_type: Option(ListEventType),
    for_content_owner: Option(Bool),
    for_developer: Option(Bool),
    for_mine: Option(Bool),
    location: Option(String),
    location_radius: Option(String),
    max_results: Option(Int),
    on_behalf_of_content_owner: Option(String),
    order: Option(ListOrder),
    page_token: Option(String),
    published_after: Option(String),
    published_before: Option(String),
    q: Option(String),
    region_code: Option(String),
    relevance_language: Option(String),
    safe_search: Option(ListSafeSearch),
    topic_id: Option(String),
    type_: Option(List(String)),
    video_caption: Option(ListVideoCaption),
    video_category_id: Option(String),
    video_definition: Option(ListVideoDefinition),
    video_dimension: Option(ListVideoDimension),
    video_duration: Option(ListVideoDuration),
    video_embeddable: Option(ListVideoEmbeddable),
    video_license: Option(ListVideoLicense),
    video_paid_product_placement: Option(ListVideoPaidProductPlacement),
    video_syndicated: Option(ListVideoSyndicated),
    video_type: Option(ListVideoType),
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
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_type(
  params: ListParams,
  value: ListVideoType,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    option.Some(value),
  )
}

pub fn list_with_video_syndicated(
  params: ListParams,
  value: ListVideoSyndicated,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    option.Some(value),
    params.video_type,
  )
}

pub fn list_with_video_paid_product_placement(
  params: ListParams,
  value: ListVideoPaidProductPlacement,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    option.Some(value),
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_license(
  params: ListParams,
  value: ListVideoLicense,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    option.Some(value),
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_embeddable(
  params: ListParams,
  value: ListVideoEmbeddable,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    option.Some(value),
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_duration(
  params: ListParams,
  value: ListVideoDuration,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    option.Some(value),
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_dimension(
  params: ListParams,
  value: ListVideoDimension,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    option.Some(value),
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_definition(
  params: ListParams,
  value: ListVideoDefinition,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    option.Some(value),
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_category_id(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    option.Some(value),
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_video_caption(
  params: ListParams,
  value: ListVideoCaption,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    option.Some(value),
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_type_(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    option.Some(value),
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_add_type_(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    case params.type_ {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_topic_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    option.Some(value),
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_safe_search(
  params: ListParams,
  value: ListSafeSearch,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    option.Some(value),
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_relevance_language(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    option.Some(value),
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_region_code(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    option.Some(value),
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_q(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    option.Some(value),
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_published_before(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    option.Some(value),
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_published_after(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    option.Some(value),
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    option.Some(value),
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_order(params: ListParams, value: ListOrder) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_on_behalf_of_content_owner(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    option.Some(value),
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_location_radius(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    option.Some(value),
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_location(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    option.Some(value),
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_for_mine(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    option.Some(value),
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_for_developer(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    option.Some(value),
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_for_content_owner(
  params: ListParams,
  value: Bool,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    params.event_type,
    option.Some(value),
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_event_type(
  params: ListParams,
  value: ListEventType,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.channel_type,
    option.Some(value),
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_channel_type(
  params: ListParams,
  value: ListChannelType,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    option.Some(value),
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_with_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.channel_type,
    params.event_type,
    params.for_content_owner,
    params.for_developer,
    params.for_mine,
    params.location,
    params.location_radius,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.order,
    params.page_token,
    params.published_after,
    params.published_before,
    params.q,
    params.region_code,
    params.relevance_language,
    params.safe_search,
    params.topic_id,
    params.type_,
    params.video_caption,
    params.video_category_id,
    params.video_definition,
    params.video_dimension,
    params.video_duration,
    params.video_embeddable,
    params.video_license,
    params.video_paid_product_placement,
    params.video_syndicated,
    params.video_type,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/search",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.channel_id {
        option.Some(v) -> [#("channelId", v)]
        option.None -> []
      },
      case params.channel_type {
        option.Some(v) -> [#("channelType", list_channel_type_to_string(v))]
        option.None -> []
      },
      case params.event_type {
        option.Some(v) -> [#("eventType", list_event_type_to_string(v))]
        option.None -> []
      },
      case params.for_content_owner {
        option.Some(v) -> [#("forContentOwner", bool.to_string(v))]
        option.None -> []
      },
      case params.for_developer {
        option.Some(v) -> [#("forDeveloper", bool.to_string(v))]
        option.None -> []
      },
      case params.for_mine {
        option.Some(v) -> [#("forMine", bool.to_string(v))]
        option.None -> []
      },
      case params.location {
        option.Some(v) -> [#("location", v)]
        option.None -> []
      },
      case params.location_radius {
        option.Some(v) -> [#("locationRadius", v)]
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
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
      case params.published_after {
        option.Some(v) -> [#("publishedAfter", v)]
        option.None -> []
      },
      case params.published_before {
        option.Some(v) -> [#("publishedBefore", v)]
        option.None -> []
      },
      case params.q {
        option.Some(v) -> [#("q", v)]
        option.None -> []
      },
      case params.region_code {
        option.Some(v) -> [#("regionCode", v)]
        option.None -> []
      },
      case params.relevance_language {
        option.Some(v) -> [#("relevanceLanguage", v)]
        option.None -> []
      },
      case params.safe_search {
        option.Some(v) -> [#("safeSearch", list_safe_search_to_string(v))]
        option.None -> []
      },
      case params.topic_id {
        option.Some(v) -> [#("topicId", v)]
        option.None -> []
      },
      case params.type_ {
        option.Some(v) -> list.map(v, fn(w) { #("type", w) })
        option.None -> []
      },
      case params.video_caption {
        option.Some(v) -> [#("videoCaption", list_video_caption_to_string(v))]
        option.None -> []
      },
      case params.video_category_id {
        option.Some(v) -> [#("videoCategoryId", v)]
        option.None -> []
      },
      case params.video_definition {
        option.Some(v) -> [
          #("videoDefinition", list_video_definition_to_string(v)),
        ]
        option.None -> []
      },
      case params.video_dimension {
        option.Some(v) -> [
          #("videoDimension", list_video_dimension_to_string(v)),
        ]
        option.None -> []
      },
      case params.video_duration {
        option.Some(v) -> [
          #("videoDuration", list_video_duration_to_string(v)),
        ]
        option.None -> []
      },
      case params.video_embeddable {
        option.Some(v) -> [
          #("videoEmbeddable", list_video_embeddable_to_string(v)),
        ]
        option.None -> []
      },
      case params.video_license {
        option.Some(v) -> [#("videoLicense", list_video_license_to_string(v))]
        option.None -> []
      },
      case params.video_paid_product_placement {
        option.Some(v) -> [
          #(
            "videoPaidProductPlacement",
            list_video_paid_product_placement_to_string(v),
          ),
        ]
        option.None -> []
      },
      case params.video_syndicated {
        option.Some(v) -> [
          #("videoSyndicated", list_video_syndicated_to_string(v)),
        ]
        option.None -> []
      },
      case params.video_type {
        option.Some(v) -> [#("videoType", list_video_type_to_string(v))]
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

/// Add a filter on the channel search.
pub type ListChannelType {
  ListChannelTypeChannelTypeUnspecified
  ListChannelTypeAny
  ListChannelTypeShow
}

pub fn list_channel_type_to_string(value: ListChannelType) -> String {
  case value {
    ListChannelTypeChannelTypeUnspecified -> "channelTypeUnspecified"
    ListChannelTypeAny -> "any"
    ListChannelTypeShow -> "show"
  }
}

pub fn list_channel_type_decoder() -> Decoder(ListChannelType) {
  use value <- decode.then(decode.string)
  case value {
    "channelTypeUnspecified" ->
      decode.success(ListChannelTypeChannelTypeUnspecified)
    "any" -> decode.success(ListChannelTypeAny)
    "show" -> decode.success(ListChannelTypeShow)
    _ ->
      decode.failure(
        ListChannelTypeChannelTypeUnspecified,
        "a valid ListChannelType",
      )
  }
}

/// Filter on the livestream status of the videos.
pub type ListEventType {
  ListEventTypeNone
  ListEventTypeUpcoming
  ListEventTypeLive
  ListEventTypeCompleted
}

pub fn list_event_type_to_string(value: ListEventType) -> String {
  case value {
    ListEventTypeNone -> "none"
    ListEventTypeUpcoming -> "upcoming"
    ListEventTypeLive -> "live"
    ListEventTypeCompleted -> "completed"
  }
}

pub fn list_event_type_decoder() -> Decoder(ListEventType) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(ListEventTypeNone)
    "upcoming" -> decode.success(ListEventTypeUpcoming)
    "live" -> decode.success(ListEventTypeLive)
    "completed" -> decode.success(ListEventTypeCompleted)
    _ -> decode.failure(ListEventTypeNone, "a valid ListEventType")
  }
}

/// Sort order of the results.
pub type ListOrder {
  ListOrderSearchSortUnspecified
  ListOrderDate
  ListOrderRating
  ListOrderViewCount
  ListOrderRelevance
  ListOrderTitle
  ListOrderVideoCount
}

pub fn list_order_to_string(value: ListOrder) -> String {
  case value {
    ListOrderSearchSortUnspecified -> "searchSortUnspecified"
    ListOrderDate -> "date"
    ListOrderRating -> "rating"
    ListOrderViewCount -> "viewCount"
    ListOrderRelevance -> "relevance"
    ListOrderTitle -> "title"
    ListOrderVideoCount -> "videoCount"
  }
}

pub fn list_order_decoder() -> Decoder(ListOrder) {
  use value <- decode.then(decode.string)
  case value {
    "searchSortUnspecified" -> decode.success(ListOrderSearchSortUnspecified)
    "date" -> decode.success(ListOrderDate)
    "rating" -> decode.success(ListOrderRating)
    "viewCount" -> decode.success(ListOrderViewCount)
    "relevance" -> decode.success(ListOrderRelevance)
    "title" -> decode.success(ListOrderTitle)
    "videoCount" -> decode.success(ListOrderVideoCount)
    _ -> decode.failure(ListOrderSearchSortUnspecified, "a valid ListOrder")
  }
}

/// Indicates whether the search results should include restricted content as well as standard content.
pub type ListSafeSearch {
  ListSafeSearchSafeSearchSettingUnspecified
  ListSafeSearchNone
  ListSafeSearchModerate
  ListSafeSearchStrict
}

pub fn list_safe_search_to_string(value: ListSafeSearch) -> String {
  case value {
    ListSafeSearchSafeSearchSettingUnspecified -> "safeSearchSettingUnspecified"
    ListSafeSearchNone -> "none"
    ListSafeSearchModerate -> "moderate"
    ListSafeSearchStrict -> "strict"
  }
}

pub fn list_safe_search_decoder() -> Decoder(ListSafeSearch) {
  use value <- decode.then(decode.string)
  case value {
    "safeSearchSettingUnspecified" ->
      decode.success(ListSafeSearchSafeSearchSettingUnspecified)
    "none" -> decode.success(ListSafeSearchNone)
    "moderate" -> decode.success(ListSafeSearchModerate)
    "strict" -> decode.success(ListSafeSearchStrict)
    _ ->
      decode.failure(
        ListSafeSearchSafeSearchSettingUnspecified,
        "a valid ListSafeSearch",
      )
  }
}

/// Filter on the presence of captions on the videos.
pub type ListVideoCaption {
  ListVideoCaptionVideoCaptionUnspecified
  ListVideoCaptionAny
  ListVideoCaptionClosedCaption
  ListVideoCaptionNone
}

pub fn list_video_caption_to_string(value: ListVideoCaption) -> String {
  case value {
    ListVideoCaptionVideoCaptionUnspecified -> "videoCaptionUnspecified"
    ListVideoCaptionAny -> "any"
    ListVideoCaptionClosedCaption -> "closedCaption"
    ListVideoCaptionNone -> "none"
  }
}

pub fn list_video_caption_decoder() -> Decoder(ListVideoCaption) {
  use value <- decode.then(decode.string)
  case value {
    "videoCaptionUnspecified" ->
      decode.success(ListVideoCaptionVideoCaptionUnspecified)
    "any" -> decode.success(ListVideoCaptionAny)
    "closedCaption" -> decode.success(ListVideoCaptionClosedCaption)
    "none" -> decode.success(ListVideoCaptionNone)
    _ ->
      decode.failure(
        ListVideoCaptionVideoCaptionUnspecified,
        "a valid ListVideoCaption",
      )
  }
}

/// Filter on the definition of the videos.
pub type ListVideoDefinition {
  ListVideoDefinitionAny
  ListVideoDefinitionStandard
  ListVideoDefinitionHigh
}

pub fn list_video_definition_to_string(value: ListVideoDefinition) -> String {
  case value {
    ListVideoDefinitionAny -> "any"
    ListVideoDefinitionStandard -> "standard"
    ListVideoDefinitionHigh -> "high"
  }
}

pub fn list_video_definition_decoder() -> Decoder(ListVideoDefinition) {
  use value <- decode.then(decode.string)
  case value {
    "any" -> decode.success(ListVideoDefinitionAny)
    "standard" -> decode.success(ListVideoDefinitionStandard)
    "high" -> decode.success(ListVideoDefinitionHigh)
    _ -> decode.failure(ListVideoDefinitionAny, "a valid ListVideoDefinition")
  }
}

/// Filter on 3d videos.
pub type ListVideoDimension {
  ListVideoDimensionAny
  ListVideoDimensionValue2d
  ListVideoDimensionValue3d
}

pub fn list_video_dimension_to_string(value: ListVideoDimension) -> String {
  case value {
    ListVideoDimensionAny -> "any"
    ListVideoDimensionValue2d -> "2d"
    ListVideoDimensionValue3d -> "3d"
  }
}

pub fn list_video_dimension_decoder() -> Decoder(ListVideoDimension) {
  use value <- decode.then(decode.string)
  case value {
    "any" -> decode.success(ListVideoDimensionAny)
    "2d" -> decode.success(ListVideoDimensionValue2d)
    "3d" -> decode.success(ListVideoDimensionValue3d)
    _ -> decode.failure(ListVideoDimensionAny, "a valid ListVideoDimension")
  }
}

/// Filter on the duration of the videos.
pub type ListVideoDuration {
  ListVideoDurationVideoDurationUnspecified
  ListVideoDurationAny
  ListVideoDurationShort
  ListVideoDurationMedium
  ListVideoDurationLong
}

pub fn list_video_duration_to_string(value: ListVideoDuration) -> String {
  case value {
    ListVideoDurationVideoDurationUnspecified -> "videoDurationUnspecified"
    ListVideoDurationAny -> "any"
    ListVideoDurationShort -> "short"
    ListVideoDurationMedium -> "medium"
    ListVideoDurationLong -> "long"
  }
}

pub fn list_video_duration_decoder() -> Decoder(ListVideoDuration) {
  use value <- decode.then(decode.string)
  case value {
    "videoDurationUnspecified" ->
      decode.success(ListVideoDurationVideoDurationUnspecified)
    "any" -> decode.success(ListVideoDurationAny)
    "short" -> decode.success(ListVideoDurationShort)
    "medium" -> decode.success(ListVideoDurationMedium)
    "long" -> decode.success(ListVideoDurationLong)
    _ ->
      decode.failure(
        ListVideoDurationVideoDurationUnspecified,
        "a valid ListVideoDuration",
      )
  }
}

/// Filter on embeddable videos.
pub type ListVideoEmbeddable {
  ListVideoEmbeddableVideoEmbeddableUnspecified
  ListVideoEmbeddableAny
  ListVideoEmbeddableTrue
}

pub fn list_video_embeddable_to_string(value: ListVideoEmbeddable) -> String {
  case value {
    ListVideoEmbeddableVideoEmbeddableUnspecified ->
      "videoEmbeddableUnspecified"
    ListVideoEmbeddableAny -> "any"
    ListVideoEmbeddableTrue -> "true"
  }
}

pub fn list_video_embeddable_decoder() -> Decoder(ListVideoEmbeddable) {
  use value <- decode.then(decode.string)
  case value {
    "videoEmbeddableUnspecified" ->
      decode.success(ListVideoEmbeddableVideoEmbeddableUnspecified)
    "any" -> decode.success(ListVideoEmbeddableAny)
    "true" -> decode.success(ListVideoEmbeddableTrue)
    _ ->
      decode.failure(
        ListVideoEmbeddableVideoEmbeddableUnspecified,
        "a valid ListVideoEmbeddable",
      )
  }
}

/// Filter on the license of the videos.
pub type ListVideoLicense {
  ListVideoLicenseAny
  ListVideoLicenseYoutube
  ListVideoLicenseCreativeCommon
}

pub fn list_video_license_to_string(value: ListVideoLicense) -> String {
  case value {
    ListVideoLicenseAny -> "any"
    ListVideoLicenseYoutube -> "youtube"
    ListVideoLicenseCreativeCommon -> "creativeCommon"
  }
}

pub fn list_video_license_decoder() -> Decoder(ListVideoLicense) {
  use value <- decode.then(decode.string)
  case value {
    "any" -> decode.success(ListVideoLicenseAny)
    "youtube" -> decode.success(ListVideoLicenseYoutube)
    "creativeCommon" -> decode.success(ListVideoLicenseCreativeCommon)
    _ -> decode.failure(ListVideoLicenseAny, "a valid ListVideoLicense")
  }
}

pub type ListVideoPaidProductPlacement {
  ListVideoPaidProductPlacementVideoPaidProductPlacementUnspecified
  ListVideoPaidProductPlacementAny
  ListVideoPaidProductPlacementTrue
}

pub fn list_video_paid_product_placement_to_string(
  value: ListVideoPaidProductPlacement,
) -> String {
  case value {
    ListVideoPaidProductPlacementVideoPaidProductPlacementUnspecified ->
      "videoPaidProductPlacementUnspecified"
    ListVideoPaidProductPlacementAny -> "any"
    ListVideoPaidProductPlacementTrue -> "true"
  }
}

pub fn list_video_paid_product_placement_decoder() -> Decoder(
  ListVideoPaidProductPlacement,
) {
  use value <- decode.then(decode.string)
  case value {
    "videoPaidProductPlacementUnspecified" ->
      decode.success(
        ListVideoPaidProductPlacementVideoPaidProductPlacementUnspecified,
      )
    "any" -> decode.success(ListVideoPaidProductPlacementAny)
    "true" -> decode.success(ListVideoPaidProductPlacementTrue)
    _ ->
      decode.failure(
        ListVideoPaidProductPlacementVideoPaidProductPlacementUnspecified,
        "a valid ListVideoPaidProductPlacement",
      )
  }
}

/// Filter on syndicated videos.
pub type ListVideoSyndicated {
  ListVideoSyndicatedVideoSyndicatedUnspecified
  ListVideoSyndicatedAny
  ListVideoSyndicatedTrue
}

pub fn list_video_syndicated_to_string(value: ListVideoSyndicated) -> String {
  case value {
    ListVideoSyndicatedVideoSyndicatedUnspecified ->
      "videoSyndicatedUnspecified"
    ListVideoSyndicatedAny -> "any"
    ListVideoSyndicatedTrue -> "true"
  }
}

pub fn list_video_syndicated_decoder() -> Decoder(ListVideoSyndicated) {
  use value <- decode.then(decode.string)
  case value {
    "videoSyndicatedUnspecified" ->
      decode.success(ListVideoSyndicatedVideoSyndicatedUnspecified)
    "any" -> decode.success(ListVideoSyndicatedAny)
    "true" -> decode.success(ListVideoSyndicatedTrue)
    _ ->
      decode.failure(
        ListVideoSyndicatedVideoSyndicatedUnspecified,
        "a valid ListVideoSyndicated",
      )
  }
}

/// Filter on videos of a specific type.
pub type ListVideoType {
  ListVideoTypeVideoTypeUnspecified
  ListVideoTypeAny
  ListVideoTypeMovie
  ListVideoTypeEpisode
}

pub fn list_video_type_to_string(value: ListVideoType) -> String {
  case value {
    ListVideoTypeVideoTypeUnspecified -> "videoTypeUnspecified"
    ListVideoTypeAny -> "any"
    ListVideoTypeMovie -> "movie"
    ListVideoTypeEpisode -> "episode"
  }
}

pub fn list_video_type_decoder() -> Decoder(ListVideoType) {
  use value <- decode.then(decode.string)
  case value {
    "videoTypeUnspecified" -> decode.success(ListVideoTypeVideoTypeUnspecified)
    "any" -> decode.success(ListVideoTypeAny)
    "movie" -> decode.success(ListVideoTypeMovie)
    "episode" -> decode.success(ListVideoTypeEpisode)
    _ ->
      decode.failure(ListVideoTypeVideoTypeUnspecified, "a valid ListVideoType")
  }
}
