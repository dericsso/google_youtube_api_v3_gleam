//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/playlist_content_details.{type PlaylistContentDetails}
import youtube/playlist_localization.{type PlaylistLocalization}
import youtube/playlist_player.{type PlaylistPlayer}
import youtube/playlist_snippet.{type PlaylistSnippet}
import youtube/playlist_status.{type PlaylistStatus}

/// A *playlist* resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. A playlist can contain up to 200 videos, and YouTube does not limit the number of playlists that each user creates. By default, playlists are publicly visible to other users, but playlists can be public or private. YouTube also uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history - watch later To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods.
pub type Playlist {
  Playlist(
    content_details: Option(PlaylistContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    localizations: Option(Dict(String, PlaylistLocalization)),
    player: Option(PlaylistPlayer),
    snippet: Option(PlaylistSnippet),
    status: Option(PlaylistStatus),
  )
}

pub fn decoder() -> Decoder(Playlist) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(playlist_content_details.decoder()),
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
  use localizations <- decode.optional_field(
    "localizations",
    option.None,
    decode.optional(decode.dict(decode.string, playlist_localization.decoder())),
  )
  use player <- decode.optional_field(
    "player",
    option.None,
    decode.optional(playlist_player.decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(playlist_snippet.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(playlist_status.decoder()),
  )
  decode.success(Playlist(
    content_details,
    etag,
    id,
    kind,
    localizations,
    player,
    snippet,
    status,
  ))
}

pub fn to_json(value: Playlist) -> Json {
  json.object([
    #(
      "contentDetails",
      json.nullable(value.content_details, playlist_content_details.to_json),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "localizations",
      json.nullable(value.localizations, fn(d) {
        json.dict(d, fn(k) { k }, playlist_localization.to_json)
      }),
    ),
    #("player", json.nullable(value.player, playlist_player.to_json)),
    #("snippet", json.nullable(value.snippet, playlist_snippet.to_json)),
    #("status", json.nullable(value.status, playlist_status.to_json)),
  ])
}
