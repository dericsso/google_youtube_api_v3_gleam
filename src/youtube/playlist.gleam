//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/option
import youtube/playlist_content_details.{type PlaylistContentDetails}
import youtube/playlist_localization.{type PlaylistLocalization}
import youtube/playlist_player.{type PlaylistPlayer}
import youtube/playlist_snippet.{type PlaylistSnippet}
import youtube/playlist_status.{type PlaylistStatus}

/// A *playlist* resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. A playlist can contain up to 200 videos, and YouTube does not limit the number of playlists that each user creates. By default, playlists are publicly visible to other users, but playlists can be public or private. YouTube also uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history - watch later To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods.
pub type Playlist {
  Playlist(
    content_details: option.Option(PlaylistContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    localizations: option.Option(Dict(String, PlaylistLocalization)),
    player: option.Option(PlaylistPlayer),
    snippet: option.Option(PlaylistSnippet),
    status: option.Option(PlaylistStatus),
  )
}
