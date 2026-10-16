//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
pub type ChannelConversionPing {
  ChannelConversionPing(
    context: option.Option(Context),
    conversion_url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelConversionPing) {
  use context <- optional_field(
    "context",
    option.None,
    optional(context_decoder()),
  )
  use conversion_url <- optional_field(
    "conversionUrl",
    option.None,
    optional(string),
  )
  success(ChannelConversionPing(context, conversion_url))
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
  use value <- then(string)
  case value {
    "subscribe" -> success(ContextSubscribe)
    "unsubscribe" -> success(ContextUnsubscribe)
    "cview" -> success(ContextCview)
    _ -> failure(ContextSubscribe, "a valid Context")
  }
}