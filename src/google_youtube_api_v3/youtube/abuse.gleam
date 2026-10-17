//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type AbuseReport {
  AbuseReport(
    abuse_types: Option(List(AbuseType)),
    description: Option(String),
    related_entities: Option(List(RelatedEntity)),
    subject: Option(Entity),
  )
}

pub fn abuse_report_decoder() -> Decoder(AbuseReport) {
  use abuse_types <- decode.optional_field(
    "abuseTypes",
    option.None,
    decode.optional(decode.list(abuse_type_decoder())),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use related_entities <- decode.optional_field(
    "relatedEntities",
    option.None,
    decode.optional(decode.list(related_entity_decoder())),
  )
  use subject <- decode.optional_field(
    "subject",
    option.None,
    decode.optional(entity_decoder()),
  )
  decode.success(
    AbuseReport(abuse_types, description, related_entities, subject),
  )
}

pub fn abuse_report_to_json(value: AbuseReport) -> Json {
  json.object(
    [
      #(
        "abuseTypes",
        json.nullable(
          value.abuse_types,
          fn(items)
          { json.array(items, abuse_type_to_json) },
        ),
      ),
      #("description", json.nullable(value.description, json.string)),
      #(
        "relatedEntities",
        json.nullable(
          value.related_entities,
          fn(items)
          { json.array(items, related_entity_to_json) },
        ),
      ),
      #("subject", json.nullable(value.subject, entity_to_json)),
    ],
  )
}

pub type AbuseType {
  AbuseType(id: Option(String))
}

pub fn abuse_type_decoder() -> Decoder(AbuseType) {
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(AbuseType(id))
}

pub fn abuse_type_to_json(value: AbuseType) -> Json {
  json.object([#("id", json.nullable(value.id, json.string))])
}

pub type Entity {
  Entity(id: Option(String), type_id: Option(String), url: Option(String))
}

pub fn entity_decoder() -> Decoder(Entity) {
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use type_id <- decode.optional_field(
    "typeId",
    option.None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field(
    "url",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(Entity(id, type_id, url))
}

pub fn entity_to_json(value: Entity) -> Json {
  json.object(
    [
      #("id", json.nullable(value.id, json.string)),
      #("typeId", json.nullable(value.type_id, json.string)),
      #("url", json.nullable(value.url, json.string)),
    ],
  )
}

pub type RelatedEntity {
  RelatedEntity(entity: Option(Entity))
}

pub fn related_entity_decoder() -> Decoder(RelatedEntity) {
  use entity <- decode.optional_field(
    "entity",
    option.None,
    decode.optional(entity_decoder()),
  )
  decode.success(RelatedEntity(entity))
}

pub fn related_entity_to_json(value: RelatedEntity) -> Json {
  json.object([#("entity", json.nullable(value.entity, entity_to_json))])
}