//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LevelDetails {
  LevelDetails(display_name: Option(String))
}

pub fn level_details_decoder() -> Decoder(LevelDetails) {
  use display_name <- decode.optional_field(
    "displayName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LevelDetails(display_name))
}

pub fn level_details_to_json(value: LevelDetails) -> Json {
  json.object(
    [#("displayName", json.nullable(value.display_name, json.string))],
  )
}

pub type MembershipsDetails {
  MembershipsDetails(
    accessible_levels: Option(List(String)),
    highest_accessible_level: Option(String),
    highest_accessible_level_display_name: Option(String),
    memberships_duration: Option(MembershipsDuration),
    memberships_duration_at_levels: Option(List(MembershipsDurationAtLevel)),
  )
}

pub fn memberships_details_decoder() -> Decoder(MembershipsDetails) {
  use accessible_levels <- decode.optional_field(
    "accessibleLevels",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use highest_accessible_level <- decode.optional_field(
    "highestAccessibleLevel",
    option.None,
    decode.optional(decode.string),
  )
  use highest_accessible_level_display_name <- decode.optional_field(
    "highestAccessibleLevelDisplayName",
    option.None,
    decode.optional(decode.string),
  )
  use memberships_duration <- decode.optional_field(
    "membershipsDuration",
    option.None,
    decode.optional(memberships_duration_decoder()),
  )
  use memberships_duration_at_levels <- decode.optional_field(
    "membershipsDurationAtLevels",
    option.None,
    decode.optional(decode.list(memberships_duration_at_level_decoder())),
  )
  decode.success(
    MembershipsDetails(
      accessible_levels,
      highest_accessible_level,
      highest_accessible_level_display_name,
      memberships_duration,
      memberships_duration_at_levels,
    ),
  )
}

pub fn memberships_details_to_json(value: MembershipsDetails) -> Json {
  json.object(
    [
      #(
        "accessibleLevels",
        json.nullable(
          value.accessible_levels,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #(
        "highestAccessibleLevel",
        json.nullable(value.highest_accessible_level, json.string),
      ),
      #(
        "highestAccessibleLevelDisplayName",
        json.nullable(value.highest_accessible_level_display_name, json.string),
      ),
      #(
        "membershipsDuration",
        json.nullable(value.memberships_duration, memberships_duration_to_json),
      ),
      #(
        "membershipsDurationAtLevels",
        json.nullable(
          value.memberships_duration_at_levels,
          fn(items)
          { json.array(items, memberships_duration_at_level_to_json) },
        ),
      ),
    ],
  )
}

pub type MembershipsDuration {
  MembershipsDuration(
    member_since: Option(String),
    member_total_duration_months: Option(Int),
  )
}

pub fn memberships_duration_decoder() -> Decoder(MembershipsDuration) {
  use member_since <- decode.optional_field(
    "memberSince",
    option.None,
    decode.optional(decode.string),
  )
  use member_total_duration_months <- decode.optional_field(
    "memberTotalDurationMonths",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(
    MembershipsDuration(member_since, member_total_duration_months),
  )
}

pub fn memberships_duration_to_json(value: MembershipsDuration) -> Json {
  json.object(
    [
      #("memberSince", json.nullable(value.member_since, json.string)),
      #(
        "memberTotalDurationMonths",
        json.nullable(value.member_total_duration_months, json.int),
      ),
    ],
  )
}

pub type MembershipsDurationAtLevel {
  MembershipsDurationAtLevel(
    level: Option(String),
    member_since: Option(String),
    member_total_duration_months: Option(Int),
  )
}

pub fn memberships_duration_at_level_decoder() -> Decoder(
  MembershipsDurationAtLevel,
) {
  use level <- decode.optional_field(
    "level",
    option.None,
    decode.optional(decode.string),
  )
  use member_since <- decode.optional_field(
    "memberSince",
    option.None,
    decode.optional(decode.string),
  )
  use member_total_duration_months <- decode.optional_field(
    "memberTotalDurationMonths",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(
    MembershipsDurationAtLevel(
      level,
      member_since,
      member_total_duration_months,
    ),
  )
}

pub fn memberships_duration_at_level_to_json(value: MembershipsDurationAtLevel) -> Json {
  json.object(
    [
      #("level", json.nullable(value.level, json.string)),
      #("memberSince", json.nullable(value.member_since, json.string)),
      #(
        "memberTotalDurationMonths",
        json.nullable(value.member_total_duration_months, json.int),
      ),
    ],
  )
}

/// A *membershipsLevel* resource represents an offer made by YouTube creators for their fans. Users can become members of the channel by joining one of the available levels. They will provide recurring monetary support and receives special benefits.
pub type MembershipsLevel {
  MembershipsLevel(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(MembershipsLevelSnippet),
  )
}

pub fn memberships_level_decoder() -> Decoder(MembershipsLevel) {
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
    decode.optional(memberships_level_snippet_decoder()),
  )
  decode.success(MembershipsLevel(etag, id, kind, snippet))
}

pub fn memberships_level_to_json(value: MembershipsLevel) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, memberships_level_snippet_to_json),
      ),
    ],
  )
}

pub type MembershipsLevelListResponse {
  MembershipsLevelListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(MembershipsLevel)),
    kind: Option(String),
    visitor_id: Option(String),
  )
}

pub fn memberships_level_list_response_decoder() -> Decoder(
  MembershipsLevelListResponse,
) {
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
    decode.optional(decode.list(memberships_level_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    MembershipsLevelListResponse(etag, event_id, items, kind, visitor_id),
  )
}

pub fn memberships_level_list_response_to_json(
  value: MembershipsLevelListResponse,
) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, memberships_level_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

pub type MembershipsLevelSnippet {
  MembershipsLevelSnippet(
    creator_channel_id: Option(String),
    level_details: Option(LevelDetails),
  )
}

pub fn memberships_level_snippet_decoder() -> Decoder(MembershipsLevelSnippet) {
  use creator_channel_id <- decode.optional_field(
    "creatorChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use level_details <- decode.optional_field(
    "levelDetails",
    option.None,
    decode.optional(level_details_decoder()),
  )
  decode.success(MembershipsLevelSnippet(creator_channel_id, level_details))
}

pub fn memberships_level_snippet_to_json(value: MembershipsLevelSnippet) -> Json {
  json.object(
    [
      #(
        "creatorChannelId",
        json.nullable(value.creator_channel_id, json.string),
      ),
      #(
        "levelDetails",
        json.nullable(value.level_details, level_details_to_json),
      ),
    ],
  )
}