//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/subscription.{type Subscription}

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
    "youtube/v3/subscriptions",
    list.flatten([[#("id", params.id)]]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
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

pub fn insert_request(params: InsertParams, body: Subscription) -> Request {
  Request(
    http.Post,
    "youtube/v3/subscriptions",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(subscription.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    channel_id: Option(String),
    for_channel_id: Option(String),
    id: Option(List(String)),
    max_results: Option(Int),
    mine: Option(Bool),
    my_recent_subscribers: Option(Bool),
    my_subscribers: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    order: Option(ListOrder),
    page_token: Option(String),
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
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    option.Some(value),
  )
}

pub fn list_with_order(params: ListParams, value: ListOrder) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
    params.page_token,
  )
}

pub fn list_with_on_behalf_of_content_owner_channel(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.order,
    params.page_token,
  )
}

pub fn list_with_on_behalf_of_content_owner(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_my_subscribers(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_my_recent_subscribers(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    option.Some(value),
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_mine(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    params.max_results,
    option.Some(value),
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    params.id,
    option.Some(value),
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    option.Some(value),
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.for_channel_id,
    case params.id
    {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_for_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    option.Some(value),
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_with_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.for_channel_id,
    params.id,
    params.max_results,
    params.mine,
    params.my_recent_subscribers,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.order,
    params.page_token,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/subscriptions",
    list.flatten(
      [list.map(params.part, fn(v) { #("part", v) }), case params.channel_id {
          option.Some(v) -> [#("channelId", v)]
          option.None -> []
        }, case params.for_channel_id {
          option.Some(v) -> [#("forChannelId", v)]
          option.None -> []
        }, case params.id {
          option.Some(v) -> list.map(v, fn(w) { #("id", w) })
          option.None -> []
        }, case params.max_results {
          option.Some(v) -> [#("maxResults", int.to_string(v))]
          option.None -> []
        }, case params.mine {
          option.Some(v) -> [#("mine", bool.to_string(v))]
          option.None -> []
        }, case params.my_recent_subscribers {
          option.Some(v) -> [#("myRecentSubscribers", bool.to_string(v))]
          option.None -> []
        }, case params.my_subscribers {
          option.Some(v) -> [#("mySubscribers", bool.to_string(v))]
          option.None -> []
        }, case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }, case params.on_behalf_of_content_owner_channel {
          option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
          option.None -> []
        }, case params.order {
          option.Some(v) -> [#("order", list_order_to_string(v))]
          option.None -> []
        }, case params.page_token {
          option.Some(v) -> [#("pageToken", v)]
          option.None -> []
        }],
    ),
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

/// The order of the returned subscriptions
pub type ListOrder {
  ListOrderSubscriptionOrderUnspecified
  ListOrderRelevance
  ListOrderUnread
  ListOrderAlphabetical
}

pub fn list_order_to_string(value: ListOrder) -> String {
  case value {
    ListOrderSubscriptionOrderUnspecified -> "subscriptionOrderUnspecified"
    ListOrderRelevance -> "relevance"
    ListOrderUnread -> "unread"
    ListOrderAlphabetical -> "alphabetical"
  }
}

pub fn list_order_decoder() -> Decoder(ListOrder) {
  use value <- decode.then(decode.string)
  case value {
    "subscriptionOrderUnspecified" -> decode.success(
      ListOrderSubscriptionOrderUnspecified,
    )
    "relevance" -> decode.success(ListOrderRelevance)
    "unread" -> decode.success(ListOrderUnread)
    "alphabetical" -> decode.success(ListOrderAlphabetical)
    _ -> decode.failure(
      ListOrderSubscriptionOrderUnspecified,
      "a valid ListOrder",
    )
  }
}