//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/abuse_type.{type AbuseType}
import google_youtube_api_v3/youtube/entity.{type Entity}
import google_youtube_api_v3/youtube/related_entity.{type RelatedEntity}

pub type AbuseReport {
  AbuseReport(
    abuse_types: Option(List(AbuseType)),
    description: Option(String),
    related_entities: Option(List(RelatedEntity)),
    subject: Option(Entity),
  )
}

pub fn decoder() -> Decoder(AbuseReport) {
  use abuse_types <- decode.optional_field(
    "abuseTypes",
    option.None,
    decode.optional(decode.list(abuse_type.decoder())),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use related_entities <- decode.optional_field(
    "relatedEntities",
    option.None,
    decode.optional(decode.list(related_entity.decoder())),
  )
  use subject <- decode.optional_field(
    "subject",
    option.None,
    decode.optional(entity.decoder()),
  )
  decode.success(
    AbuseReport(abuse_types, description, related_entities, subject),
  )
}

pub fn to_json(value: AbuseReport) -> Json {
  json.object(
    [
      #(
        "abuseTypes",
        json.nullable(
          value.abuse_types,
          fn(items)
          { json.array(items, abuse_type.to_json) },
        ),
      ),
      #("description", json.nullable(value.description, json.string)),
      #(
        "relatedEntities",
        json.nullable(
          value.related_entities,
          fn(items)
          { json.array(items, related_entity.to_json) },
        ),
      ),
      #("subject", json.nullable(value.subject, entity.to_json)),
    ],
  )
}