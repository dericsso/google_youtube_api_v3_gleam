//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/member.{type Member}
import youtube/page_info.{type PageInfo}
import youtube/token_pagination.{type TokenPagination}

pub type MemberListResponse {
  MemberListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(Member)),
    kind: option.Option(String),
    next_page_token: option.Option(String),
    page_info: option.Option(PageInfo),
    token_pagination: option.Option(TokenPagination),
    visitor_id: option.Option(String),
  )
}
