import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/page_info.{type PageInfo}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}
import google_youtube_api_v3/youtube/thumbnail.{type ThumbnailDetails}
import google_youtube_api_v3/youtube/token_pagination.{type TokenPagination}

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

pub fn playlist_decoder() -> Decoder(Playlist) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(playlist_content_details_decoder()),
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
    decode.optional(decode.dict(decode.string, playlist_localization_decoder())),
  )
  use player <- decode.optional_field(
    "player",
    option.None,
    decode.optional(playlist_player_decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(playlist_snippet_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(playlist_status_decoder()),
  )
  decode.success(
    Playlist(
      content_details,
      etag,
      id,
      kind,
      localizations,
      player,
      snippet,
      status,
    ),
  )
}

pub fn playlist_to_json(value: Playlist) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(value.content_details, playlist_content_details_to_json),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "localizations",
        json.nullable(
          value.localizations,
          fn(d)
          { json.dict(d, fn(k) { k }, playlist_localization_to_json) },
        ),
      ),
      #("player", json.nullable(value.player, playlist_player_to_json)),
      #("snippet", json.nullable(value.snippet, playlist_snippet_to_json)),
      #("status", json.nullable(value.status, playlist_status_to_json)),
    ],
  )
}

pub type PlaylistContentDetails {
  PlaylistContentDetails(item_count: Option(Int))
}

pub fn playlist_content_details_decoder() -> Decoder(PlaylistContentDetails) {
  use item_count <- decode.optional_field(
    "itemCount",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(PlaylistContentDetails(item_count))
}

pub fn playlist_content_details_to_json(value: PlaylistContentDetails) -> Json {
  json.object([#("itemCount", json.nullable(value.item_count, json.int))])
}

pub type PlaylistImage {
  PlaylistImage(
    id: Option(String),
    kind: Option(String),
    snippet: Option(PlaylistImageSnippet),
  )
}

pub fn playlist_image_decoder() -> Decoder(PlaylistImage) {
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
    decode.optional(playlist_image_snippet_decoder()),
  )
  decode.success(PlaylistImage(id, kind, snippet))
}

pub fn playlist_image_to_json(value: PlaylistImage) -> Json {
  json.object(
    [
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, playlist_image_snippet_to_json)),
    ],
  )
}

pub type PlaylistImageListResponse {
  PlaylistImageListResponse(
    items: Option(List(PlaylistImage)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
  )
}

pub fn playlist_image_list_response_decoder() -> Decoder(
  PlaylistImageListResponse,
) {
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(playlist_image_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    PlaylistImageListResponse(
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
    ),
  )
}

pub fn playlist_image_list_response_to_json(value: PlaylistImageListResponse) -> Json {
  json.object(
    [
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, playlist_image_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
      #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
    ],
  )
}

/// A *playlistImage* resource identifies another resource, such as a image, that is associated with a playlist. In addition, the playlistImage resource contains details about the included resource that pertain specifically to how that resource is used in that playlist. YouTube uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistImages.list method to retrieve image data for any of those playlists. You can also add or remove images from those lists by calling the playlistImages.insert and playlistImages.delete methods.
pub type PlaylistImageSnippet {
  PlaylistImageSnippet(
    height: Option(Int),
    playlist_id: Option(String),
    type_: Option(Type),
    width: Option(Int),
  )
}

pub fn playlist_image_snippet_decoder() -> Decoder(PlaylistImageSnippet) {
  use height <- decode.optional_field(
    "height",
    option.None,
    decode.optional(decode.int),
  )
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  use width <- decode.optional_field(
    "width",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(PlaylistImageSnippet(height, playlist_id, type_, width))
}

pub fn playlist_image_snippet_to_json(value: PlaylistImageSnippet) -> Json {
  json.object(
    [
      #("height", json.nullable(value.height, json.int)),
      #("playlistId", json.nullable(value.playlist_id, json.string)),
      #(
        "type",
        json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
      ),
      #("width", json.nullable(value.width, json.int)),
    ],
  )
}

/// The image type.
pub type Type {
  TypeHero
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeHero -> "hero"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- decode.then(decode.string)
  case value {
    "hero" -> decode.success(TypeHero)
    _ -> decode.failure(TypeHero, "a valid Type")
  }
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

pub fn playlist_item_decoder() -> Decoder(PlaylistItem) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(playlist_item_content_details_decoder()),
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
    decode.optional(playlist_item_snippet_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(playlist_item_status_decoder()),
  )
  decode.success(PlaylistItem(content_details, etag, id, kind, snippet, status))
}

pub fn playlist_item_to_json(value: PlaylistItem) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(
          value.content_details,
          playlist_item_content_details_to_json,
        ),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, playlist_item_snippet_to_json)),
      #("status", json.nullable(value.status, playlist_item_status_to_json)),
    ],
  )
}

pub type PlaylistItemContentDetails {
  PlaylistItemContentDetails(
    end_at: Option(String),
    note: Option(String),
    start_at: Option(String),
    video_id: Option(String),
    video_published_at: Option(String),
  )
}

pub fn playlist_item_content_details_decoder() -> Decoder(
  PlaylistItemContentDetails,
) {
  use end_at <- decode.optional_field(
    "endAt",
    option.None,
    decode.optional(decode.string),
  )
  use note <- decode.optional_field(
    "note",
    option.None,
    decode.optional(decode.string),
  )
  use start_at <- decode.optional_field(
    "startAt",
    option.None,
    decode.optional(decode.string),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  use video_published_at <- decode.optional_field(
    "videoPublishedAt",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    PlaylistItemContentDetails(
      end_at,
      note,
      start_at,
      video_id,
      video_published_at,
    ),
  )
}

pub fn playlist_item_content_details_to_json(value: PlaylistItemContentDetails) -> Json {
  json.object(
    [
      #("endAt", json.nullable(value.end_at, json.string)),
      #("note", json.nullable(value.note, json.string)),
      #("startAt", json.nullable(value.start_at, json.string)),
      #("videoId", json.nullable(value.video_id, json.string)),
      #(
        "videoPublishedAt",
        json.nullable(value.video_published_at, json.string),
      ),
    ],
  )
}

pub type PlaylistItemListResponse {
  PlaylistItemListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(PlaylistItem)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn playlist_item_list_response_decoder() -> Decoder(
  PlaylistItemListResponse,
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
    decode.optional(decode.list(playlist_item_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    PlaylistItemListResponse(
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
      token_pagination,
      visitor_id,
    ),
  )
}

pub fn playlist_item_list_response_to_json(value: PlaylistItemListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, playlist_item_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
      #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
      #(
        "tokenPagination",
        json.nullable(
          value.token_pagination,
          token_pagination.token_pagination_to_json,
        ),
      ),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

/// Basic details about a playlist, including title, description and thumbnails. Basic details of a YouTube Playlist item provided by the author. Next ID: 15
pub type PlaylistItemSnippet {
  PlaylistItemSnippet(
    channel_id: Option(String),
    channel_title: Option(String),
    description: Option(String),
    playlist_id: Option(String),
    position: Option(Int),
    published_at: Option(String),
    resource_id: Option(ResourceId),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
    video_owner_channel_id: Option(String),
    video_owner_channel_title: Option(String),
  )
}

pub fn playlist_item_snippet_decoder() -> Decoder(PlaylistItemSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_title <- decode.optional_field(
    "channelTitle",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use position <- decode.optional_field(
    "position",
    option.None,
    decode.optional(decode.int),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.resource_id_decoder()),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail.thumbnail_details_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  use video_owner_channel_id <- decode.optional_field(
    "videoOwnerChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use video_owner_channel_title <- decode.optional_field(
    "videoOwnerChannelTitle",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    PlaylistItemSnippet(
      channel_id,
      channel_title,
      description,
      playlist_id,
      position,
      published_at,
      resource_id,
      thumbnails,
      title,
      video_owner_channel_id,
      video_owner_channel_title,
    ),
  )
}

pub fn playlist_item_snippet_to_json(value: PlaylistItemSnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("channelTitle", json.nullable(value.channel_title, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #("playlistId", json.nullable(value.playlist_id, json.string)),
      #("position", json.nullable(value.position, json.int)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "resourceId",
        json.nullable(value.resource_id, resource_id.resource_id_to_json),
      ),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
      #(
        "videoOwnerChannelId",
        json.nullable(value.video_owner_channel_id, json.string),
      ),
      #(
        "videoOwnerChannelTitle",
        json.nullable(value.video_owner_channel_title, json.string),
      ),
    ],
  )
}

/// Information about the playlist item's privacy status.
pub type PlaylistItemStatus {
  PlaylistItemStatus(privacy_status: Option(PlaylistItemStatusPrivacyStatus))
}

pub fn playlist_item_status_decoder() -> Decoder(PlaylistItemStatus) {
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(playlist_item_status_privacy_status_decoder()),
  )
  decode.success(PlaylistItemStatus(privacy_status))
}

pub fn playlist_item_status_to_json(value: PlaylistItemStatus) -> Json {
  json.object(
    [
      #(
        "privacyStatus",
        json.nullable(
          value.privacy_status,
          fn(e)
          { json.string(playlist_item_status_privacy_status_to_string(e)) },
        ),
      ),
    ],
  )
}

/// This resource's privacy status.
pub type PlaylistItemStatusPrivacyStatus {
  PlaylistItemStatusPrivacyStatusPublic
  PlaylistItemStatusPrivacyStatusUnlisted
  PlaylistItemStatusPrivacyStatusPrivate
}

pub fn playlist_item_status_privacy_status_to_string(
  value: PlaylistItemStatusPrivacyStatus,
) -> String {
  case value {
    PlaylistItemStatusPrivacyStatusPublic -> "public"
    PlaylistItemStatusPrivacyStatusUnlisted -> "unlisted"
    PlaylistItemStatusPrivacyStatusPrivate -> "private"
  }
}

pub fn playlist_item_status_privacy_status_decoder() -> Decoder(
  PlaylistItemStatusPrivacyStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "public" -> decode.success(PlaylistItemStatusPrivacyStatusPublic)
    "unlisted" -> decode.success(PlaylistItemStatusPrivacyStatusUnlisted)
    "private" -> decode.success(PlaylistItemStatusPrivacyStatusPrivate)
    _ -> decode.failure(
      PlaylistItemStatusPrivacyStatusPublic,
      "a valid PlaylistItemStatusPrivacyStatus",
    )
  }
}

pub type PlaylistListResponse {
  PlaylistListResponse(
    etag: Option(String),
    event_id: Option(String),
    items: Option(List(Playlist)),
    kind: Option(String),
    next_page_token: Option(String),
    page_info: Option(PageInfo),
    prev_page_token: Option(String),
    token_pagination: Option(TokenPagination),
    visitor_id: Option(String),
  )
}

pub fn playlist_list_response_decoder() -> Decoder(PlaylistListResponse) {
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
    decode.optional(decode.list(playlist_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use next_page_token <- decode.optional_field(
    "nextPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use page_info <- decode.optional_field(
    "pageInfo",
    option.None,
    decode.optional(page_info.page_info_decoder()),
  )
  use prev_page_token <- decode.optional_field(
    "prevPageToken",
    option.None,
    decode.optional(decode.string),
  )
  use token_pagination <- decode.optional_field(
    "tokenPagination",
    option.None,
    decode.optional(token_pagination.token_pagination_decoder()),
  )
  use visitor_id <- decode.optional_field(
    "visitorId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    PlaylistListResponse(
      etag,
      event_id,
      items,
      kind,
      next_page_token,
      page_info,
      prev_page_token,
      token_pagination,
      visitor_id,
    ),
  )
}

pub fn playlist_list_response_to_json(value: PlaylistListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("eventId", json.nullable(value.event_id, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, playlist_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
      #("nextPageToken", json.nullable(value.next_page_token, json.string)),
      #("pageInfo", json.nullable(value.page_info, page_info.page_info_to_json)),
      #("prevPageToken", json.nullable(value.prev_page_token, json.string)),
      #(
        "tokenPagination",
        json.nullable(
          value.token_pagination,
          token_pagination.token_pagination_to_json,
        ),
      ),
      #("visitorId", json.nullable(value.visitor_id, json.string)),
    ],
  )
}

/// Playlist localization setting
pub type PlaylistLocalization {
  PlaylistLocalization(description: Option(String), title: Option(String))
}

pub fn playlist_localization_decoder() -> Decoder(PlaylistLocalization) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistLocalization(description, title))
}

pub fn playlist_localization_to_json(value: PlaylistLocalization) -> Json {
  json.object(
    [
      #("description", json.nullable(value.description, json.string)),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}

pub type PlaylistPlayer {
  PlaylistPlayer(embed_html: Option(String))
}

pub fn playlist_player_decoder() -> Decoder(PlaylistPlayer) {
  use embed_html <- decode.optional_field(
    "embedHtml",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistPlayer(embed_html))
}

pub fn playlist_player_to_json(value: PlaylistPlayer) -> Json {
  json.object([#("embedHtml", json.nullable(value.embed_html, json.string))])
}

/// Basic details about a playlist, including title, description and thumbnails.
pub type PlaylistSnippet {
  PlaylistSnippet(
    channel_id: Option(String),
    channel_title: Option(String),
    default_language: Option(String),
    description: Option(String),
    localized: Option(PlaylistLocalization),
    published_at: Option(String),
    tags: Option(List(String)),
    thumbnail_video_id: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn playlist_snippet_decoder() -> Decoder(PlaylistSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_title <- decode.optional_field(
    "channelTitle",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(playlist_localization_decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use tags <- decode.optional_field(
    "tags",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use thumbnail_video_id <- decode.optional_field(
    "thumbnailVideoId",
    option.None,
    decode.optional(decode.string),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail.thumbnail_details_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    PlaylistSnippet(
      channel_id,
      channel_title,
      default_language,
      description,
      localized,
      published_at,
      tags,
      thumbnail_video_id,
      thumbnails,
      title,
    ),
  )
}

pub fn playlist_snippet_to_json(value: PlaylistSnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("channelTitle", json.nullable(value.channel_title, json.string)),
      #("defaultLanguage", json.nullable(value.default_language, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #(
        "localized",
        json.nullable(value.localized, playlist_localization_to_json),
      ),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "tags",
        json.nullable(value.tags, fn(items) { json.array(items, json.string) }),
      ),
      #(
        "thumbnailVideoId",
        json.nullable(value.thumbnail_video_id, json.string),
      ),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail.thumbnail_details_to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}

pub type PlaylistStatus {
  PlaylistStatus(
    podcast_status: Option(PodcastStatus),
    privacy_status: Option(PlaylistStatusPrivacyStatus),
  )
}

pub fn playlist_status_decoder() -> Decoder(PlaylistStatus) {
  use podcast_status <- decode.optional_field(
    "podcastStatus",
    option.None,
    decode.optional(podcast_status_decoder()),
  )
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(playlist_status_privacy_status_decoder()),
  )
  decode.success(PlaylistStatus(podcast_status, privacy_status))
}

pub fn playlist_status_to_json(value: PlaylistStatus) -> Json {
  json.object(
    [
      #(
        "podcastStatus",
        json.nullable(
          value.podcast_status,
          fn(e)
          { json.string(podcast_status_to_string(e)) },
        ),
      ),
      #(
        "privacyStatus",
        json.nullable(
          value.privacy_status,
          fn(e)
          { json.string(playlist_status_privacy_status_to_string(e)) },
        ),
      ),
    ],
  )
}

/// The playlist's podcast status.
pub type PodcastStatus {
  PodcastStatusEnabled
  PodcastStatusDisabled
}

pub fn podcast_status_to_string(value: PodcastStatus) -> String {
  case value {
    PodcastStatusEnabled -> "enabled"
    PodcastStatusDisabled -> "disabled"
  }
}

pub fn podcast_status_decoder() -> Decoder(PodcastStatus) {
  use value <- decode.then(decode.string)
  case value {
    "enabled" -> decode.success(PodcastStatusEnabled)
    "disabled" -> decode.success(PodcastStatusDisabled)
    _ -> decode.failure(PodcastStatusEnabled, "a valid PodcastStatus")
  }
}

/// The playlist's privacy status.
pub type PlaylistStatusPrivacyStatus {
  PlaylistStatusPrivacyStatusPublic
  PlaylistStatusPrivacyStatusUnlisted
  PlaylistStatusPrivacyStatusPrivate
}

pub fn playlist_status_privacy_status_to_string(
  value: PlaylistStatusPrivacyStatus,
) -> String {
  case value {
    PlaylistStatusPrivacyStatusPublic -> "public"
    PlaylistStatusPrivacyStatusUnlisted -> "unlisted"
    PlaylistStatusPrivacyStatusPrivate -> "private"
  }
}

pub fn playlist_status_privacy_status_decoder() -> Decoder(
  PlaylistStatusPrivacyStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "public" -> decode.success(PlaylistStatusPrivacyStatusPublic)
    "unlisted" -> decode.success(PlaylistStatusPrivacyStatusUnlisted)
    "private" -> decode.success(PlaylistStatusPrivacyStatusPrivate)
    _ -> decode.failure(
      PlaylistStatusPrivacyStatusPublic,
      "a valid PlaylistStatusPrivacyStatus",
    )
  }
}