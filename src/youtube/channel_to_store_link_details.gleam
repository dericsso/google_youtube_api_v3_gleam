//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_to_store_link_details_billing_details.{
  type ChannelToStoreLinkDetailsBillingDetails,
}
import youtube/channel_to_store_link_details_merchant_affiliate_program_details.{
  type ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
}

/// Information specific to a store on a merchandising platform linked to a YouTube channel.
pub type ChannelToStoreLinkDetails {
  ChannelToStoreLinkDetails(
    billing_details: option.Option(ChannelToStoreLinkDetailsBillingDetails),
    merchant_affiliate_program_details: option.Option(
      ChannelToStoreLinkDetailsMerchantAffiliateProgramDetails,
    ),
    merchant_id: option.Option(String),
    store_name: option.Option(String),
    store_url: option.Option(String),
  )
}
