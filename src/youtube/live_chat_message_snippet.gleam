//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
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
    author_channel_id: Option(String),
    display_message: Option(String),
    fan_funding_event_details: Option(LiveChatFanFundingEventDetails),
    gift_details: Option(LiveChatGiftDetails),
    gift_membership_received_details: Option(
      LiveChatGiftMembershipReceivedDetails,
    ),
    has_display_content: Option(Bool),
    live_chat_id: Option(String),
    member_milestone_chat_details: Option(LiveChatMemberMilestoneChatDetails),
    membership_gifting_details: Option(LiveChatMembershipGiftingDetails),
    message_deleted_details: Option(LiveChatMessageDeletedDetails),
    message_retracted_details: Option(LiveChatMessageRetractedDetails),
    new_sponsor_details: Option(LiveChatNewSponsorDetails),
    poll_details: Option(LiveChatPollDetails),
    published_at: Option(String),
    super_chat_details: Option(LiveChatSuperChatDetails),
    super_sticker_details: Option(LiveChatSuperStickerDetails),
    text_message_details: Option(LiveChatTextMessageDetails),
    type_: Option(Type),
    user_banned_details: Option(LiveChatUserBannedMessageDetails),
  )
}

pub fn decoder() -> Decoder(LiveChatMessageSnippet) {
  use author_channel_id <- decode.optional_field(
    "authorChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use display_message <- decode.optional_field(
    "displayMessage",
    option.None,
    decode.optional(decode.string),
  )
  use fan_funding_event_details <- decode.optional_field(
    "fanFundingEventDetails",
    option.None,
    decode.optional(live_chat_fan_funding_event_details.decoder()),
  )
  use gift_details <- decode.optional_field(
    "giftDetails",
    option.None,
    decode.optional(live_chat_gift_details.decoder()),
  )
  use gift_membership_received_details <- decode.optional_field(
    "giftMembershipReceivedDetails",
    option.None,
    decode.optional(live_chat_gift_membership_received_details.decoder()),
  )
  use has_display_content <- decode.optional_field(
    "hasDisplayContent",
    option.None,
    decode.optional(decode.bool),
  )
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use member_milestone_chat_details <- decode.optional_field(
    "memberMilestoneChatDetails",
    option.None,
    decode.optional(live_chat_member_milestone_chat_details.decoder()),
  )
  use membership_gifting_details <- decode.optional_field(
    "membershipGiftingDetails",
    option.None,
    decode.optional(live_chat_membership_gifting_details.decoder()),
  )
  use message_deleted_details <- decode.optional_field(
    "messageDeletedDetails",
    option.None,
    decode.optional(live_chat_message_deleted_details.decoder()),
  )
  use message_retracted_details <- decode.optional_field(
    "messageRetractedDetails",
    option.None,
    decode.optional(live_chat_message_retracted_details.decoder()),
  )
  use new_sponsor_details <- decode.optional_field(
    "newSponsorDetails",
    option.None,
    decode.optional(live_chat_new_sponsor_details.decoder()),
  )
  use poll_details <- decode.optional_field(
    "pollDetails",
    option.None,
    decode.optional(live_chat_poll_details.decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use super_chat_details <- decode.optional_field(
    "superChatDetails",
    option.None,
    decode.optional(live_chat_super_chat_details.decoder()),
  )
  use super_sticker_details <- decode.optional_field(
    "superStickerDetails",
    option.None,
    decode.optional(live_chat_super_sticker_details.decoder()),
  )
  use text_message_details <- decode.optional_field(
    "textMessageDetails",
    option.None,
    decode.optional(live_chat_text_message_details.decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  use user_banned_details <- decode.optional_field(
    "userBannedDetails",
    option.None,
    decode.optional(live_chat_user_banned_message_details.decoder()),
  )
  decode.success(LiveChatMessageSnippet(
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
  ))
}

pub fn to_json(value: LiveChatMessageSnippet) -> Json {
  json.object([
    #("authorChannelId", json.nullable(value.author_channel_id, json.string)),
    #("displayMessage", json.nullable(value.display_message, json.string)),
    #(
      "fanFundingEventDetails",
      json.nullable(
        value.fan_funding_event_details,
        live_chat_fan_funding_event_details.to_json,
      ),
    ),
    #(
      "giftDetails",
      json.nullable(value.gift_details, live_chat_gift_details.to_json),
    ),
    #(
      "giftMembershipReceivedDetails",
      json.nullable(
        value.gift_membership_received_details,
        live_chat_gift_membership_received_details.to_json,
      ),
    ),
    #("hasDisplayContent", json.nullable(value.has_display_content, json.bool)),
    #("liveChatId", json.nullable(value.live_chat_id, json.string)),
    #(
      "memberMilestoneChatDetails",
      json.nullable(
        value.member_milestone_chat_details,
        live_chat_member_milestone_chat_details.to_json,
      ),
    ),
    #(
      "membershipGiftingDetails",
      json.nullable(
        value.membership_gifting_details,
        live_chat_membership_gifting_details.to_json,
      ),
    ),
    #(
      "messageDeletedDetails",
      json.nullable(
        value.message_deleted_details,
        live_chat_message_deleted_details.to_json,
      ),
    ),
    #(
      "messageRetractedDetails",
      json.nullable(
        value.message_retracted_details,
        live_chat_message_retracted_details.to_json,
      ),
    ),
    #(
      "newSponsorDetails",
      json.nullable(
        value.new_sponsor_details,
        live_chat_new_sponsor_details.to_json,
      ),
    ),
    #(
      "pollDetails",
      json.nullable(value.poll_details, live_chat_poll_details.to_json),
    ),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #(
      "superChatDetails",
      json.nullable(
        value.super_chat_details,
        live_chat_super_chat_details.to_json,
      ),
    ),
    #(
      "superStickerDetails",
      json.nullable(
        value.super_sticker_details,
        live_chat_super_sticker_details.to_json,
      ),
    ),
    #(
      "textMessageDetails",
      json.nullable(
        value.text_message_details,
        live_chat_text_message_details.to_json,
      ),
    ),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
    #(
      "userBannedDetails",
      json.nullable(
        value.user_banned_details,
        live_chat_user_banned_message_details.to_json,
      ),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "invalidType" -> decode.success(TypeInvalidType)
    "textMessageEvent" -> decode.success(TypeTextMessageEvent)
    "tombstone" -> decode.success(TypeTombstone)
    "fanFundingEvent" -> decode.success(TypeFanFundingEvent)
    "chatEndedEvent" -> decode.success(TypeChatEndedEvent)
    "sponsorOnlyModeStartedEvent" ->
      decode.success(TypeSponsorOnlyModeStartedEvent)
    "sponsorOnlyModeEndedEvent" -> decode.success(TypeSponsorOnlyModeEndedEvent)
    "newSponsorEvent" -> decode.success(TypeNewSponsorEvent)
    "memberMilestoneChatEvent" -> decode.success(TypeMemberMilestoneChatEvent)
    "membershipGiftingEvent" -> decode.success(TypeMembershipGiftingEvent)
    "giftMembershipReceivedEvent" ->
      decode.success(TypeGiftMembershipReceivedEvent)
    "messageDeletedEvent" -> decode.success(TypeMessageDeletedEvent)
    "messageRetractedEvent" -> decode.success(TypeMessageRetractedEvent)
    "userBannedEvent" -> decode.success(TypeUserBannedEvent)
    "superChatEvent" -> decode.success(TypeSuperChatEvent)
    "superStickerEvent" -> decode.success(TypeSuperStickerEvent)
    "pollEvent" -> decode.success(TypePollEvent)
    "giftEvent" -> decode.success(TypeGiftEvent)
    _ -> decode.failure(TypeInvalidType, "a valid Type")
  }
}
