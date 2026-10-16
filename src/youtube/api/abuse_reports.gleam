//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/json
import gleam/list
import gleam/option
import google_youtube_api_v3/request.{type Request, Request}
import youtube/abuse_report.{type AbuseReport}

/// Inserts a new resource into this collection.
pub type InsertParams {
  InsertParams(part: List(String))
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(list.append(params.part, [value]))
}

pub fn insert_request(params: InsertParams, body: AbuseReport) -> Request {
  Request(
    http.Post,
    "youtube/v3/abuseReports",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(abuse_report.to_json(body))),
  )
}
