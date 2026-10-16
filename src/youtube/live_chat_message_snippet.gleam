//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_chat_fan_funding_event_details.{
  type LiveChatFanFundingEventDetails,
}
import youtube/live_chat_gift_details.{type LiveChatGiftDetails}
import youtube/live_chat_gift_membership_received_details.{
  type LiveChatGiftMembershipReceivedDetails,
}
import youtube/live_chat_member_milestone_chat_details.{
  type LiveChatMemberMilestoneChatDetails,
}
import youtube/live_chat_membership_gifting_details.{
  type LiveChatMembershipGiftingDetails,
}
import youtube/live_chat_message_deleted_details.{
  type LiveChatMessageDeletedDetails,
}
import youtube/live_chat_message_retracted_details.{
  type LiveChatMessageRetractedDetails,
}
import youtube/live_chat_new_sponsor_details.{type LiveChatNewSponsorDetails}
import youtube/live_chat_poll_details.{type LiveChatPollDetails}
import youtube/live_chat_super_chat_details.{type LiveChatSuperChatDetails}
import youtube/live_chat_super_sticker_details.{type LiveChatSuperStickerDetails}
import youtube/live_chat_text_message_details.{type LiveChatTextMessageDetails}
import youtube/live_chat_user_banned_message_details.{
  type LiveChatUserBannedMessageDetails,
}

/// Next ID: 35
pub type LiveChatMessageSnippet {
  LiveChatMessageSnippet(
    author_channel_id: option.Option(String),
    display_message: option.Option(String),
    fan_funding_event_details: option.Option(LiveChatFanFundingEventDetails),
    gift_details: option.Option(LiveChatGiftDetails),
    gift_membership_received_details: option.Option(
      LiveChatGiftMembershipReceivedDetails,
    ),
    has_display_content: option.Option(Bool),
    live_chat_id: option.Option(String),
    member_milestone_chat_details: option.Option(
      LiveChatMemberMilestoneChatDetails,
    ),
    membership_gifting_details: option.Option(LiveChatMembershipGiftingDetails),
    message_deleted_details: option.Option(LiveChatMessageDeletedDetails),
    message_retracted_details: option.Option(LiveChatMessageRetractedDetails),
    new_sponsor_details: option.Option(LiveChatNewSponsorDetails),
    poll_details: option.Option(LiveChatPollDetails),
    published_at: option.Option(String),
    super_chat_details: option.Option(LiveChatSuperChatDetails),
    super_sticker_details: option.Option(LiveChatSuperStickerDetails),
    text_message_details: option.Option(LiveChatTextMessageDetails),
    type_: option.Option(String),
    user_banned_details: option.Option(LiveChatUserBannedMessageDetails),
  )
}
