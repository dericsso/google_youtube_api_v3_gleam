//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_to_store_link_details_billing_details.{
  type ChannelToStoreLinkDetailsBillingDetails,
}
import google_youtube_api_v3/youtube/channel_to_store_link_details_merchant_affiliate_program_details.{
  type ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
}

/// Information specific to a store on a merchandising platform linked to a YouTube channel.
pub type ChannelToStoreLinkDetails {
  ChannelToStoreLinkDetails(
    billing_details: Option(ChannelToStoreLinkDetailsBillingDetails),
    merchant_affiliate_program_details: Option(
      ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
    ),
    merchant_id: Option(String),
    store_name: Option(String),
    store_url: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelToStoreLinkDetails) {
  use billing_details <- decode.optional_field(
    "billingDetails",
    option.None,
    decode.optional(channel_to_store_link_details_billing_details.decoder()),
  )
  use merchant_affiliate_program_details <- decode.optional_field(
    "merchantAffiliateProgramDetails",
    option.None,
    decode.optional(
      channel_to_store_link_details_merchant_affiliate_program_details.decoder(),
    ),
  )
  use merchant_id <- decode.optional_field(
    "merchantId",
    option.None,
    decode.optional(decode.string),
  )
  use store_name <- decode.optional_field(
    "storeName",
    option.None,
    decode.optional(decode.string),
  )
  use store_url <- decode.optional_field(
    "storeUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelToStoreLinkDetails(
    billing_details,
    merchant_affiliate_program_details,
    merchant_id,
    store_name,
    store_url,
  ))
}

pub fn to_json(value: ChannelToStoreLinkDetails) -> Json {
  json.object([
    #(
      "billingDetails",
      json.nullable(
        value.billing_details,
        channel_to_store_link_details_billing_details.to_json,
      ),
    ),
    #(
      "merchantAffiliateProgramDetails",
      json.nullable(
        value.merchant_affiliate_program_details,
        channel_to_store_link_details_merchant_affiliate_program_details.to_json,
      ),
    ),
    #("merchantId", json.nullable(value.merchant_id, json.string)),
    #("storeName", json.nullable(value.store_name, json.string)),
    #("storeUrl", json.nullable(value.store_url, json.string)),
  ])
}
