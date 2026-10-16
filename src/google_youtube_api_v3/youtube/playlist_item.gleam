//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/playlist_item_content_details.{
  type PlaylistItemContentDetails,
}
import google_youtube_api_v3/youtube/playlist_item_snippet.{
  type PlaylistItemSnippet,
}
import google_youtube_api_v3/youtube/playlist_item_status.{
  type PlaylistItemStatus,
}

/// A *playlistItem* resource identifies another resource, such as a video, that is included in a playlist. In addition, the playlistItem resource contains details about the included resource that pertain specifically to how that resource is used in that playlist. YouTube uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history - watch later To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods. For example, if a user gives a positive rating to a video, you would insert that video into the liked videos playlist for that user's channel.
pub type PlaylistItem {
  PlaylistItem(
    content_details: Option(PlaylistItemContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(PlaylistItemSnippet),
    status: Option(PlaylistItemStatus),
  )
}

pub fn decoder() -> Decoder(PlaylistItem) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(playlist_item_content_details.decoder()),
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
    decode.optional(playlist_item_snippet.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(playlist_item_status.decoder()),
  )
  decode.success(PlaylistItem(content_details, etag, id, kind, snippet, status))
}

pub fn to_json(value: PlaylistItem) -> Json {
  json.object([
    #(
      "contentDetails",
      json.nullable(
        value.content_details,
        playlist_item_content_details.to_json,
      ),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, playlist_item_snippet.to_json)),
    #("status", json.nullable(value.status, playlist_item_status.to_json)),
  ])
}
