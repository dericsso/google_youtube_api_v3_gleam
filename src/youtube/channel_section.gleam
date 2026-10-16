//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dict.{type Dict}
import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/channel_section_content_details.{
  type ChannelSectionContentDetails,
}
import youtube/channel_section_localization.{type ChannelSectionLocalization}
import youtube/channel_section_snippet.{type ChannelSectionSnippet}
import youtube/channel_section_targeting.{type ChannelSectionTargeting}

pub type ChannelSection {
  ChannelSection(
    content_details: Option(ChannelSectionContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    localizations: Option(Dict(String, ChannelSectionLocalization)),
    snippet: Option(ChannelSectionSnippet),
    targeting: Option(ChannelSectionTargeting),
  )
}

pub fn decoder() -> Decoder(ChannelSection) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(channel_section_content_details.decoder()),
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
    decode.optional(decode.dict(
      decode.string,
      channel_section_localization.decoder(),
    )),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(channel_section_snippet.decoder()),
  )
  use targeting <- decode.optional_field(
    "targeting",
    option.None,
    decode.optional(channel_section_targeting.decoder()),
  )
  decode.success(ChannelSection(
    content_details,
    etag,
    id,
    kind,
    localizations,
    snippet,
    targeting,
  ))
}

pub fn to_json(value: ChannelSection) -> Json {
  json.object([
    #(
      "contentDetails",
      json.nullable(
        value.content_details,
        channel_section_content_details.to_json,
      ),
    ),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #(
      "localizations",
      json.nullable(value.localizations, fn(d) {
        json.dict(d, fn(k) { k }, channel_section_localization.to_json)
      }),
    ),
    #("snippet", json.nullable(value.snippet, channel_section_snippet.to_json)),
    #(
      "targeting",
      json.nullable(value.targeting, channel_section_targeting.to_json),
    ),
  ])
}
