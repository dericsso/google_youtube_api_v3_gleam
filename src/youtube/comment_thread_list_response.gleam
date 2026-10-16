//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/comment_thread.{type CommentThread}
import youtube/page_info.{type PageInfo}
import youtube/token_pagination.{type TokenPagination}

pub type CommentThreadListResponse {
  CommentThreadListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(CommentThread)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}
