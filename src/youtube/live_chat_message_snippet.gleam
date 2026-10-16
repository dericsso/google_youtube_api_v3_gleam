//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option
import youtube/live_chat_fan_funding_event_details.{type LiveChatFanFundingEventDetails}
import youtube/live_chat_gift_details.{type LiveChatGiftDetails}
import youtube/live_chat_gift_membership_received_details.{type LiveChatGiftMembershipReceivedDetails}
import youtube/live_chat_member_milestone_chat_details.{type LiveChatMemberMilestoneChatDetails}
import youtube/live_chat_membership_gifting_details.{type LiveChatMembershipGiftingDetails}
import youtube/live_chat_message_deleted_details.{type LiveChatMessageDeletedDetails}
import youtube/live_chat_message_retracted_details.{type LiveChatMessageRetractedDetails}
import youtube/live_chat_new_sponsor_details.{type LiveChatNewSponsorDetails}
import youtube/live_chat_poll_details.{type LiveChatPollDetails}
import youtube/live_chat_super_chat_details.{type LiveChatSuperChatDetails}
import youtube/live_chat_super_sticker_details.{type LiveChatSuperStickerDetails}
import youtube/live_chat_text_message_details.{type LiveChatTextMessageDetails}
import youtube/live_chat_user_banned_message_details.{type LiveChatUserBannedMessageDetails}

/// Next ID: 35
pub type LiveChatMessageSnippet {
  LiveChatMessageSnippet(
    author_channel_id: option.Option(String),
    display_message: option.Option(String),
    fan_funding_event_details: option.Option(LiveChatFanFundingEventDetails),
    gift_details: option.Option(LiveChatGiftDetails),
    gift_membership_received_details:
    option.Option(LiveChatGiftMembershipReceivedDetails),
    has_display_content: option.Option(Bool),
    live_chat_id: option.Option(String),
    member_milestone_chat_details:
    option.Option(LiveChatMemberMilestoneChatDetails),
    membership_gifting_details: option.Option(LiveChatMembershipGiftingDetails),
    message_deleted_details: option.Option(LiveChatMessageDeletedDetails),
    message_retracted_details: option.Option(LiveChatMessageRetractedDetails),
    new_sponsor_details: option.Option(LiveChatNewSponsorDetails),
    poll_details: option.Option(LiveChatPollDetails),
    published_at: option.Option(String),
    super_chat_details: option.Option(LiveChatSuperChatDetails),
    super_sticker_details: option.Option(LiveChatSuperStickerDetails),
    text_message_details: option.Option(LiveChatTextMessageDetails),
    type_: option.Option(Type),
    user_banned_details: option.Option(LiveChatUserBannedMessageDetails),
  )
}

pub fn decoder() -> Decoder(LiveChatMessageSnippet) {
  use author_channel_id <- optional_field(
    "authorChannelId",
    option.None,
    optional(string),
  )
  use display_message <- optional_field(
    "displayMessage",
    option.None,
    optional(string),
  )
  use fan_funding_event_details <- optional_field(
    "fanFundingEventDetails",
    option.None,
    optional(live_chat_fan_funding_event_details.decoder()),
  )
  use gift_details <- optional_field(
    "giftDetails",
    option.None,
    optional(live_chat_gift_details.decoder()),
  )
  use gift_membership_received_details <- optional_field(
    "giftMembershipReceivedDetails",
    option.None,
    optional(live_chat_gift_membership_received_details.decoder()),
  )
  use has_display_content <- optional_field(
    "hasDisplayContent",
    option.None,
    optional(bool),
  )
  use live_chat_id <- optional_field(
    "liveChatId",
    option.None,
    optional(string),
  )
  use member_milestone_chat_details <- optional_field(
    "memberMilestoneChatDetails",
    option.None,
    optional(live_chat_member_milestone_chat_details.decoder()),
  )
  use membership_gifting_details <- optional_field(
    "membershipGiftingDetails",
    option.None,
    optional(live_chat_membership_gifting_details.decoder()),
  )
  use message_deleted_details <- optional_field(
    "messageDeletedDetails",
    option.None,
    optional(live_chat_message_deleted_details.decoder()),
  )
  use message_retracted_details <- optional_field(
    "messageRetractedDetails",
    option.None,
    optional(live_chat_message_retracted_details.decoder()),
  )
  use new_sponsor_details <- optional_field(
    "newSponsorDetails",
    option.None,
    optional(live_chat_new_sponsor_details.decoder()),
  )
  use poll_details <- optional_field(
    "pollDetails",
    option.None,
    optional(live_chat_poll_details.decoder()),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use super_chat_details <- optional_field(
    "superChatDetails",
    option.None,
    optional(live_chat_super_chat_details.decoder()),
  )
  use super_sticker_details <- optional_field(
    "superStickerDetails",
    option.None,
    optional(live_chat_super_sticker_details.decoder()),
  )
  use text_message_details <- optional_field(
    "textMessageDetails",
    option.None,
    optional(live_chat_text_message_details.decoder()),
  )
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  use user_banned_details <- optional_field(
    "userBannedDetails",
    option.None,
    optional(live_chat_user_banned_message_details.decoder()),
  )
  success(
    LiveChatMessageSnippet(
      author_channel_id,
      display_message,
      fan_funding_event_details,
      gift_details,
      gift_membership_received_details,
      has_display_content,
      live_chat_id,
      member_milestone_chat_details,
      membership_gifting_details,
      message_deleted_details,
      message_retracted_details,
      new_sponsor_details,
      poll_details,
      published_at,
      super_chat_details,
      super_sticker_details,
      text_message_details,
      type_,
      user_banned_details,
    ),
  )
}

/// The type of message, this will always be present, it determines the contents of the message as well as which fields will be present.
pub type Type {
  TypeInvalidType
  TypeTextMessageEvent
  TypeTombstone
  TypeFanFundingEvent
  TypeChatEndedEvent
  TypeSponsorOnlyModeStartedEvent
  TypeSponsorOnlyModeEndedEvent
  TypeNewSponsorEvent
  TypeMemberMilestoneChatEvent
  TypeMembershipGiftingEvent
  TypeGiftMembershipReceivedEvent
  TypeMessageDeletedEvent
  TypeMessageRetractedEvent
  TypeUserBannedEvent
  TypeSuperChatEvent
  TypeSuperStickerEvent
  TypePollEvent
  TypeGiftEvent
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeInvalidType -> "invalidType"
    TypeTextMessageEvent -> "textMessageEvent"
    TypeTombstone -> "tombstone"
    TypeFanFundingEvent -> "fanFundingEvent"
    TypeChatEndedEvent -> "chatEndedEvent"
    TypeSponsorOnlyModeStartedEvent -> "sponsorOnlyModeStartedEvent"
    TypeSponsorOnlyModeEndedEvent -> "sponsorOnlyModeEndedEvent"
    TypeNewSponsorEvent -> "newSponsorEvent"
    TypeMemberMilestoneChatEvent -> "memberMilestoneChatEvent"
    TypeMembershipGiftingEvent -> "membershipGiftingEvent"
    TypeGiftMembershipReceivedEvent -> "giftMembershipReceivedEvent"
    TypeMessageDeletedEvent -> "messageDeletedEvent"
    TypeMessageRetractedEvent -> "messageRetractedEvent"
    TypeUserBannedEvent -> "userBannedEvent"
    TypeSuperChatEvent -> "superChatEvent"
    TypeSuperStickerEvent -> "superStickerEvent"
    TypePollEvent -> "pollEvent"
    TypeGiftEvent -> "giftEvent"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- then(string)
  case value {
    "invalidType" -> success(TypeInvalidType)
    "textMessageEvent" -> success(TypeTextMessageEvent)
    "tombstone" -> success(TypeTombstone)
    "fanFundingEvent" -> success(TypeFanFundingEvent)
    "chatEndedEvent" -> success(TypeChatEndedEvent)
    "sponsorOnlyModeStartedEvent" -> success(TypeSponsorOnlyModeStartedEvent)
    "sponsorOnlyModeEndedEvent" -> success(TypeSponsorOnlyModeEndedEvent)
    "newSponsorEvent" -> success(TypeNewSponsorEvent)
    "memberMilestoneChatEvent" -> success(TypeMemberMilestoneChatEvent)
    "membershipGiftingEvent" -> success(TypeMembershipGiftingEvent)
    "giftMembershipReceivedEvent" -> success(TypeGiftMembershipReceivedEvent)
    "messageDeletedEvent" -> success(TypeMessageDeletedEvent)
    "messageRetractedEvent" -> success(TypeMessageRetractedEvent)
    "userBannedEvent" -> success(TypeUserBannedEvent)
    "superChatEvent" -> success(TypeSuperChatEvent)
    "superStickerEvent" -> success(TypeSuperStickerEvent)
    "pollEvent" -> success(TypePollEvent)
    "giftEvent" -> success(TypeGiftEvent)
    _ -> failure(TypeInvalidType, "a valid Type")
  }
}