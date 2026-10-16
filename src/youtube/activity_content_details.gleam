//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
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
    bulletin: option.Option(ActivityContentDetailsBulletin),
    channel_item: option.Option(ActivityContentDetailsChannelItem),
    comment: option.Option(ActivityContentDetailsComment),
    playlist_item: option.Option(ActivityContentDetailsPlaylistItem),
    promoted_item: option.Option(ActivityContentDetailsPromotedItem),
    recommendation: option.Option(ActivityContentDetailsRecommendation),
    social: option.Option(ActivityContentDetailsSocial),
    subscription: option.Option(ActivityContentDetailsSubscription),
    upload: option.Option(ActivityContentDetailsUpload),
  )
}
