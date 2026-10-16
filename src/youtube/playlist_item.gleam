//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/playlist_item_content_details.{type PlaylistItemContentDetails}
import youtube/playlist_item_snippet.{type PlaylistItemSnippet}
import youtube/playlist_item_status.{type PlaylistItemStatus}

/// A *playlistItem* resource identifies another resource, such as a video, that is included in a playlist. In addition, the playlistItem resource contains details about the included resource that pertain specifically to how that resource is used in that playlist. YouTube uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history - watch later To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods. For example, if a user gives a positive rating to a video, you would insert that video into the liked videos playlist for that user's channel.
pub type PlaylistItem {
  PlaylistItem(
    content_details: option.Option(PlaylistItemContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(PlaylistItemSnippet),
    status: option.Option(PlaylistItemStatus),
  )
}

pub fn decoder() -> Decoder(PlaylistItem) {
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(playlist_item_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(playlist_item_snippet.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(playlist_item_status.decoder()),
  )
  success(PlaylistItem(content_details, etag, id, kind, snippet, status))
}