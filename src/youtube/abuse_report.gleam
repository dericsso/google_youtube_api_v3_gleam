//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
