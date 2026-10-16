//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/page_info.{type PageInfo}
import youtube/playlist_image.{type PlaylistImage}

pub type PlaylistImageListResponse {
  PlaylistImageListResponse(
    items: option.Option(List(PlaylistImage)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    prev_page_token: option.Option(String),
  )
}
