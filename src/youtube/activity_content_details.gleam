//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/activity_content_details_bulletin.{
  type ActivityContentDetailsBulletin,
}
import youtube/activity_content_details_channel_item.{
  type ActivityContentDetailsChannelItem,
}
import youtube/activity_content_details_comment.{
  type ActivityContentDetailsComment,
}
import youtube/activity_content_details_playlist_item.{
  type ActivityContentDetailsPlaylistItem,
}
import youtube/activity_content_details_promoted_item.{
  type ActivityContentDetailsPromotedItem,
}
import youtube/activity_content_details_recommendation.{
  type ActivityContentDetailsRecommendation,
}
import youtube/activity_content_details_social.{
  type ActivityContentDetailsSocial,
}
import youtube/activity_content_details_subscription.{
  type ActivityContentDetailsSubscription,
}
import youtube/activity_content_details_upload.{
  type ActivityContentDetailsUpload,
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

pub fn decoder() -> Decoder(ActivityContentDetails) {
  use bulletin <- decode.optional_field(
    "bulletin",
    option.None,
    decode.optional(activity_content_details_bulletin.decoder()),
  )
  use channel_item <- decode.optional_field(
    "channelItem",
    option.None,
    decode.optional(activity_content_details_channel_item.decoder()),
  )
  use comment <- decode.optional_field(
    "comment",
    option.None,
    decode.optional(activity_content_details_comment.decoder()),
  )
  use playlist_item <- decode.optional_field(
    "playlistItem",
    option.None,
    decode.optional(activity_content_details_playlist_item.decoder()),
  )
  use promoted_item <- decode.optional_field(
    "promotedItem",
    option.None,
    decode.optional(activity_content_details_promoted_item.decoder()),
  )
  use recommendation <- decode.optional_field(
    "recommendation",
    option.None,
    decode.optional(activity_content_details_recommendation.decoder()),
  )
  use social <- decode.optional_field(
    "social",
    option.None,
    decode.optional(activity_content_details_social.decoder()),
  )
  use subscription <- decode.optional_field(
    "subscription",
    option.None,
    decode.optional(activity_content_details_subscription.decoder()),
  )
  use upload <- decode.optional_field(
    "upload",
    option.None,
    decode.optional(activity_content_details_upload.decoder()),
  )
  decode.success(ActivityContentDetails(
    bulletin,
    channel_item,
    comment,
    playlist_item,
    promoted_item,
    recommendation,
    social,
    subscription,
    upload,
  ))
}

pub fn to_json(value: ActivityContentDetails) -> Json {
  json.object([
    #(
      "bulletin",
      json.nullable(value.bulletin, activity_content_details_bulletin.to_json),
    ),
    #(
      "channelItem",
      json.nullable(
        value.channel_item,
        activity_content_details_channel_item.to_json,
      ),
    ),
    #(
      "comment",
      json.nullable(value.comment, activity_content_details_comment.to_json),
    ),
    #(
      "playlistItem",
      json.nullable(
        value.playlist_item,
        activity_content_details_playlist_item.to_json,
      ),
    ),
    #(
      "promotedItem",
      json.nullable(
        value.promoted_item,
        activity_content_details_promoted_item.to_json,
      ),
    ),
    #(
      "recommendation",
      json.nullable(
        value.recommendation,
        activity_content_details_recommendation.to_json,
      ),
    ),
    #(
      "social",
      json.nullable(value.social, activity_content_details_social.to_json),
    ),
    #(
      "subscription",
      json.nullable(
        value.subscription,
        activity_content_details_subscription.to_json,
      ),
    ),
    #(
      "upload",
      json.nullable(value.upload, activity_content_details_upload.to_json),
    ),
  ])
}
