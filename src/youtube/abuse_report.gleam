//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/abuse_type.{type AbuseType}
import youtube/entity.{type Entity}
import youtube/related_entity.{type RelatedEntity}

pub type AbuseReport {
  AbuseReport(
    abuse_types: option.Option(List(AbuseType)),
    description: option.Option(String),
    related_entities: option.Option(List(RelatedEntity)),
    subject: option.Option(Entity),
  )
}

pub fn decoder() -> Decoder(AbuseReport) {
  use abuse_types <- optional_field(
    "abuseTypes",
    option.None,
    optional(list(abuse_type.decoder())),
  )
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use related_entities <- optional_field(
    "relatedEntities",
    option.None,
    optional(list(related_entity.decoder())),
  )
  use subject <- optional_field(
    "subject",
    option.None,
    optional(entity.decoder()),
  )
  success(AbuseReport(abuse_types, description, related_entities, subject))
}