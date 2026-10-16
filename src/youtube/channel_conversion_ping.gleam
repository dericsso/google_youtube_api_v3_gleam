//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
pub type ChannelConversionPing {
  ChannelConversionPing(
    context: Option(Context),
    conversion_url: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelConversionPing) {
  use context <- decode.optional_field(
    "context",
    option.None,
    decode.optional(context_decoder()),
  )
  use conversion_url <- decode.optional_field(
    "conversionUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelConversionPing(context, conversion_url))
}

pub fn to_json(value: ChannelConversionPing) -> Json {
  json.object([
    #(
      "context",
      json.nullable(value.context, fn(e) { json.string(context_to_string(e)) }),
    ),
    #("conversionUrl", json.nullable(value.conversion_url, json.string)),
  ])
}

/// Defines the context of the ping.
pub type Context {
  ContextSubscribe
  ContextUnsubscribe
  ContextCview
}

pub fn context_to_string(value: Context) -> String {
  case value {
    ContextSubscribe -> "subscribe"
    ContextUnsubscribe -> "unsubscribe"
    ContextCview -> "cview"
  }
}

pub fn context_decoder() -> Decoder(Context) {
  use value <- decode.then(decode.string)
  case value {
    "subscribe" -> decode.success(ContextSubscribe)
    "unsubscribe" -> decode.success(ContextUnsubscribe)
    "cview" -> decode.success(ContextCview)
    _ -> decode.failure(ContextSubscribe, "a valid Context")
  }
}
