//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/comment.{type Comment}
import youtube/page_info.{type PageInfo}
import youtube/token_pagination.{type TokenPagination}

pub type CommentListResponse {
  CommentListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(Comment)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}
