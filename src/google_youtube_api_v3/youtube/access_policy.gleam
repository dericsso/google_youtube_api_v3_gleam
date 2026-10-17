//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Rights management policy for YouTube resources.
pub type AccessPolicy {
  AccessPolicy(allowed: Option(Bool), exception: Option(List(String)))
}

pub fn decoder() -> Decoder(AccessPolicy) {
  use allowed <- decode.optional_field(
    "allowed",
    option.None,
    decode.optional(decode.bool),
  )
  use exception <- decode.optional_field(
    "exception",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(AccessPolicy(allowed, exception))
}

pub fn to_json(value: AccessPolicy) -> Json {
  json.object(
    [
      #("allowed", json.nullable(value.allowed, json.bool)),
      #(
        "exception",
        json.nullable(
          value.exception,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
    ],
  )
}