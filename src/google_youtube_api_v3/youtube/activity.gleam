//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}
import google_youtube_api_v3/youtube/thumbnail.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

/// An `activity` resource contains information about an action that a particular channel, or user, has taken on YouTube. The actions reported in activity feeds include sharing a video, uploading a video, and so forth. Each `activity` resource identifies the type of action, the channel associated with the action, and the resource(s) associated with the action, such as the video that was rated or uploaded.
pub type Activity {
  Activity(
    content_details: Option(ActivityContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(ActivitySnippet),
  )
}

pub fn activity_decoder() -> Decoder(Activity) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(activity_content_details_decoder()),
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
    decode.optional(activity_snippet_decoder()),
  )
  decode.success(Activity(content_details, etag, id, kind, snippet))
}

pub fn activity_to_json(value: Activity) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(value.content_details, activity_content_details_to_json),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, activity_snippet_to_json)),
    ],
  )
}

/// Details about the content of an activity: the video that was shared, the channel that was subscribed to, etc.
pub type ActivityContentDetails {
  ActivityContentDetails(
    bulletin: Option(ActivityContentDetailsBulletin),
    channel_item: Option(ActivityContentDetailsChannelItem),
    comment: Option(ActivityContentDetailsComment),
    playlist_item: Option(ActivityContentDetailsPlaylistItem),
    promoted_item: Option(ActivityContentDetailsPromotedItem),
    recommendation: Option(ActivityContentDetailsRecommendation),
    social: Option(ActivityContentDetailsSocial),
    subscription: Option(ActivityContentDetailsSubscription),
    upload: Option(ActivityContentDetailsUpload),
  )
}

pub fn activity_content_details_decoder() -> Decoder(ActivityContentDetails) {
  use bulletin <- decode.optional_field(
    "bulletin",
    option.None,
    decode.optional(activity_content_details_bulletin_decoder()),
  )
  use channel_item <- decode.optional_field(
    "channelItem",
    option.None,
    decode.optional(activity_content_details_channel_item_decoder()),
  )
  use comment <- decode.optional_field(
    "comment",
    option.None,
    decode.optional(activity_content_details_comment_decoder()),
  )
  use playlist_item <- decode.optional_field(
    "playlistItem",
    option.None,
    decode.optional(activity_content_details_playlist_item_decoder()),
  )
  use promoted_item <- decode.optional_field(
    "promotedItem",
    option.None,
    decode.optional(activity_content_details_promoted_item_decoder()),
  )
  use recommendation <- decode.optional_field(
    "recommendation",
    option.None,
    decode.optional(activity_content_details_recommendation_decoder()),
  )
  use social <- decode.optional_field(
    "social",
    option.None,
    decode.optional(activity_content_details_social_decoder()),
  )
  use subscription <- decode.optional_field(
    "subscription",
    option.None,
    decode.optional(activity_content_details_subscription_decoder()),
  )
  use upload <- decode.optional_field(
    "upload",
    option.None,
    decode.optional(activity_content_details_upload_decoder()),
  )
  decode.success(
    ActivityContentDetails(
      bulletin,
      channel_item,
      comment,
      playlist_item,
      promoted_item,
      recommendation,
      social,
      subscription,
      upload,
    ),
  )
}

pub fn activity_content_details_to_json(value: ActivityContentDetails) -> Json {
  json.object(
    [
      #(
        "bulletin",
        json.nullable(value.bulletin, activity_content_details_bulletin_to_json),
      ),
      #(
        "channelItem",
        json.nullable(
          value.channel_item,
          activity_content_details_channel_item_to_json,
        ),
      ),
      #(
        "comment",
        json.nullable(value.comment, activity_content_details_comment_to_json),
      ),
      #(
        "playlistItem",
        json.nullable(
          value.playlist_item,
          activity_content_details_playlist_item_to_json,
        ),
      ),
      #(
        "promotedItem",
        json.nullable(
          value.promoted_item,
          activity_content_details_promoted_item_to_json,
        ),
      ),
      #(
        "recommendation",
        json.nullable(
          value.recommendation,
          activity_content_details_recommendation_to_json,
        ),
      ),
      #(
        "social",
        json.nullable(value.social, activity_content_details_social_to_json),
      ),
      #(
        "subscription",
        json.nullable(
          value.subscription,
          activity_content_details_subscription_to_json,
        ),
      ),
      #(
        "upload",
        json.nullable(value.upload, activity_content_details_upload_to_json),
      ),
    ],
  )
}

/// Details about a channel bulletin post.
pub type ActivityContentDetailsBulletin {
  ActivityContentDetailsBulletin(resource_id: Option(ResourceId))
}

pub fn activity_content_details_bulletin_decoder() -> Decoder(
  ActivityContentDetailsBulletin,
) {
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  decode.success(ActivityContentDetailsBulletin(resource_id))
}

pub fn activity_content_details_bulletin_to_json(
  value: ActivityContentDetailsBulletin,
) -> Json {
  json.object(
    [
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
    ],
  )
}

/// Details about a resource which was added to a channel.
pub type ActivityContentDetailsChannelItem {
  ActivityContentDetailsChannelItem(resource_id: Option(ResourceId))
}

pub fn activity_content_details_channel_item_decoder() -> Decoder(
  ActivityContentDetailsChannelItem,
) {
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  decode.success(ActivityContentDetailsChannelItem(resource_id))
}

pub fn activity_content_details_channel_item_to_json(
  value: ActivityContentDetailsChannelItem,
) -> Json {
  json.object(
    [
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
    ],
  )
}

/// Information about a resource that received a comment.
pub type ActivityContentDetailsComment {
  ActivityContentDetailsComment(resource_id: Option(ResourceId))
}

pub fn activity_content_details_comment_decoder() -> Decoder(
  ActivityContentDetailsComment,
) {
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  decode.success(ActivityContentDetailsComment(resource_id))
}

pub fn activity_content_details_comment_to_json(
  value: ActivityContentDetailsComment,
) -> Json {
  json.object(
    [
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
    ],
  )
}

/// Information about a new playlist item.
pub type ActivityContentDetailsPlaylistItem {
  ActivityContentDetailsPlaylistItem(
    playlist_id: Option(String),
    playlist_item_id: Option(String),
    resource_id: Option(ResourceId),
  )
}

pub fn activity_content_details_playlist_item_decoder() -> Decoder(
  ActivityContentDetailsPlaylistItem,
) {
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use playlist_item_id <- decode.optional_field(
    "playlistItemId",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  decode.success(
    ActivityContentDetailsPlaylistItem(
      playlist_id,
      playlist_item_id,
      resource_id,
    ),
  )
}

pub fn activity_content_details_playlist_item_to_json(
  value: ActivityContentDetailsPlaylistItem,
) -> Json {
  json.object(
    [
      #("playlistId", json.nullable(value.playlist_id, json.string)),
      #("playlistItemId", json.nullable(value.playlist_item_id, json.string)),
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
    ],
  )
}

/// Details about a resource which is being promoted.
pub type ActivityContentDetailsPromotedItem {
  ActivityContentDetailsPromotedItem(
    ad_tag: Option(String),
    click_tracking_url: Option(String),
    creative_view_url: Option(String),
    cta_type: Option(CtaType),
    custom_cta_button_text: Option(String),
    description_text: Option(String),
    destination_url: Option(String),
    forecasting_url: Option(List(String)),
    impression_url: Option(List(String)),
    video_id: Option(String),
  )
}

pub fn activity_content_details_promoted_item_decoder() -> Decoder(
  ActivityContentDetailsPromotedItem,
) {
  use ad_tag <- decode.optional_field(
    "adTag",
    option.None,
    decode.optional(decode.string),
  )
  use click_tracking_url <- decode.optional_field(
    "clickTrackingUrl",
    option.None,
    decode.optional(decode.string),
  )
  use creative_view_url <- decode.optional_field(
    "creativeViewUrl",
    option.None,
    decode.optional(decode.string),
  )
  use cta_type <- decode.optional_field(
    "ctaType",
    option.None,
    decode.optional(cta_type_decoder()),
  )
  use custom_cta_button_text <- decode.optional_field(
    "customCtaButtonText",
    option.None,
    decode.optional(decode.string),
  )
  use description_text <- decode.optional_field(
    "descriptionText",
    option.None,
    decode.optional(decode.string),
  )
  use destination_url <- decode.optional_field(
    "destinationUrl",
    option.None,
    decode.optional(decode.string),
  )
  use forecasting_url <- decode.optional_field(
    "forecastingUrl",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use impression_url <- decode.optional_field(
    "impressionUrl",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    ActivityContentDetailsPromotedItem(
      ad_tag,
      click_tracking_url,
      creative_view_url,
      cta_type,
      custom_cta_button_text,
      description_text,
      destination_url,
      forecasting_url,
      impression_url,
      video_id,
    ),
  )
}

pub fn activity_content_details_promoted_item_to_json(
  value: ActivityContentDetailsPromotedItem,
) -> Json {
  json.object(
    [
      #("adTag", json.nullable(value.ad_tag, json.string)),
      #(
        "clickTrackingUrl",
        json.nullable(value.click_tracking_url, json.string),
      ),
      #("creativeViewUrl", json.nullable(value.creative_view_url, json.string)),
      #(
        "ctaType",
        json.nullable(
          value.cta_type,
          fn(e)
          { json.string(cta_type_to_string(e)) },
        ),
      ),
      #(
        "customCtaButtonText",
        json.nullable(value.custom_cta_button_text, json.string),
      ),
      #("descriptionText", json.nullable(value.description_text, json.string)),
      #("destinationUrl", json.nullable(value.destination_url, json.string)),
      #(
        "forecastingUrl",
        json.nullable(
          value.forecasting_url,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #(
        "impressionUrl",
        json.nullable(
          value.impression_url,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #("videoId", json.nullable(value.video_id, json.string)),
    ],
  )
}

/// The type of call-to-action, a message to the user indicating action that can be taken.
pub type CtaType {
  CtaTypeCtaTypeUnspecified
  CtaTypeVisitAdvertiserSite
}

pub fn cta_type_to_string(value: CtaType) -> String {
  case value {
    CtaTypeCtaTypeUnspecified -> "ctaTypeUnspecified"
    CtaTypeVisitAdvertiserSite -> "visitAdvertiserSite"
  }
}

pub fn cta_type_decoder() -> Decoder(CtaType) {
  use value <- decode.then(decode.string)
  case value {
    "ctaTypeUnspecified" -> decode.success(CtaTypeCtaTypeUnspecified)
    "visitAdvertiserSite" -> decode.success(CtaTypeVisitAdvertiserSite)
    _ -> decode.failure(CtaTypeCtaTypeUnspecified, "a valid CtaType")
  }
}

/// Information that identifies the recommended resource.
pub type ActivityContentDetailsRecommendation {
  ActivityContentDetailsRecommendation(
    reason: Option(Reason),
    resource_id: Option(ResourceId),
    seed_resource_id: Option(ResourceId),
  )
}

pub fn activity_content_details_recommendation_decoder() -> Decoder(
  ActivityContentDetailsRecommendation,
) {
  use reason <- decode.optional_field(
    "reason",
    option.None,
    decode.optional(reason_decoder()),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  use seed_resource_id <- decode.optional_field(
    "seedResourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  decode.success(
    ActivityContentDetailsRecommendation(reason, resource_id, seed_resource_id),
  )
}

pub fn activity_content_details_recommendation_to_json(
  value: ActivityContentDetailsRecommendation,
) -> Json {
  json.object(
    [
      #(
        "reason",
        json.nullable(value.reason, fn(e) { json.string(reason_to_string(e)) }),
      ),
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
      #(
        "seedResourceId",
        json.nullable(value.seed_resource_id, resource_id.resource_id_to_json),
      ),
    ],
  )
}

/// The reason that the resource is recommended to the user.
pub type Reason {
  ReasonReasonUnspecified
  ReasonVideoWatched
}

pub fn reason_to_string(value: Reason) -> String {
  case value {
    ReasonReasonUnspecified -> "reasonUnspecified"
    ReasonVideoWatched -> "videoWatched"
  }
}

pub fn reason_decoder() -> Decoder(Reason) {
  use value <- decode.then(decode.string)
  case value {
    "reasonUnspecified" -> decode.success(ReasonReasonUnspecified)
    "videoWatched" -> decode.success(ReasonVideoWatched)
    _ -> decode.failure(ReasonReasonUnspecified, "a valid Reason")
  }
}

/// Details about a social network post.
pub type ActivityContentDetailsSocial {
  ActivityContentDetailsSocial(
    author: Option(String),
    image_url: Option(String),
    reference_url: Option(String),
    resource_id: Option(ResourceId),
    type_: Option(ActivityContentDetailsSocialType),
  )
}

pub fn activity_content_details_social_decoder() -> Decoder(
  ActivityContentDetailsSocial,
) {
  use author <- decode.optional_field(
    "author",
    option.None,
    decode.optional(decode.string),
  )
  use image_url <- decode.optional_field(
    "imageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use reference_url <- decode.optional_field(
    "referenceUrl",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(activity_content_details_social_type_decoder()),
  )
  decode.success(
    ActivityContentDetailsSocial(
      author,
      image_url,
      reference_url,
      resource_id,
      type_,
    ),
  )
}

pub fn activity_content_details_social_to_json(
  value: ActivityContentDetailsSocial,
) -> Json {
  json.object(
    [
      #("author", json.nullable(value.author, json.string)),
      #("imageUrl", json.nullable(value.image_url, json.string)),
      #("referenceUrl", json.nullable(value.reference_url, json.string)),
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
      #(
        "type",
        json.nullable(
          value.type_,
          fn(e)
          { json.string(activity_content_details_social_type_to_string(e)) },
        ),
      ),
    ],
  )
}

/// The name of the social network.
pub type ActivityContentDetailsSocialType {
  ActivityContentDetailsSocialTypeUnspecified
  ActivityContentDetailsSocialTypeGooglePlus
  ActivityContentDetailsSocialTypeFacebook
  ActivityContentDetailsSocialTypeTwitter
}

pub fn activity_content_details_social_type_to_string(
  value: ActivityContentDetailsSocialType,
) -> String {
  case value {
    ActivityContentDetailsSocialTypeUnspecified -> "unspecified"
    ActivityContentDetailsSocialTypeGooglePlus -> "googlePlus"
    ActivityContentDetailsSocialTypeFacebook -> "facebook"
    ActivityContentDetailsSocialTypeTwitter -> "twitter"
  }
}

pub fn activity_content_details_social_type_decoder() -> Decoder(
  ActivityContentDetailsSocialType,
) {
  use value <- decode.then(decode.string)
  case value {
    "unspecified" -> decode.success(ActivityContentDetailsSocialTypeUnspecified)
    "googlePlus" -> decode.success(ActivityContentDetailsSocialTypeGooglePlus)
    "facebook" -> decode.success(ActivityContentDetailsSocialTypeFacebook)
    "twitter" -> decode.success(ActivityContentDetailsSocialTypeTwitter)
    _ -> decode.failure(
      ActivityContentDetailsSocialTypeUnspecified,
      "a valid ActivityContentDetailsSocialType",
    )
  }
}

/// Information about a channel that a user subscribed to.
pub type ActivityContentDetailsSubscription {
  ActivityContentDetailsSubscription(resource_id: Option(ResourceId))
}

pub fn activity_content_details_subscription_decoder() -> Decoder(
  ActivityContentDetailsSubscription,
) {
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  decode.success(ActivityContentDetailsSubscription(resource_id))
}

pub fn activity_content_details_subscription_to_json(
  value: ActivityContentDetailsSubscription,
) -> Json {
  json.object(
    [
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
    ],
  )
}

/// Information about the uploaded video.
pub type ActivityContentDetailsUpload {
  ActivityContentDetailsUpload(video_id: Option(String))
}

pub fn activity_content_details_upload_decoder() -> Decoder(
  ActivityContentDetailsUpload,
) {
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ActivityContentDetailsUpload(video_id))
}

pub fn activity_content_details_upload_to_json(
  value: ActivityContentDetailsUpload,
) -> Json {
  json.object([#("videoId", json.nullable(value.video_id, json.string))])
}

pub type ActivityListResponse {
  ActivityListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(Activity)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn activity_list_response_decoder() -> Decoder(ActivityListResponse) {
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
    decode.optional(decode.list(activity_decoder())),
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
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
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
  decode.success(
    ActivityListResponse(
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

pub fn activity_list_response_to_json(value: ActivityListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, activity_to_json) },
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

/// Basic details about an activity, including title, description, thumbnails, activity type and group. Next ID: 12
pub type ActivitySnippet {
  ActivitySnippet(
    channel_id: Option(String),
    channel_title: Option(String),
    description: Option(String),
    group_id: Option(String),
    published_at: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
    type_: Option(ActivitySnippetType),
  )
}

pub fn activity_snippet_decoder() -> Decoder(ActivitySnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_title <- decode.optional_field(
    "channelTitle",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use group_id <- decode.optional_field(
    "groupId",
    option.None,
    decode.optional(decode.string),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
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
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(activity_snippet_type_decoder()),
  )
  decode.success(
    ActivitySnippet(
      channel_id,
      channel_title,
      description,
      group_id,
      published_at,
      thumbnails,
      title,
      type_,
    ),
  )
}

pub fn activity_snippet_to_json(value: ActivitySnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("channelTitle", json.nullable(value.channel_title, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #("groupId", json.nullable(value.group_id, json.string)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
      #(
        "type",
        json.nullable(
          value.type_,
          fn(e)
          { json.string(activity_snippet_type_to_string(e)) },
        ),
      ),
    ],
  )
}

/// The type of activity that the resource describes.
pub type ActivitySnippetType {
  ActivitySnippetTypeTypeUnspecified
  ActivitySnippetTypeUpload
  ActivitySnippetTypeComment
  ActivitySnippetTypeSubscription
  ActivitySnippetTypePlaylistItem
  ActivitySnippetTypeRecommendation
  ActivitySnippetTypeBulletin
  ActivitySnippetTypeSocial
  ActivitySnippetTypeChannelItem
  ActivitySnippetTypePromotedItem
}

pub fn activity_snippet_type_to_string(value: ActivitySnippetType) -> String {
  case value {
    ActivitySnippetTypeTypeUnspecified -> "typeUnspecified"
    ActivitySnippetTypeUpload -> "upload"
    ActivitySnippetTypeComment -> "comment"
    ActivitySnippetTypeSubscription -> "subscription"
    ActivitySnippetTypePlaylistItem -> "playlistItem"
    ActivitySnippetTypeRecommendation -> "recommendation"
    ActivitySnippetTypeBulletin -> "bulletin"
    ActivitySnippetTypeSocial -> "social"
    ActivitySnippetTypeChannelItem -> "channelItem"
    ActivitySnippetTypePromotedItem -> "promotedItem"
  }
}

pub fn activity_snippet_type_decoder() -> Decoder(ActivitySnippetType) {
  use value <- decode.then(decode.string)
  case value {
    "typeUnspecified" -> decode.success(ActivitySnippetTypeTypeUnspecified)
    "upload" -> decode.success(ActivitySnippetTypeUpload)
    "comment" -> decode.success(ActivitySnippetTypeComment)
    "subscription" -> decode.success(ActivitySnippetTypeSubscription)
    "playlistItem" -> decode.success(ActivitySnippetTypePlaylistItem)
    "recommendation" -> decode.success(ActivitySnippetTypeRecommendation)
    "bulletin" -> decode.success(ActivitySnippetTypeBulletin)
    "social" -> decode.success(ActivitySnippetTypeSocial)
    "channelItem" -> decode.success(ActivitySnippetTypeChannelItem)
    "promotedItem" -> decode.success(ActivitySnippetTypePromotedItem)
    _ -> decode.failure(
      ActivitySnippetTypeTypeUnspecified,
      "a valid ActivitySnippetType",
    )
  }
}