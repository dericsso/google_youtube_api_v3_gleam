//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
pub type ChannelConversionPing {
  ChannelConversionPing(
    context: option.Option(String),
    conversion_url: option.Option(String),
  )
}
