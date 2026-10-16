//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/memberships_level.{type MembershipsLevel}

pub type MembershipsLevelListResponse {
  MembershipsLevelListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(MembershipsLevel)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
