import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}
import google_youtube_api_v3/youtube/thumbnail.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

/// A *subscription* resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.
pub type Subscription {
  Subscription(
    content_details: Option(SubscriptionContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(SubscriptionSnippet),
    subscriber_snippet: Option(SubscriptionSubscriberSnippet),
  )
}

pub fn subscription_decoder() -> Decoder(Subscription) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(subscription_content_details_decoder()),
  )
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
    decode.optional(subscription_snippet_decoder()),
  )
  use subscriber_snippet <- decode.optional_field(
    "subscriberSnippet",
    option.None,
    decode.optional(subscription_subscriber_snippet_decoder()),
  )
  decode.success(
    Subscription(content_details, etag, id, kind, snippet, subscriber_snippet),
  )
}

pub fn subscription_to_json(value: Subscription) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(
          value.content_details,
          subscription_content_details_to_json,
        ),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, subscription_snippet_to_json)),
      #(
        "subscriberSnippet",
        json.nullable(
          value.subscriber_snippet,
          subscription_subscriber_snippet_to_json,
        ),
      ),
    ],
  )
}

/// Details about the content to witch a subscription refers.
pub type SubscriptionContentDetails {
  SubscriptionContentDetails(
    activity_type: Option(ActivityType),
    new_item_count: Option(Int),
    total_item_count: Option(Int),
  )
}

pub fn subscription_content_details_decoder() -> Decoder(
  SubscriptionContentDetails,
) {
  use activity_type <- decode.optional_field(
    "activityType",
    option.None,
    decode.optional(activity_type_decoder()),
  )
  use new_item_count <- decode.optional_field(
    "newItemCount",
    option.None,
    decode.optional(decode.int),
  )
  use total_item_count <- decode.optional_field(
    "totalItemCount",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(
    SubscriptionContentDetails(activity_type, new_item_count, total_item_count),
  )
}

pub fn subscription_content_details_to_json(value: SubscriptionContentDetails) -> Json {
  json.object(
    [
      #(
        "activityType",
        json.nullable(
          value.activity_type,
          fn(e)
          { json.string(activity_type_to_string(e)) },
        ),
      ),
      #("newItemCount", json.nullable(value.new_item_count, json.int)),
      #("totalItemCount", json.nullable(value.total_item_count, json.int)),
    ],
  )
}

/// The type of activity this subscription is for (only uploads, everything).
pub type ActivityType {
  ActivityTypeSubscriptionActivityTypeUnspecified
  ActivityTypeAll
  ActivityTypeUploads
}

pub fn activity_type_to_string(value: ActivityType) -> String {
  case value {
    ActivityTypeSubscriptionActivityTypeUnspecified -> "subscriptionActivityTypeUnspecified"
    ActivityTypeAll -> "all"
    ActivityTypeUploads -> "uploads"
  }
}

pub fn activity_type_decoder() -> Decoder(ActivityType) {
  use value <- decode.then(decode.string)
  case value {
    "subscriptionActivityTypeUnspecified" -> decode.success(
      ActivityTypeSubscriptionActivityTypeUnspecified,
    )
    "all" -> decode.success(ActivityTypeAll)
    "uploads" -> decode.success(ActivityTypeUploads)
    _ -> decode.failure(
      ActivityTypeSubscriptionActivityTypeUnspecified,
      "a valid ActivityType",
    )
  }
}

pub type SubscriptionListResponse {
  SubscriptionListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(Subscription)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn subscription_list_response_decoder() -> Decoder(SubscriptionListResponse) {
  use
  etag
  <-
  decode.optional_field("etag", option.None, decode.optional(decode.string))
  use
  event_id
  <-
  decode.optional_field("eventId", option.None, decode.optional(decode.string))
  use
  items
  <-
  decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(subscription_decoder())),
  )
  use
  kind
  <-
  decode.optional_field("kind", option.None, decode.optional(decode.string))
  use
  next_page_token
  <-
  decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use
  page_info
  <-
  decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use
  prev_page_token
  <-
  decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use
  token_pagination
  <-
  decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use
  visitor_id
  <-
  decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    SubscriptionListResponse(
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
      token_pagination,
      visitor_id,
    ),
  )
}

pub fn subscription_list_response_to_json(value: SubscriptionListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, subscription_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
      #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
      #(
        "tokenPagination",
        json.nullable(
          value.token_pagination,
          token_pagination.token_pagination_to_json,
        ),
      ),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

/// Basic details about a subscription, including title, description and thumbnails of the subscribed item.
pub type SubscriptionSnippet {
  SubscriptionSnippet(
    channel_id: Option(String),
    description: Option(String),
    published_at: Option(String),
    resource_id: Option(ResourceId),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn subscription_snippet_decoder() -> Decoder(SubscriptionSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail.thumbnail_details_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    SubscriptionSnippet(
      channel_id,
      description,
      published_at,
      resource_id,
      thumbnails,
      title,
    ),
  )
}

pub fn subscription_snippet_to_json(value: SubscriptionSnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}

/// Basic details about a subscription's subscriber including title, description, channel ID and thumbnails.
pub type SubscriptionSubscriberSnippet {
  SubscriptionSubscriberSnippet(
    channel_id: Option(String),
    description: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn subscription_subscriber_snippet_decoder() -> Decoder(
  SubscriptionSubscriberSnippet,
) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail.thumbnail_details_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    SubscriptionSubscriberSnippet(channel_id, description, thumbnails, title),
  )
}

pub fn subscription_subscriber_snippet_to_json(
  value: SubscriptionSubscriberSnippet,
) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}