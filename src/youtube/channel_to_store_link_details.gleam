//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/channel_to_store_link_details_billing_details.{type ChannelToStoreLinkDetailsBillingDetails}
import youtube/channel_to_store_link_details_merchant_affiliate_program_details.{type ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails}

/// Information specific to a store on a merchandising platform linked to a YouTube channel.
pub type ChannelToStoreLinkDetails {
  ChannelToStoreLinkDetails(
    billing_details: option.Option(ChannelToStoreLinkDetailsBillingDetails),
    merchant_affiliate_program_details:
    option.Option(ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails),
    merchant_id: option.Option(String),
    store_name: option.Option(String),
    store_url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelToStoreLinkDetails) {
  use billing_details <- optional_field(
    "billingDetails",
    option.None,
    optional(channel_to_store_link_details_billing_details.decoder()),
  )
  use merchant_affiliate_program_details <- optional_field(
    "merchantAffiliateProgramDetails",
    option.None,
    optional(
      channel_to_store_link_details_merchant_affiliate_program_details.decoder(),
    ),
  )
  use merchant_id <- optional_field("merchantId", option.None, optional(string))
  use store_name <- optional_field("storeName", option.None, optional(string))
  use store_url <- optional_field("storeUrl", option.None, optional(string))
  success(
    ChannelToStoreLinkDetails(
      billing_details,
      merchant_affiliate_program_details,
      merchant_id,
      store_name,
      store_url,
    ),
  )
}