//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Ratings schemes. The country-specific ratings are mostly for movies and shows. LINT.IfChange
pub type ContentRating {
  ContentRating(
    acb_rating: Option(AcbRating),
    agcom_rating: Option(AgcomRating),
    anatel_rating: Option(AnatelRating),
    bbfc_rating: Option(BbfcRating),
    bfvc_rating: Option(BfvcRating),
    bmukk_rating: Option(BmukkRating),
    catv_rating: Option(CatvRating),
    catvfr_rating: Option(CatvfrRating),
    cbfc_rating: Option(CbfcRating),
    ccc_rating: Option(CccRating),
    cce_rating: Option(CceRating),
    chfilm_rating: Option(ChfilmRating),
    chvrs_rating: Option(ChvrsRating),
    cicf_rating: Option(CicfRating),
    cna_rating: Option(CnaRating),
    cnc_rating: Option(CncRating),
    csa_rating: Option(CsaRating),
    cscf_rating: Option(CscfRating),
    czfilm_rating: Option(CzfilmRating),
    djctq_rating: Option(DjctqRating),
    djctq_rating_reasons: Option(List(DjctqRatingReasons)),
    ecbmct_rating: Option(EcbmctRating),
    eefilm_rating: Option(EefilmRating),
    egfilm_rating: Option(EgfilmRating),
    eirin_rating: Option(EirinRating),
    fcbm_rating: Option(FcbmRating),
    fco_rating: Option(FcoRating),
    fmoc_rating: Option(FmocRating),
    fpb_rating: Option(FpbRating),
    fpb_rating_reasons: Option(List(FpbRatingReasons)),
    fsk_rating: Option(FskRating),
    grfilm_rating: Option(GrfilmRating),
    icaa_rating: Option(IcaaRating),
    ifco_rating: Option(IfcoRating),
    ilfilm_rating: Option(IlfilmRating),
    incaa_rating: Option(IncaaRating),
    kfcb_rating: Option(KfcbRating),
    kijkwijzer_rating: Option(KijkwijzerRating),
    kmrb_rating: Option(KmrbRating),
    lsf_rating: Option(LsfRating),
    mccaa_rating: Option(MccaaRating),
    mccyp_rating: Option(MccypRating),
    mcst_rating: Option(McstRating),
    mda_rating: Option(MdaRating),
    medietilsynet_rating: Option(MedietilsynetRating),
    meku_rating: Option(MekuRating),
    mena_mpaa_rating: Option(MenaMpaaRating),
    mibac_rating: Option(MibacRating),
    moc_rating: Option(MocRating),
    moctw_rating: Option(MoctwRating),
    mpaa_rating: Option(MpaaRating),
    mpaat_rating: Option(MpaatRating),
    mtrcb_rating: Option(MtrcbRating),
    nbc_rating: Option(NbcRating),
    nbcpl_rating: Option(NbcplRating),
    nfrc_rating: Option(NfrcRating),
    nfvcb_rating: Option(NfvcbRating),
    nkclv_rating: Option(NkclvRating),
    nmc_rating: Option(NmcRating),
    oflc_rating: Option(OflcRating),
    pefilm_rating: Option(PefilmRating),
    rcnof_rating: Option(RcnofRating),
    resorteviolencia_rating: Option(ResorteviolenciaRating),
    rtc_rating: Option(RtcRating),
    rte_rating: Option(RteRating),
    russia_rating: Option(RussiaRating),
    skfilm_rating: Option(SkfilmRating),
    smais_rating: Option(SmaisRating),
    smsa_rating: Option(SmsaRating),
    tvpg_rating: Option(TvpgRating),
    yt_rating: Option(YtRating),
  )
}

pub fn decoder() -> Decoder(ContentRating) {
  use acb_rating <- decode.optional_field(
    "acbRating",
    option.None,
    decode.optional(acb_rating_decoder()),
  )
  use agcom_rating <- decode.optional_field(
    "agcomRating",
    option.None,
    decode.optional(agcom_rating_decoder()),
  )
  use anatel_rating <- decode.optional_field(
    "anatelRating",
    option.None,
    decode.optional(anatel_rating_decoder()),
  )
  use bbfc_rating <- decode.optional_field(
    "bbfcRating",
    option.None,
    decode.optional(bbfc_rating_decoder()),
  )
  use bfvc_rating <- decode.optional_field(
    "bfvcRating",
    option.None,
    decode.optional(bfvc_rating_decoder()),
  )
  use bmukk_rating <- decode.optional_field(
    "bmukkRating",
    option.None,
    decode.optional(bmukk_rating_decoder()),
  )
  use catv_rating <- decode.optional_field(
    "catvRating",
    option.None,
    decode.optional(catv_rating_decoder()),
  )
  use catvfr_rating <- decode.optional_field(
    "catvfrRating",
    option.None,
    decode.optional(catvfr_rating_decoder()),
  )
  use cbfc_rating <- decode.optional_field(
    "cbfcRating",
    option.None,
    decode.optional(cbfc_rating_decoder()),
  )
  use ccc_rating <- decode.optional_field(
    "cccRating",
    option.None,
    decode.optional(ccc_rating_decoder()),
  )
  use cce_rating <- decode.optional_field(
    "cceRating",
    option.None,
    decode.optional(cce_rating_decoder()),
  )
  use chfilm_rating <- decode.optional_field(
    "chfilmRating",
    option.None,
    decode.optional(chfilm_rating_decoder()),
  )
  use chvrs_rating <- decode.optional_field(
    "chvrsRating",
    option.None,
    decode.optional(chvrs_rating_decoder()),
  )
  use cicf_rating <- decode.optional_field(
    "cicfRating",
    option.None,
    decode.optional(cicf_rating_decoder()),
  )
  use cna_rating <- decode.optional_field(
    "cnaRating",
    option.None,
    decode.optional(cna_rating_decoder()),
  )
  use cnc_rating <- decode.optional_field(
    "cncRating",
    option.None,
    decode.optional(cnc_rating_decoder()),
  )
  use csa_rating <- decode.optional_field(
    "csaRating",
    option.None,
    decode.optional(csa_rating_decoder()),
  )
  use cscf_rating <- decode.optional_field(
    "cscfRating",
    option.None,
    decode.optional(cscf_rating_decoder()),
  )
  use czfilm_rating <- decode.optional_field(
    "czfilmRating",
    option.None,
    decode.optional(czfilm_rating_decoder()),
  )
  use djctq_rating <- decode.optional_field(
    "djctqRating",
    option.None,
    decode.optional(djctq_rating_decoder()),
  )
  use djctq_rating_reasons <- decode.optional_field(
    "djctqRatingReasons",
    option.None,
    decode.optional(decode.list(djctq_rating_reasons_decoder())),
  )
  use ecbmct_rating <- decode.optional_field(
    "ecbmctRating",
    option.None,
    decode.optional(ecbmct_rating_decoder()),
  )
  use eefilm_rating <- decode.optional_field(
    "eefilmRating",
    option.None,
    decode.optional(eefilm_rating_decoder()),
  )
  use egfilm_rating <- decode.optional_field(
    "egfilmRating",
    option.None,
    decode.optional(egfilm_rating_decoder()),
  )
  use eirin_rating <- decode.optional_field(
    "eirinRating",
    option.None,
    decode.optional(eirin_rating_decoder()),
  )
  use fcbm_rating <- decode.optional_field(
    "fcbmRating",
    option.None,
    decode.optional(fcbm_rating_decoder()),
  )
  use fco_rating <- decode.optional_field(
    "fcoRating",
    option.None,
    decode.optional(fco_rating_decoder()),
  )
  use fmoc_rating <- decode.optional_field(
    "fmocRating",
    option.None,
    decode.optional(fmoc_rating_decoder()),
  )
  use fpb_rating <- decode.optional_field(
    "fpbRating",
    option.None,
    decode.optional(fpb_rating_decoder()),
  )
  use fpb_rating_reasons <- decode.optional_field(
    "fpbRatingReasons",
    option.None,
    decode.optional(decode.list(fpb_rating_reasons_decoder())),
  )
  use fsk_rating <- decode.optional_field(
    "fskRating",
    option.None,
    decode.optional(fsk_rating_decoder()),
  )
  use grfilm_rating <- decode.optional_field(
    "grfilmRating",
    option.None,
    decode.optional(grfilm_rating_decoder()),
  )
  use icaa_rating <- decode.optional_field(
    "icaaRating",
    option.None,
    decode.optional(icaa_rating_decoder()),
  )
  use ifco_rating <- decode.optional_field(
    "ifcoRating",
    option.None,
    decode.optional(ifco_rating_decoder()),
  )
  use ilfilm_rating <- decode.optional_field(
    "ilfilmRating",
    option.None,
    decode.optional(ilfilm_rating_decoder()),
  )
  use incaa_rating <- decode.optional_field(
    "incaaRating",
    option.None,
    decode.optional(incaa_rating_decoder()),
  )
  use kfcb_rating <- decode.optional_field(
    "kfcbRating",
    option.None,
    decode.optional(kfcb_rating_decoder()),
  )
  use kijkwijzer_rating <- decode.optional_field(
    "kijkwijzerRating",
    option.None,
    decode.optional(kijkwijzer_rating_decoder()),
  )
  use kmrb_rating <- decode.optional_field(
    "kmrbRating",
    option.None,
    decode.optional(kmrb_rating_decoder()),
  )
  use lsf_rating <- decode.optional_field(
    "lsfRating",
    option.None,
    decode.optional(lsf_rating_decoder()),
  )
  use mccaa_rating <- decode.optional_field(
    "mccaaRating",
    option.None,
    decode.optional(mccaa_rating_decoder()),
  )
  use mccyp_rating <- decode.optional_field(
    "mccypRating",
    option.None,
    decode.optional(mccyp_rating_decoder()),
  )
  use mcst_rating <- decode.optional_field(
    "mcstRating",
    option.None,
    decode.optional(mcst_rating_decoder()),
  )
  use mda_rating <- decode.optional_field(
    "mdaRating",
    option.None,
    decode.optional(mda_rating_decoder()),
  )
  use medietilsynet_rating <- decode.optional_field(
    "medietilsynetRating",
    option.None,
    decode.optional(medietilsynet_rating_decoder()),
  )
  use meku_rating <- decode.optional_field(
    "mekuRating",
    option.None,
    decode.optional(meku_rating_decoder()),
  )
  use mena_mpaa_rating <- decode.optional_field(
    "menaMpaaRating",
    option.None,
    decode.optional(mena_mpaa_rating_decoder()),
  )
  use mibac_rating <- decode.optional_field(
    "mibacRating",
    option.None,
    decode.optional(mibac_rating_decoder()),
  )
  use moc_rating <- decode.optional_field(
    "mocRating",
    option.None,
    decode.optional(moc_rating_decoder()),
  )
  use moctw_rating <- decode.optional_field(
    "moctwRating",
    option.None,
    decode.optional(moctw_rating_decoder()),
  )
  use mpaa_rating <- decode.optional_field(
    "mpaaRating",
    option.None,
    decode.optional(mpaa_rating_decoder()),
  )
  use mpaat_rating <- decode.optional_field(
    "mpaatRating",
    option.None,
    decode.optional(mpaat_rating_decoder()),
  )
  use mtrcb_rating <- decode.optional_field(
    "mtrcbRating",
    option.None,
    decode.optional(mtrcb_rating_decoder()),
  )
  use nbc_rating <- decode.optional_field(
    "nbcRating",
    option.None,
    decode.optional(nbc_rating_decoder()),
  )
  use nbcpl_rating <- decode.optional_field(
    "nbcplRating",
    option.None,
    decode.optional(nbcpl_rating_decoder()),
  )
  use nfrc_rating <- decode.optional_field(
    "nfrcRating",
    option.None,
    decode.optional(nfrc_rating_decoder()),
  )
  use nfvcb_rating <- decode.optional_field(
    "nfvcbRating",
    option.None,
    decode.optional(nfvcb_rating_decoder()),
  )
  use nkclv_rating <- decode.optional_field(
    "nkclvRating",
    option.None,
    decode.optional(nkclv_rating_decoder()),
  )
  use nmc_rating <- decode.optional_field(
    "nmcRating",
    option.None,
    decode.optional(nmc_rating_decoder()),
  )
  use oflc_rating <- decode.optional_field(
    "oflcRating",
    option.None,
    decode.optional(oflc_rating_decoder()),
  )
  use pefilm_rating <- decode.optional_field(
    "pefilmRating",
    option.None,
    decode.optional(pefilm_rating_decoder()),
  )
  use rcnof_rating <- decode.optional_field(
    "rcnofRating",
    option.None,
    decode.optional(rcnof_rating_decoder()),
  )
  use resorteviolencia_rating <- decode.optional_field(
    "resorteviolenciaRating",
    option.None,
    decode.optional(resorteviolencia_rating_decoder()),
  )
  use rtc_rating <- decode.optional_field(
    "rtcRating",
    option.None,
    decode.optional(rtc_rating_decoder()),
  )
  use rte_rating <- decode.optional_field(
    "rteRating",
    option.None,
    decode.optional(rte_rating_decoder()),
  )
  use russia_rating <- decode.optional_field(
    "russiaRating",
    option.None,
    decode.optional(russia_rating_decoder()),
  )
  use skfilm_rating <- decode.optional_field(
    "skfilmRating",
    option.None,
    decode.optional(skfilm_rating_decoder()),
  )
  use smais_rating <- decode.optional_field(
    "smaisRating",
    option.None,
    decode.optional(smais_rating_decoder()),
  )
  use smsa_rating <- decode.optional_field(
    "smsaRating",
    option.None,
    decode.optional(smsa_rating_decoder()),
  )
  use tvpg_rating <- decode.optional_field(
    "tvpgRating",
    option.None,
    decode.optional(tvpg_rating_decoder()),
  )
  use yt_rating <- decode.optional_field(
    "ytRating",
    option.None,
    decode.optional(yt_rating_decoder()),
  )
  decode.success(
    ContentRating(
      acb_rating,
      agcom_rating,
      anatel_rating,
      bbfc_rating,
      bfvc_rating,
      bmukk_rating,
      catv_rating,
      catvfr_rating,
      cbfc_rating,
      ccc_rating,
      cce_rating,
      chfilm_rating,
      chvrs_rating,
      cicf_rating,
      cna_rating,
      cnc_rating,
      csa_rating,
      cscf_rating,
      czfilm_rating,
      djctq_rating,
      djctq_rating_reasons,
      ecbmct_rating,
      eefilm_rating,
      egfilm_rating,
      eirin_rating,
      fcbm_rating,
      fco_rating,
      fmoc_rating,
      fpb_rating,
      fpb_rating_reasons,
      fsk_rating,
      grfilm_rating,
      icaa_rating,
      ifco_rating,
      ilfilm_rating,
      incaa_rating,
      kfcb_rating,
      kijkwijzer_rating,
      kmrb_rating,
      lsf_rating,
      mccaa_rating,
      mccyp_rating,
      mcst_rating,
      mda_rating,
      medietilsynet_rating,
      meku_rating,
      mena_mpaa_rating,
      mibac_rating,
      moc_rating,
      moctw_rating,
      mpaa_rating,
      mpaat_rating,
      mtrcb_rating,
      nbc_rating,
      nbcpl_rating,
      nfrc_rating,
      nfvcb_rating,
      nkclv_rating,
      nmc_rating,
      oflc_rating,
      pefilm_rating,
      rcnof_rating,
      resorteviolencia_rating,
      rtc_rating,
      rte_rating,
      russia_rating,
      skfilm_rating,
      smais_rating,
      smsa_rating,
      tvpg_rating,
      yt_rating,
    ),
  )
}

pub fn to_json(value: ContentRating) -> Json {
  json.object(
    [
      #(
        "acbRating",
        json.nullable(
          value.acb_rating,
          fn(e)
          { json.string(acb_rating_to_string(e)) },
        ),
      ),
      #(
        "agcomRating",
        json.nullable(
          value.agcom_rating,
          fn(e)
          { json.string(agcom_rating_to_string(e)) },
        ),
      ),
      #(
        "anatelRating",
        json.nullable(
          value.anatel_rating,
          fn(e)
          { json.string(anatel_rating_to_string(e)) },
        ),
      ),
      #(
        "bbfcRating",
        json.nullable(
          value.bbfc_rating,
          fn(e)
          { json.string(bbfc_rating_to_string(e)) },
        ),
      ),
      #(
        "bfvcRating",
        json.nullable(
          value.bfvc_rating,
          fn(e)
          { json.string(bfvc_rating_to_string(e)) },
        ),
      ),
      #(
        "bmukkRating",
        json.nullable(
          value.bmukk_rating,
          fn(e)
          { json.string(bmukk_rating_to_string(e)) },
        ),
      ),
      #(
        "catvRating",
        json.nullable(
          value.catv_rating,
          fn(e)
          { json.string(catv_rating_to_string(e)) },
        ),
      ),
      #(
        "catvfrRating",
        json.nullable(
          value.catvfr_rating,
          fn(e)
          { json.string(catvfr_rating_to_string(e)) },
        ),
      ),
      #(
        "cbfcRating",
        json.nullable(
          value.cbfc_rating,
          fn(e)
          { json.string(cbfc_rating_to_string(e)) },
        ),
      ),
      #(
        "cccRating",
        json.nullable(
          value.ccc_rating,
          fn(e)
          { json.string(ccc_rating_to_string(e)) },
        ),
      ),
      #(
        "cceRating",
        json.nullable(
          value.cce_rating,
          fn(e)
          { json.string(cce_rating_to_string(e)) },
        ),
      ),
      #(
        "chfilmRating",
        json.nullable(
          value.chfilm_rating,
          fn(e)
          { json.string(chfilm_rating_to_string(e)) },
        ),
      ),
      #(
        "chvrsRating",
        json.nullable(
          value.chvrs_rating,
          fn(e)
          { json.string(chvrs_rating_to_string(e)) },
        ),
      ),
      #(
        "cicfRating",
        json.nullable(
          value.cicf_rating,
          fn(e)
          { json.string(cicf_rating_to_string(e)) },
        ),
      ),
      #(
        "cnaRating",
        json.nullable(
          value.cna_rating,
          fn(e)
          { json.string(cna_rating_to_string(e)) },
        ),
      ),
      #(
        "cncRating",
        json.nullable(
          value.cnc_rating,
          fn(e)
          { json.string(cnc_rating_to_string(e)) },
        ),
      ),
      #(
        "csaRating",
        json.nullable(
          value.csa_rating,
          fn(e)
          { json.string(csa_rating_to_string(e)) },
        ),
      ),
      #(
        "cscfRating",
        json.nullable(
          value.cscf_rating,
          fn(e)
          { json.string(cscf_rating_to_string(e)) },
        ),
      ),
      #(
        "czfilmRating",
        json.nullable(
          value.czfilm_rating,
          fn(e)
          { json.string(czfilm_rating_to_string(e)) },
        ),
      ),
      #(
        "djctqRating",
        json.nullable(
          value.djctq_rating,
          fn(e)
          { json.string(djctq_rating_to_string(e)) },
        ),
      ),
      #(
        "djctqRatingReasons",
        json.nullable(
          value.djctq_rating_reasons,
          fn(items)
          {
            json.array(
              items,
              fn(e)
              { json.string(djctq_rating_reasons_to_string(e)) },
            )
          },
        ),
      ),
      #(
        "ecbmctRating",
        json.nullable(
          value.ecbmct_rating,
          fn(e)
          { json.string(ecbmct_rating_to_string(e)) },
        ),
      ),
      #(
        "eefilmRating",
        json.nullable(
          value.eefilm_rating,
          fn(e)
          { json.string(eefilm_rating_to_string(e)) },
        ),
      ),
      #(
        "egfilmRating",
        json.nullable(
          value.egfilm_rating,
          fn(e)
          { json.string(egfilm_rating_to_string(e)) },
        ),
      ),
      #(
        "eirinRating",
        json.nullable(
          value.eirin_rating,
          fn(e)
          { json.string(eirin_rating_to_string(e)) },
        ),
      ),
      #(
        "fcbmRating",
        json.nullable(
          value.fcbm_rating,
          fn(e)
          { json.string(fcbm_rating_to_string(e)) },
        ),
      ),
      #(
        "fcoRating",
        json.nullable(
          value.fco_rating,
          fn(e)
          { json.string(fco_rating_to_string(e)) },
        ),
      ),
      #(
        "fmocRating",
        json.nullable(
          value.fmoc_rating,
          fn(e)
          { json.string(fmoc_rating_to_string(e)) },
        ),
      ),
      #(
        "fpbRating",
        json.nullable(
          value.fpb_rating,
          fn(e)
          { json.string(fpb_rating_to_string(e)) },
        ),
      ),
      #(
        "fpbRatingReasons",
        json.nullable(
          value.fpb_rating_reasons,
          fn(items)
          {
            json.array(
              items,
              fn(e)
              { json.string(fpb_rating_reasons_to_string(e)) },
            )
          },
        ),
      ),
      #(
        "fskRating",
        json.nullable(
          value.fsk_rating,
          fn(e)
          { json.string(fsk_rating_to_string(e)) },
        ),
      ),
      #(
        "grfilmRating",
        json.nullable(
          value.grfilm_rating,
          fn(e)
          { json.string(grfilm_rating_to_string(e)) },
        ),
      ),
      #(
        "icaaRating",
        json.nullable(
          value.icaa_rating,
          fn(e)
          { json.string(icaa_rating_to_string(e)) },
        ),
      ),
      #(
        "ifcoRating",
        json.nullable(
          value.ifco_rating,
          fn(e)
          { json.string(ifco_rating_to_string(e)) },
        ),
      ),
      #(
        "ilfilmRating",
        json.nullable(
          value.ilfilm_rating,
          fn(e)
          { json.string(ilfilm_rating_to_string(e)) },
        ),
      ),
      #(
        "incaaRating",
        json.nullable(
          value.incaa_rating,
          fn(e)
          { json.string(incaa_rating_to_string(e)) },
        ),
      ),
      #(
        "kfcbRating",
        json.nullable(
          value.kfcb_rating,
          fn(e)
          { json.string(kfcb_rating_to_string(e)) },
        ),
      ),
      #(
        "kijkwijzerRating",
        json.nullable(
          value.kijkwijzer_rating,
          fn(e)
          { json.string(kijkwijzer_rating_to_string(e)) },
        ),
      ),
      #(
        "kmrbRating",
        json.nullable(
          value.kmrb_rating,
          fn(e)
          { json.string(kmrb_rating_to_string(e)) },
        ),
      ),
      #(
        "lsfRating",
        json.nullable(
          value.lsf_rating,
          fn(e)
          { json.string(lsf_rating_to_string(e)) },
        ),
      ),
      #(
        "mccaaRating",
        json.nullable(
          value.mccaa_rating,
          fn(e)
          { json.string(mccaa_rating_to_string(e)) },
        ),
      ),
      #(
        "mccypRating",
        json.nullable(
          value.mccyp_rating,
          fn(e)
          { json.string(mccyp_rating_to_string(e)) },
        ),
      ),
      #(
        "mcstRating",
        json.nullable(
          value.mcst_rating,
          fn(e)
          { json.string(mcst_rating_to_string(e)) },
        ),
      ),
      #(
        "mdaRating",
        json.nullable(
          value.mda_rating,
          fn(e)
          { json.string(mda_rating_to_string(e)) },
        ),
      ),
      #(
        "medietilsynetRating",
        json.nullable(
          value.medietilsynet_rating,
          fn(e)
          { json.string(medietilsynet_rating_to_string(e)) },
        ),
      ),
      #(
        "mekuRating",
        json.nullable(
          value.meku_rating,
          fn(e)
          { json.string(meku_rating_to_string(e)) },
        ),
      ),
      #(
        "menaMpaaRating",
        json.nullable(
          value.mena_mpaa_rating,
          fn(e)
          { json.string(mena_mpaa_rating_to_string(e)) },
        ),
      ),
      #(
        "mibacRating",
        json.nullable(
          value.mibac_rating,
          fn(e)
          { json.string(mibac_rating_to_string(e)) },
        ),
      ),
      #(
        "mocRating",
        json.nullable(
          value.moc_rating,
          fn(e)
          { json.string(moc_rating_to_string(e)) },
        ),
      ),
      #(
        "moctwRating",
        json.nullable(
          value.moctw_rating,
          fn(e)
          { json.string(moctw_rating_to_string(e)) },
        ),
      ),
      #(
        "mpaaRating",
        json.nullable(
          value.mpaa_rating,
          fn(e)
          { json.string(mpaa_rating_to_string(e)) },
        ),
      ),
      #(
        "mpaatRating",
        json.nullable(
          value.mpaat_rating,
          fn(e)
          { json.string(mpaat_rating_to_string(e)) },
        ),
      ),
      #(
        "mtrcbRating",
        json.nullable(
          value.mtrcb_rating,
          fn(e)
          { json.string(mtrcb_rating_to_string(e)) },
        ),
      ),
      #(
        "nbcRating",
        json.nullable(
          value.nbc_rating,
          fn(e)
          { json.string(nbc_rating_to_string(e)) },
        ),
      ),
      #(
        "nbcplRating",
        json.nullable(
          value.nbcpl_rating,
          fn(e)
          { json.string(nbcpl_rating_to_string(e)) },
        ),
      ),
      #(
        "nfrcRating",
        json.nullable(
          value.nfrc_rating,
          fn(e)
          { json.string(nfrc_rating_to_string(e)) },
        ),
      ),
      #(
        "nfvcbRating",
        json.nullable(
          value.nfvcb_rating,
          fn(e)
          { json.string(nfvcb_rating_to_string(e)) },
        ),
      ),
      #(
        "nkclvRating",
        json.nullable(
          value.nkclv_rating,
          fn(e)
          { json.string(nkclv_rating_to_string(e)) },
        ),
      ),
      #(
        "nmcRating",
        json.nullable(
          value.nmc_rating,
          fn(e)
          { json.string(nmc_rating_to_string(e)) },
        ),
      ),
      #(
        "oflcRating",
        json.nullable(
          value.oflc_rating,
          fn(e)
          { json.string(oflc_rating_to_string(e)) },
        ),
      ),
      #(
        "pefilmRating",
        json.nullable(
          value.pefilm_rating,
          fn(e)
          { json.string(pefilm_rating_to_string(e)) },
        ),
      ),
      #(
        "rcnofRating",
        json.nullable(
          value.rcnof_rating,
          fn(e)
          { json.string(rcnof_rating_to_string(e)) },
        ),
      ),
      #(
        "resorteviolenciaRating",
        json.nullable(
          value.resorteviolencia_rating,
          fn(e)
          { json.string(resorteviolencia_rating_to_string(e)) },
        ),
      ),
      #(
        "rtcRating",
        json.nullable(
          value.rtc_rating,
          fn(e)
          { json.string(rtc_rating_to_string(e)) },
        ),
      ),
      #(
        "rteRating",
        json.nullable(
          value.rte_rating,
          fn(e)
          { json.string(rte_rating_to_string(e)) },
        ),
      ),
      #(
        "russiaRating",
        json.nullable(
          value.russia_rating,
          fn(e)
          { json.string(russia_rating_to_string(e)) },
        ),
      ),
      #(
        "skfilmRating",
        json.nullable(
          value.skfilm_rating,
          fn(e)
          { json.string(skfilm_rating_to_string(e)) },
        ),
      ),
      #(
        "smaisRating",
        json.nullable(
          value.smais_rating,
          fn(e)
          { json.string(smais_rating_to_string(e)) },
        ),
      ),
      #(
        "smsaRating",
        json.nullable(
          value.smsa_rating,
          fn(e)
          { json.string(smsa_rating_to_string(e)) },
        ),
      ),
      #(
        "tvpgRating",
        json.nullable(
          value.tvpg_rating,
          fn(e)
          { json.string(tvpg_rating_to_string(e)) },
        ),
      ),
      #(
        "ytRating",
        json.nullable(
          value.yt_rating,
          fn(e)
          { json.string(yt_rating_to_string(e)) },
        ),
      ),
    ],
  )
}

/// The video's Australian Classification Board (ACB) or Australian Communications and Media Authority (ACMA) rating. ACMA ratings are used to classify children's television programming.
pub type AcbRating {
  AcbRatingAcbUnspecified
  AcbRatingAcbE
  AcbRatingAcbP
  AcbRatingAcbC
  AcbRatingAcbG
  AcbRatingAcbPg
  AcbRatingAcbM
  AcbRatingAcbMa15plus
  AcbRatingAcbR18plus
  AcbRatingAcbUnrated
}

pub fn acb_rating_to_string(value: AcbRating) -> String {
  case value {
    AcbRatingAcbUnspecified -> "acbUnspecified"
    AcbRatingAcbE -> "acbE"
    AcbRatingAcbP -> "acbP"
    AcbRatingAcbC -> "acbC"
    AcbRatingAcbG -> "acbG"
    AcbRatingAcbPg -> "acbPg"
    AcbRatingAcbM -> "acbM"
    AcbRatingAcbMa15plus -> "acbMa15plus"
    AcbRatingAcbR18plus -> "acbR18plus"
    AcbRatingAcbUnrated -> "acbUnrated"
  }
}

pub fn acb_rating_decoder() -> Decoder(AcbRating) {
  use value <- decode.then(decode.string)
  case value {
    "acbUnspecified" -> decode.success(AcbRatingAcbUnspecified)
    "acbE" -> decode.success(AcbRatingAcbE)
    "acbP" -> decode.success(AcbRatingAcbP)
    "acbC" -> decode.success(AcbRatingAcbC)
    "acbG" -> decode.success(AcbRatingAcbG)
    "acbPg" -> decode.success(AcbRatingAcbPg)
    "acbM" -> decode.success(AcbRatingAcbM)
    "acbMa15plus" -> decode.success(AcbRatingAcbMa15plus)
    "acbR18plus" -> decode.success(AcbRatingAcbR18plus)
    "acbUnrated" -> decode.success(AcbRatingAcbUnrated)
    _ -> decode.failure(AcbRatingAcbUnspecified, "a valid AcbRating")
  }
}

/// The video's rating from Italy's Autorità per le Garanzie nelle Comunicazioni (AGCOM).
pub type AgcomRating {
  AgcomRatingAgcomUnspecified
  AgcomRatingAgcomT
  AgcomRatingAgcomVm14
  AgcomRatingAgcomVm18
  AgcomRatingAgcomUnrated
}

pub fn agcom_rating_to_string(value: AgcomRating) -> String {
  case value {
    AgcomRatingAgcomUnspecified -> "agcomUnspecified"
    AgcomRatingAgcomT -> "agcomT"
    AgcomRatingAgcomVm14 -> "agcomVm14"
    AgcomRatingAgcomVm18 -> "agcomVm18"
    AgcomRatingAgcomUnrated -> "agcomUnrated"
  }
}

pub fn agcom_rating_decoder() -> Decoder(AgcomRating) {
  use value <- decode.then(decode.string)
  case value {
    "agcomUnspecified" -> decode.success(AgcomRatingAgcomUnspecified)
    "agcomT" -> decode.success(AgcomRatingAgcomT)
    "agcomVm14" -> decode.success(AgcomRatingAgcomVm14)
    "agcomVm18" -> decode.success(AgcomRatingAgcomVm18)
    "agcomUnrated" -> decode.success(AgcomRatingAgcomUnrated)
    _ -> decode.failure(AgcomRatingAgcomUnspecified, "a valid AgcomRating")
  }
}

/// The video's Anatel (Asociación Nacional de Televisión) rating for Chilean television.
pub type AnatelRating {
  AnatelRatingAnatelUnspecified
  AnatelRatingAnatelF
  AnatelRatingAnatelI
  AnatelRatingAnatelI7
  AnatelRatingAnatelI10
  AnatelRatingAnatelI12
  AnatelRatingAnatelR
  AnatelRatingAnatelA
  AnatelRatingAnatelUnrated
}

pub fn anatel_rating_to_string(value: AnatelRating) -> String {
  case value {
    AnatelRatingAnatelUnspecified -> "anatelUnspecified"
    AnatelRatingAnatelF -> "anatelF"
    AnatelRatingAnatelI -> "anatelI"
    AnatelRatingAnatelI7 -> "anatelI7"
    AnatelRatingAnatelI10 -> "anatelI10"
    AnatelRatingAnatelI12 -> "anatelI12"
    AnatelRatingAnatelR -> "anatelR"
    AnatelRatingAnatelA -> "anatelA"
    AnatelRatingAnatelUnrated -> "anatelUnrated"
  }
}

pub fn anatel_rating_decoder() -> Decoder(AnatelRating) {
  use value <- decode.then(decode.string)
  case value {
    "anatelUnspecified" -> decode.success(AnatelRatingAnatelUnspecified)
    "anatelF" -> decode.success(AnatelRatingAnatelF)
    "anatelI" -> decode.success(AnatelRatingAnatelI)
    "anatelI7" -> decode.success(AnatelRatingAnatelI7)
    "anatelI10" -> decode.success(AnatelRatingAnatelI10)
    "anatelI12" -> decode.success(AnatelRatingAnatelI12)
    "anatelR" -> decode.success(AnatelRatingAnatelR)
    "anatelA" -> decode.success(AnatelRatingAnatelA)
    "anatelUnrated" -> decode.success(AnatelRatingAnatelUnrated)
    _ -> decode.failure(AnatelRatingAnatelUnspecified, "a valid AnatelRating")
  }
}

/// The video's British Board of Film Classification (BBFC) rating.
pub type BbfcRating {
  BbfcRatingBbfcUnspecified
  BbfcRatingBbfcU
  BbfcRatingBbfcPg
  BbfcRatingBbfc12a
  BbfcRatingBbfc12
  BbfcRatingBbfc15
  BbfcRatingBbfc18
  BbfcRatingBbfcR18
  BbfcRatingBbfcUnrated
}

pub fn bbfc_rating_to_string(value: BbfcRating) -> String {
  case value {
    BbfcRatingBbfcUnspecified -> "bbfcUnspecified"
    BbfcRatingBbfcU -> "bbfcU"
    BbfcRatingBbfcPg -> "bbfcPg"
    BbfcRatingBbfc12a -> "bbfc12a"
    BbfcRatingBbfc12 -> "bbfc12"
    BbfcRatingBbfc15 -> "bbfc15"
    BbfcRatingBbfc18 -> "bbfc18"
    BbfcRatingBbfcR18 -> "bbfcR18"
    BbfcRatingBbfcUnrated -> "bbfcUnrated"
  }
}

pub fn bbfc_rating_decoder() -> Decoder(BbfcRating) {
  use value <- decode.then(decode.string)
  case value {
    "bbfcUnspecified" -> decode.success(BbfcRatingBbfcUnspecified)
    "bbfcU" -> decode.success(BbfcRatingBbfcU)
    "bbfcPg" -> decode.success(BbfcRatingBbfcPg)
    "bbfc12a" -> decode.success(BbfcRatingBbfc12a)
    "bbfc12" -> decode.success(BbfcRatingBbfc12)
    "bbfc15" -> decode.success(BbfcRatingBbfc15)
    "bbfc18" -> decode.success(BbfcRatingBbfc18)
    "bbfcR18" -> decode.success(BbfcRatingBbfcR18)
    "bbfcUnrated" -> decode.success(BbfcRatingBbfcUnrated)
    _ -> decode.failure(BbfcRatingBbfcUnspecified, "a valid BbfcRating")
  }
}

/// The video's rating from Thailand's Board of Film and Video Censors.
pub type BfvcRating {
  BfvcRatingBfvcUnspecified
  BfvcRatingBfvcG
  BfvcRatingBfvcE
  BfvcRatingBfvc13
  BfvcRatingBfvc15
  BfvcRatingBfvc18
  BfvcRatingBfvc20
  BfvcRatingBfvcB
  BfvcRatingBfvcUnrated
}

pub fn bfvc_rating_to_string(value: BfvcRating) -> String {
  case value {
    BfvcRatingBfvcUnspecified -> "bfvcUnspecified"
    BfvcRatingBfvcG -> "bfvcG"
    BfvcRatingBfvcE -> "bfvcE"
    BfvcRatingBfvc13 -> "bfvc13"
    BfvcRatingBfvc15 -> "bfvc15"
    BfvcRatingBfvc18 -> "bfvc18"
    BfvcRatingBfvc20 -> "bfvc20"
    BfvcRatingBfvcB -> "bfvcB"
    BfvcRatingBfvcUnrated -> "bfvcUnrated"
  }
}

pub fn bfvc_rating_decoder() -> Decoder(BfvcRating) {
  use value <- decode.then(decode.string)
  case value {
    "bfvcUnspecified" -> decode.success(BfvcRatingBfvcUnspecified)
    "bfvcG" -> decode.success(BfvcRatingBfvcG)
    "bfvcE" -> decode.success(BfvcRatingBfvcE)
    "bfvc13" -> decode.success(BfvcRatingBfvc13)
    "bfvc15" -> decode.success(BfvcRatingBfvc15)
    "bfvc18" -> decode.success(BfvcRatingBfvc18)
    "bfvc20" -> decode.success(BfvcRatingBfvc20)
    "bfvcB" -> decode.success(BfvcRatingBfvcB)
    "bfvcUnrated" -> decode.success(BfvcRatingBfvcUnrated)
    _ -> decode.failure(BfvcRatingBfvcUnspecified, "a valid BfvcRating")
  }
}

/// The video's rating from the Austrian Board of Media Classification (Bundesministerium für Unterricht, Kunst und Kultur).
pub type BmukkRating {
  BmukkRatingBmukkUnspecified
  BmukkRatingBmukkAa
  BmukkRatingBmukk6
  BmukkRatingBmukk8
  BmukkRatingBmukk10
  BmukkRatingBmukk12
  BmukkRatingBmukk14
  BmukkRatingBmukk16
  BmukkRatingBmukkUnrated
}

pub fn bmukk_rating_to_string(value: BmukkRating) -> String {
  case value {
    BmukkRatingBmukkUnspecified -> "bmukkUnspecified"
    BmukkRatingBmukkAa -> "bmukkAa"
    BmukkRatingBmukk6 -> "bmukk6"
    BmukkRatingBmukk8 -> "bmukk8"
    BmukkRatingBmukk10 -> "bmukk10"
    BmukkRatingBmukk12 -> "bmukk12"
    BmukkRatingBmukk14 -> "bmukk14"
    BmukkRatingBmukk16 -> "bmukk16"
    BmukkRatingBmukkUnrated -> "bmukkUnrated"
  }
}

pub fn bmukk_rating_decoder() -> Decoder(BmukkRating) {
  use value <- decode.then(decode.string)
  case value {
    "bmukkUnspecified" -> decode.success(BmukkRatingBmukkUnspecified)
    "bmukkAa" -> decode.success(BmukkRatingBmukkAa)
    "bmukk6" -> decode.success(BmukkRatingBmukk6)
    "bmukk8" -> decode.success(BmukkRatingBmukk8)
    "bmukk10" -> decode.success(BmukkRatingBmukk10)
    "bmukk12" -> decode.success(BmukkRatingBmukk12)
    "bmukk14" -> decode.success(BmukkRatingBmukk14)
    "bmukk16" -> decode.success(BmukkRatingBmukk16)
    "bmukkUnrated" -> decode.success(BmukkRatingBmukkUnrated)
    _ -> decode.failure(BmukkRatingBmukkUnspecified, "a valid BmukkRating")
  }
}

/// Rating system for Canadian TV - Canadian TV Classification System The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian English-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
pub type CatvRating {
  CatvRatingCatvUnspecified
  CatvRatingCatvC
  CatvRatingCatvC8
  CatvRatingCatvG
  CatvRatingCatvPg
  CatvRatingCatv14plus
  CatvRatingCatv18plus
  CatvRatingCatvUnrated
  CatvRatingCatvE
}

pub fn catv_rating_to_string(value: CatvRating) -> String {
  case value {
    CatvRatingCatvUnspecified -> "catvUnspecified"
    CatvRatingCatvC -> "catvC"
    CatvRatingCatvC8 -> "catvC8"
    CatvRatingCatvG -> "catvG"
    CatvRatingCatvPg -> "catvPg"
    CatvRatingCatv14plus -> "catv14plus"
    CatvRatingCatv18plus -> "catv18plus"
    CatvRatingCatvUnrated -> "catvUnrated"
    CatvRatingCatvE -> "catvE"
  }
}

pub fn catv_rating_decoder() -> Decoder(CatvRating) {
  use value <- decode.then(decode.string)
  case value {
    "catvUnspecified" -> decode.success(CatvRatingCatvUnspecified)
    "catvC" -> decode.success(CatvRatingCatvC)
    "catvC8" -> decode.success(CatvRatingCatvC8)
    "catvG" -> decode.success(CatvRatingCatvG)
    "catvPg" -> decode.success(CatvRatingCatvPg)
    "catv14plus" -> decode.success(CatvRatingCatv14plus)
    "catv18plus" -> decode.success(CatvRatingCatv18plus)
    "catvUnrated" -> decode.success(CatvRatingCatvUnrated)
    "catvE" -> decode.success(CatvRatingCatvE)
    _ -> decode.failure(CatvRatingCatvUnspecified, "a valid CatvRating")
  }
}

/// The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian French-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
pub type CatvfrRating {
  CatvfrRatingCatvfrUnspecified
  CatvfrRatingCatvfrG
  CatvfrRatingCatvfr8plus
  CatvfrRatingCatvfr13plus
  CatvfrRatingCatvfr16plus
  CatvfrRatingCatvfr18plus
  CatvfrRatingCatvfrUnrated
  CatvfrRatingCatvfrE
}

pub fn catvfr_rating_to_string(value: CatvfrRating) -> String {
  case value {
    CatvfrRatingCatvfrUnspecified -> "catvfrUnspecified"
    CatvfrRatingCatvfrG -> "catvfrG"
    CatvfrRatingCatvfr8plus -> "catvfr8plus"
    CatvfrRatingCatvfr13plus -> "catvfr13plus"
    CatvfrRatingCatvfr16plus -> "catvfr16plus"
    CatvfrRatingCatvfr18plus -> "catvfr18plus"
    CatvfrRatingCatvfrUnrated -> "catvfrUnrated"
    CatvfrRatingCatvfrE -> "catvfrE"
  }
}

pub fn catvfr_rating_decoder() -> Decoder(CatvfrRating) {
  use value <- decode.then(decode.string)
  case value {
    "catvfrUnspecified" -> decode.success(CatvfrRatingCatvfrUnspecified)
    "catvfrG" -> decode.success(CatvfrRatingCatvfrG)
    "catvfr8plus" -> decode.success(CatvfrRatingCatvfr8plus)
    "catvfr13plus" -> decode.success(CatvfrRatingCatvfr13plus)
    "catvfr16plus" -> decode.success(CatvfrRatingCatvfr16plus)
    "catvfr18plus" -> decode.success(CatvfrRatingCatvfr18plus)
    "catvfrUnrated" -> decode.success(CatvfrRatingCatvfrUnrated)
    "catvfrE" -> decode.success(CatvfrRatingCatvfrE)
    _ -> decode.failure(CatvfrRatingCatvfrUnspecified, "a valid CatvfrRating")
  }
}

/// The video's Central Board of Film Certification (CBFC - India) rating.
pub type CbfcRating {
  CbfcRatingCbfcUnspecified
  CbfcRatingCbfcU
  CbfcRatingCbfcUa
  CbfcRatingCbfcUa7plus
  CbfcRatingCbfcUa13plus
  CbfcRatingCbfcUa16plus
  CbfcRatingCbfcA
  CbfcRatingCbfcS
  CbfcRatingCbfcUnrated
}

pub fn cbfc_rating_to_string(value: CbfcRating) -> String {
  case value {
    CbfcRatingCbfcUnspecified -> "cbfcUnspecified"
    CbfcRatingCbfcU -> "cbfcU"
    CbfcRatingCbfcUa -> "cbfcUA"
    CbfcRatingCbfcUa7plus -> "cbfcUA7plus"
    CbfcRatingCbfcUa13plus -> "cbfcUA13plus"
    CbfcRatingCbfcUa16plus -> "cbfcUA16plus"
    CbfcRatingCbfcA -> "cbfcA"
    CbfcRatingCbfcS -> "cbfcS"
    CbfcRatingCbfcUnrated -> "cbfcUnrated"
  }
}

pub fn cbfc_rating_decoder() -> Decoder(CbfcRating) {
  use value <- decode.then(decode.string)
  case value {
    "cbfcUnspecified" -> decode.success(CbfcRatingCbfcUnspecified)
    "cbfcU" -> decode.success(CbfcRatingCbfcU)
    "cbfcUA" -> decode.success(CbfcRatingCbfcUa)
    "cbfcUA7plus" -> decode.success(CbfcRatingCbfcUa7plus)
    "cbfcUA13plus" -> decode.success(CbfcRatingCbfcUa13plus)
    "cbfcUA16plus" -> decode.success(CbfcRatingCbfcUa16plus)
    "cbfcA" -> decode.success(CbfcRatingCbfcA)
    "cbfcS" -> decode.success(CbfcRatingCbfcS)
    "cbfcUnrated" -> decode.success(CbfcRatingCbfcUnrated)
    _ -> decode.failure(CbfcRatingCbfcUnspecified, "a valid CbfcRating")
  }
}

/// The video's Consejo de Calificación Cinematográfica (Chile) rating.
pub type CccRating {
  CccRatingCccUnspecified
  CccRatingCccTe
  CccRatingCcc6
  CccRatingCcc14
  CccRatingCcc18
  CccRatingCcc18v
  CccRatingCcc18s
  CccRatingCccUnrated
}

pub fn ccc_rating_to_string(value: CccRating) -> String {
  case value {
    CccRatingCccUnspecified -> "cccUnspecified"
    CccRatingCccTe -> "cccTe"
    CccRatingCcc6 -> "ccc6"
    CccRatingCcc14 -> "ccc14"
    CccRatingCcc18 -> "ccc18"
    CccRatingCcc18v -> "ccc18v"
    CccRatingCcc18s -> "ccc18s"
    CccRatingCccUnrated -> "cccUnrated"
  }
}

pub fn ccc_rating_decoder() -> Decoder(CccRating) {
  use value <- decode.then(decode.string)
  case value {
    "cccUnspecified" -> decode.success(CccRatingCccUnspecified)
    "cccTe" -> decode.success(CccRatingCccTe)
    "ccc6" -> decode.success(CccRatingCcc6)
    "ccc14" -> decode.success(CccRatingCcc14)
    "ccc18" -> decode.success(CccRatingCcc18)
    "ccc18v" -> decode.success(CccRatingCcc18v)
    "ccc18s" -> decode.success(CccRatingCcc18s)
    "cccUnrated" -> decode.success(CccRatingCccUnrated)
    _ -> decode.failure(CccRatingCccUnspecified, "a valid CccRating")
  }
}

/// The video's rating from Portugal's Comissão de Classificação de Espect´culos.
pub type CceRating {
  CceRatingCceUnspecified
  CceRatingCceM4
  CceRatingCceM6
  CceRatingCceM12
  CceRatingCceM16
  CceRatingCceM18
  CceRatingCceUnrated
  CceRatingCceM14
}

pub fn cce_rating_to_string(value: CceRating) -> String {
  case value {
    CceRatingCceUnspecified -> "cceUnspecified"
    CceRatingCceM4 -> "cceM4"
    CceRatingCceM6 -> "cceM6"
    CceRatingCceM12 -> "cceM12"
    CceRatingCceM16 -> "cceM16"
    CceRatingCceM18 -> "cceM18"
    CceRatingCceUnrated -> "cceUnrated"
    CceRatingCceM14 -> "cceM14"
  }
}

pub fn cce_rating_decoder() -> Decoder(CceRating) {
  use value <- decode.then(decode.string)
  case value {
    "cceUnspecified" -> decode.success(CceRatingCceUnspecified)
    "cceM4" -> decode.success(CceRatingCceM4)
    "cceM6" -> decode.success(CceRatingCceM6)
    "cceM12" -> decode.success(CceRatingCceM12)
    "cceM16" -> decode.success(CceRatingCceM16)
    "cceM18" -> decode.success(CceRatingCceM18)
    "cceUnrated" -> decode.success(CceRatingCceUnrated)
    "cceM14" -> decode.success(CceRatingCceM14)
    _ -> decode.failure(CceRatingCceUnspecified, "a valid CceRating")
  }
}

/// The video's rating in Switzerland.
pub type ChfilmRating {
  ChfilmRatingChfilmUnspecified
  ChfilmRatingChfilm0
  ChfilmRatingChfilm6
  ChfilmRatingChfilm12
  ChfilmRatingChfilm16
  ChfilmRatingChfilm18
  ChfilmRatingChfilmUnrated
}

pub fn chfilm_rating_to_string(value: ChfilmRating) -> String {
  case value {
    ChfilmRatingChfilmUnspecified -> "chfilmUnspecified"
    ChfilmRatingChfilm0 -> "chfilm0"
    ChfilmRatingChfilm6 -> "chfilm6"
    ChfilmRatingChfilm12 -> "chfilm12"
    ChfilmRatingChfilm16 -> "chfilm16"
    ChfilmRatingChfilm18 -> "chfilm18"
    ChfilmRatingChfilmUnrated -> "chfilmUnrated"
  }
}

pub fn chfilm_rating_decoder() -> Decoder(ChfilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "chfilmUnspecified" -> decode.success(ChfilmRatingChfilmUnspecified)
    "chfilm0" -> decode.success(ChfilmRatingChfilm0)
    "chfilm6" -> decode.success(ChfilmRatingChfilm6)
    "chfilm12" -> decode.success(ChfilmRatingChfilm12)
    "chfilm16" -> decode.success(ChfilmRatingChfilm16)
    "chfilm18" -> decode.success(ChfilmRatingChfilm18)
    "chfilmUnrated" -> decode.success(ChfilmRatingChfilmUnrated)
    _ -> decode.failure(ChfilmRatingChfilmUnspecified, "a valid ChfilmRating")
  }
}

/// The video's Canadian Home Video Rating System (CHVRS) rating.
pub type ChvrsRating {
  ChvrsRatingChvrsUnspecified
  ChvrsRatingChvrsG
  ChvrsRatingChvrsPg
  ChvrsRatingChvrs14a
  ChvrsRatingChvrs18a
  ChvrsRatingChvrsR
  ChvrsRatingChvrsE
  ChvrsRatingChvrsUnrated
}

pub fn chvrs_rating_to_string(value: ChvrsRating) -> String {
  case value {
    ChvrsRatingChvrsUnspecified -> "chvrsUnspecified"
    ChvrsRatingChvrsG -> "chvrsG"
    ChvrsRatingChvrsPg -> "chvrsPg"
    ChvrsRatingChvrs14a -> "chvrs14a"
    ChvrsRatingChvrs18a -> "chvrs18a"
    ChvrsRatingChvrsR -> "chvrsR"
    ChvrsRatingChvrsE -> "chvrsE"
    ChvrsRatingChvrsUnrated -> "chvrsUnrated"
  }
}

pub fn chvrs_rating_decoder() -> Decoder(ChvrsRating) {
  use value <- decode.then(decode.string)
  case value {
    "chvrsUnspecified" -> decode.success(ChvrsRatingChvrsUnspecified)
    "chvrsG" -> decode.success(ChvrsRatingChvrsG)
    "chvrsPg" -> decode.success(ChvrsRatingChvrsPg)
    "chvrs14a" -> decode.success(ChvrsRatingChvrs14a)
    "chvrs18a" -> decode.success(ChvrsRatingChvrs18a)
    "chvrsR" -> decode.success(ChvrsRatingChvrsR)
    "chvrsE" -> decode.success(ChvrsRatingChvrsE)
    "chvrsUnrated" -> decode.success(ChvrsRatingChvrsUnrated)
    _ -> decode.failure(ChvrsRatingChvrsUnspecified, "a valid ChvrsRating")
  }
}

/// The video's rating from the Commission de Contrôle des Films (Belgium).
pub type CicfRating {
  CicfRatingCicfUnspecified
  CicfRatingCicfE
  CicfRatingCicfKtEa
  CicfRatingCicfKntEna
  CicfRatingCicfUnrated
}

pub fn cicf_rating_to_string(value: CicfRating) -> String {
  case value {
    CicfRatingCicfUnspecified -> "cicfUnspecified"
    CicfRatingCicfE -> "cicfE"
    CicfRatingCicfKtEa -> "cicfKtEa"
    CicfRatingCicfKntEna -> "cicfKntEna"
    CicfRatingCicfUnrated -> "cicfUnrated"
  }
}

pub fn cicf_rating_decoder() -> Decoder(CicfRating) {
  use value <- decode.then(decode.string)
  case value {
    "cicfUnspecified" -> decode.success(CicfRatingCicfUnspecified)
    "cicfE" -> decode.success(CicfRatingCicfE)
    "cicfKtEa" -> decode.success(CicfRatingCicfKtEa)
    "cicfKntEna" -> decode.success(CicfRatingCicfKntEna)
    "cicfUnrated" -> decode.success(CicfRatingCicfUnrated)
    _ -> decode.failure(CicfRatingCicfUnspecified, "a valid CicfRating")
  }
}

/// The video's rating from Romania's CONSILIUL NATIONAL AL AUDIOVIZUALULUI (CNA).
pub type CnaRating {
  CnaRatingCnaUnspecified
  CnaRatingCnaAp
  CnaRatingCna12
  CnaRatingCna15
  CnaRatingCna18
  CnaRatingCna18plus
  CnaRatingCnaUnrated
}

pub fn cna_rating_to_string(value: CnaRating) -> String {
  case value {
    CnaRatingCnaUnspecified -> "cnaUnspecified"
    CnaRatingCnaAp -> "cnaAp"
    CnaRatingCna12 -> "cna12"
    CnaRatingCna15 -> "cna15"
    CnaRatingCna18 -> "cna18"
    CnaRatingCna18plus -> "cna18plus"
    CnaRatingCnaUnrated -> "cnaUnrated"
  }
}

pub fn cna_rating_decoder() -> Decoder(CnaRating) {
  use value <- decode.then(decode.string)
  case value {
    "cnaUnspecified" -> decode.success(CnaRatingCnaUnspecified)
    "cnaAp" -> decode.success(CnaRatingCnaAp)
    "cna12" -> decode.success(CnaRatingCna12)
    "cna15" -> decode.success(CnaRatingCna15)
    "cna18" -> decode.success(CnaRatingCna18)
    "cna18plus" -> decode.success(CnaRatingCna18plus)
    "cnaUnrated" -> decode.success(CnaRatingCnaUnrated)
    _ -> decode.failure(CnaRatingCnaUnspecified, "a valid CnaRating")
  }
}

/// Rating system in France - Commission de classification cinematographique
pub type CncRating {
  CncRatingCncUnspecified
  CncRatingCncT
  CncRatingCnc10
  CncRatingCnc12
  CncRatingCnc16
  CncRatingCnc18
  CncRatingCncE
  CncRatingCncInterdiction
  CncRatingCncUnrated
}

pub fn cnc_rating_to_string(value: CncRating) -> String {
  case value {
    CncRatingCncUnspecified -> "cncUnspecified"
    CncRatingCncT -> "cncT"
    CncRatingCnc10 -> "cnc10"
    CncRatingCnc12 -> "cnc12"
    CncRatingCnc16 -> "cnc16"
    CncRatingCnc18 -> "cnc18"
    CncRatingCncE -> "cncE"
    CncRatingCncInterdiction -> "cncInterdiction"
    CncRatingCncUnrated -> "cncUnrated"
  }
}

pub fn cnc_rating_decoder() -> Decoder(CncRating) {
  use value <- decode.then(decode.string)
  case value {
    "cncUnspecified" -> decode.success(CncRatingCncUnspecified)
    "cncT" -> decode.success(CncRatingCncT)
    "cnc10" -> decode.success(CncRatingCnc10)
    "cnc12" -> decode.success(CncRatingCnc12)
    "cnc16" -> decode.success(CncRatingCnc16)
    "cnc18" -> decode.success(CncRatingCnc18)
    "cncE" -> decode.success(CncRatingCncE)
    "cncInterdiction" -> decode.success(CncRatingCncInterdiction)
    "cncUnrated" -> decode.success(CncRatingCncUnrated)
    _ -> decode.failure(CncRatingCncUnspecified, "a valid CncRating")
  }
}

/// The video's rating from France's Conseil supérieur de l’audiovisuel, which rates broadcast content.
pub type CsaRating {
  CsaRatingCsaUnspecified
  CsaRatingCsaT
  CsaRatingCsa10
  CsaRatingCsa12
  CsaRatingCsa16
  CsaRatingCsa18
  CsaRatingCsaInterdiction
  CsaRatingCsaUnrated
}

pub fn csa_rating_to_string(value: CsaRating) -> String {
  case value {
    CsaRatingCsaUnspecified -> "csaUnspecified"
    CsaRatingCsaT -> "csaT"
    CsaRatingCsa10 -> "csa10"
    CsaRatingCsa12 -> "csa12"
    CsaRatingCsa16 -> "csa16"
    CsaRatingCsa18 -> "csa18"
    CsaRatingCsaInterdiction -> "csaInterdiction"
    CsaRatingCsaUnrated -> "csaUnrated"
  }
}

pub fn csa_rating_decoder() -> Decoder(CsaRating) {
  use value <- decode.then(decode.string)
  case value {
    "csaUnspecified" -> decode.success(CsaRatingCsaUnspecified)
    "csaT" -> decode.success(CsaRatingCsaT)
    "csa10" -> decode.success(CsaRatingCsa10)
    "csa12" -> decode.success(CsaRatingCsa12)
    "csa16" -> decode.success(CsaRatingCsa16)
    "csa18" -> decode.success(CsaRatingCsa18)
    "csaInterdiction" -> decode.success(CsaRatingCsaInterdiction)
    "csaUnrated" -> decode.success(CsaRatingCsaUnrated)
    _ -> decode.failure(CsaRatingCsaUnspecified, "a valid CsaRating")
  }
}

/// The video's rating from Luxembourg's Commission de surveillance de la classification des films (CSCF).
pub type CscfRating {
  CscfRatingCscfUnspecified
  CscfRatingCscfAl
  CscfRatingCscfA
  CscfRatingCscf6
  CscfRatingCscf9
  CscfRatingCscf12
  CscfRatingCscf16
  CscfRatingCscf18
  CscfRatingCscfUnrated
}

pub fn cscf_rating_to_string(value: CscfRating) -> String {
  case value {
    CscfRatingCscfUnspecified -> "cscfUnspecified"
    CscfRatingCscfAl -> "cscfAl"
    CscfRatingCscfA -> "cscfA"
    CscfRatingCscf6 -> "cscf6"
    CscfRatingCscf9 -> "cscf9"
    CscfRatingCscf12 -> "cscf12"
    CscfRatingCscf16 -> "cscf16"
    CscfRatingCscf18 -> "cscf18"
    CscfRatingCscfUnrated -> "cscfUnrated"
  }
}

pub fn cscf_rating_decoder() -> Decoder(CscfRating) {
  use value <- decode.then(decode.string)
  case value {
    "cscfUnspecified" -> decode.success(CscfRatingCscfUnspecified)
    "cscfAl" -> decode.success(CscfRatingCscfAl)
    "cscfA" -> decode.success(CscfRatingCscfA)
    "cscf6" -> decode.success(CscfRatingCscf6)
    "cscf9" -> decode.success(CscfRatingCscf9)
    "cscf12" -> decode.success(CscfRatingCscf12)
    "cscf16" -> decode.success(CscfRatingCscf16)
    "cscf18" -> decode.success(CscfRatingCscf18)
    "cscfUnrated" -> decode.success(CscfRatingCscfUnrated)
    _ -> decode.failure(CscfRatingCscfUnspecified, "a valid CscfRating")
  }
}

/// The video's rating in the Czech Republic.
pub type CzfilmRating {
  CzfilmRatingCzfilmUnspecified
  CzfilmRatingCzfilmU
  CzfilmRatingCzfilm12
  CzfilmRatingCzfilm14
  CzfilmRatingCzfilm18
  CzfilmRatingCzfilmUnrated
}

pub fn czfilm_rating_to_string(value: CzfilmRating) -> String {
  case value {
    CzfilmRatingCzfilmUnspecified -> "czfilmUnspecified"
    CzfilmRatingCzfilmU -> "czfilmU"
    CzfilmRatingCzfilm12 -> "czfilm12"
    CzfilmRatingCzfilm14 -> "czfilm14"
    CzfilmRatingCzfilm18 -> "czfilm18"
    CzfilmRatingCzfilmUnrated -> "czfilmUnrated"
  }
}

pub fn czfilm_rating_decoder() -> Decoder(CzfilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "czfilmUnspecified" -> decode.success(CzfilmRatingCzfilmUnspecified)
    "czfilmU" -> decode.success(CzfilmRatingCzfilmU)
    "czfilm12" -> decode.success(CzfilmRatingCzfilm12)
    "czfilm14" -> decode.success(CzfilmRatingCzfilm14)
    "czfilm18" -> decode.success(CzfilmRatingCzfilm18)
    "czfilmUnrated" -> decode.success(CzfilmRatingCzfilmUnrated)
    _ -> decode.failure(CzfilmRatingCzfilmUnspecified, "a valid CzfilmRating")
  }
}

/// The video's Departamento de Justiça, Classificação, Qualificação e Títulos (DJCQT - Brazil) rating.
pub type DjctqRating {
  DjctqRatingDjctqUnspecified
  DjctqRatingDjctqL
  DjctqRatingDjctq10
  DjctqRatingDjctq12
  DjctqRatingDjctq14
  DjctqRatingDjctq16
  DjctqRatingDjctq18
  DjctqRatingDjctqEr
  DjctqRatingDjctqL10
  DjctqRatingDjctqL12
  DjctqRatingDjctqL14
  DjctqRatingDjctqL16
  DjctqRatingDjctqL18
  DjctqRatingDjctq1012
  DjctqRatingDjctq1014
  DjctqRatingDjctq1016
  DjctqRatingDjctq1018
  DjctqRatingDjctq1214
  DjctqRatingDjctq1216
  DjctqRatingDjctq1218
  DjctqRatingDjctq1416
  DjctqRatingDjctq1418
  DjctqRatingDjctq1618
  DjctqRatingDjctqUnrated
}

pub fn djctq_rating_to_string(value: DjctqRating) -> String {
  case value {
    DjctqRatingDjctqUnspecified -> "djctqUnspecified"
    DjctqRatingDjctqL -> "djctqL"
    DjctqRatingDjctq10 -> "djctq10"
    DjctqRatingDjctq12 -> "djctq12"
    DjctqRatingDjctq14 -> "djctq14"
    DjctqRatingDjctq16 -> "djctq16"
    DjctqRatingDjctq18 -> "djctq18"
    DjctqRatingDjctqEr -> "djctqEr"
    DjctqRatingDjctqL10 -> "djctqL10"
    DjctqRatingDjctqL12 -> "djctqL12"
    DjctqRatingDjctqL14 -> "djctqL14"
    DjctqRatingDjctqL16 -> "djctqL16"
    DjctqRatingDjctqL18 -> "djctqL18"
    DjctqRatingDjctq1012 -> "djctq1012"
    DjctqRatingDjctq1014 -> "djctq1014"
    DjctqRatingDjctq1016 -> "djctq1016"
    DjctqRatingDjctq1018 -> "djctq1018"
    DjctqRatingDjctq1214 -> "djctq1214"
    DjctqRatingDjctq1216 -> "djctq1216"
    DjctqRatingDjctq1218 -> "djctq1218"
    DjctqRatingDjctq1416 -> "djctq1416"
    DjctqRatingDjctq1418 -> "djctq1418"
    DjctqRatingDjctq1618 -> "djctq1618"
    DjctqRatingDjctqUnrated -> "djctqUnrated"
  }
}

pub fn djctq_rating_decoder() -> Decoder(DjctqRating) {
  use value <- decode.then(decode.string)
  case value {
    "djctqUnspecified" -> decode.success(DjctqRatingDjctqUnspecified)
    "djctqL" -> decode.success(DjctqRatingDjctqL)
    "djctq10" -> decode.success(DjctqRatingDjctq10)
    "djctq12" -> decode.success(DjctqRatingDjctq12)
    "djctq14" -> decode.success(DjctqRatingDjctq14)
    "djctq16" -> decode.success(DjctqRatingDjctq16)
    "djctq18" -> decode.success(DjctqRatingDjctq18)
    "djctqEr" -> decode.success(DjctqRatingDjctqEr)
    "djctqL10" -> decode.success(DjctqRatingDjctqL10)
    "djctqL12" -> decode.success(DjctqRatingDjctqL12)
    "djctqL14" -> decode.success(DjctqRatingDjctqL14)
    "djctqL16" -> decode.success(DjctqRatingDjctqL16)
    "djctqL18" -> decode.success(DjctqRatingDjctqL18)
    "djctq1012" -> decode.success(DjctqRatingDjctq1012)
    "djctq1014" -> decode.success(DjctqRatingDjctq1014)
    "djctq1016" -> decode.success(DjctqRatingDjctq1016)
    "djctq1018" -> decode.success(DjctqRatingDjctq1018)
    "djctq1214" -> decode.success(DjctqRatingDjctq1214)
    "djctq1216" -> decode.success(DjctqRatingDjctq1216)
    "djctq1218" -> decode.success(DjctqRatingDjctq1218)
    "djctq1416" -> decode.success(DjctqRatingDjctq1416)
    "djctq1418" -> decode.success(DjctqRatingDjctq1418)
    "djctq1618" -> decode.success(DjctqRatingDjctq1618)
    "djctqUnrated" -> decode.success(DjctqRatingDjctqUnrated)
    _ -> decode.failure(DjctqRatingDjctqUnspecified, "a valid DjctqRating")
  }
}

/// Reasons that explain why the video received its DJCQT (Brazil) rating.
pub type DjctqRatingReasons {
  DjctqRatingReasonsDjctqRatingReasonUnspecified
  DjctqRatingReasonsDjctqViolence
  DjctqRatingReasonsDjctqExtremeViolence
  DjctqRatingReasonsDjctqSexualContent
  DjctqRatingReasonsDjctqNudity
  DjctqRatingReasonsDjctqSex
  DjctqRatingReasonsDjctqExplicitSex
  DjctqRatingReasonsDjctqDrugs
  DjctqRatingReasonsDjctqLegalDrugs
  DjctqRatingReasonsDjctqIllegalDrugs
  DjctqRatingReasonsDjctqInappropriateLanguage
  DjctqRatingReasonsDjctqCriminalActs
  DjctqRatingReasonsDjctqImpactingContent
  DjctqRatingReasonsDjctqFear
  DjctqRatingReasonsDjctqMedicalProcedures
  DjctqRatingReasonsDjctqSensitiveTopics
  DjctqRatingReasonsDjctqFantasyViolence
}

pub fn djctq_rating_reasons_to_string(value: DjctqRatingReasons) -> String {
  case value {
    DjctqRatingReasonsDjctqRatingReasonUnspecified -> "djctqRatingReasonUnspecified"
    DjctqRatingReasonsDjctqViolence -> "djctqViolence"
    DjctqRatingReasonsDjctqExtremeViolence -> "djctqExtremeViolence"
    DjctqRatingReasonsDjctqSexualContent -> "djctqSexualContent"
    DjctqRatingReasonsDjctqNudity -> "djctqNudity"
    DjctqRatingReasonsDjctqSex -> "djctqSex"
    DjctqRatingReasonsDjctqExplicitSex -> "djctqExplicitSex"
    DjctqRatingReasonsDjctqDrugs -> "djctqDrugs"
    DjctqRatingReasonsDjctqLegalDrugs -> "djctqLegalDrugs"
    DjctqRatingReasonsDjctqIllegalDrugs -> "djctqIllegalDrugs"
    DjctqRatingReasonsDjctqInappropriateLanguage -> "djctqInappropriateLanguage"
    DjctqRatingReasonsDjctqCriminalActs -> "djctqCriminalActs"
    DjctqRatingReasonsDjctqImpactingContent -> "djctqImpactingContent"
    DjctqRatingReasonsDjctqFear -> "djctqFear"
    DjctqRatingReasonsDjctqMedicalProcedures -> "djctqMedicalProcedures"
    DjctqRatingReasonsDjctqSensitiveTopics -> "djctqSensitiveTopics"
    DjctqRatingReasonsDjctqFantasyViolence -> "djctqFantasyViolence"
  }
}

pub fn djctq_rating_reasons_decoder() -> Decoder(DjctqRatingReasons) {
  use value <- decode.then(decode.string)
  case value {
    "djctqRatingReasonUnspecified" -> decode.success(
      DjctqRatingReasonsDjctqRatingReasonUnspecified,
    )
    "djctqViolence" -> decode.success(DjctqRatingReasonsDjctqViolence)
    "djctqExtremeViolence" -> decode.success(
      DjctqRatingReasonsDjctqExtremeViolence,
    )
    "djctqSexualContent" -> decode.success(DjctqRatingReasonsDjctqSexualContent)
    "djctqNudity" -> decode.success(DjctqRatingReasonsDjctqNudity)
    "djctqSex" -> decode.success(DjctqRatingReasonsDjctqSex)
    "djctqExplicitSex" -> decode.success(DjctqRatingReasonsDjctqExplicitSex)
    "djctqDrugs" -> decode.success(DjctqRatingReasonsDjctqDrugs)
    "djctqLegalDrugs" -> decode.success(DjctqRatingReasonsDjctqLegalDrugs)
    "djctqIllegalDrugs" -> decode.success(DjctqRatingReasonsDjctqIllegalDrugs)
    "djctqInappropriateLanguage" -> decode.success(
      DjctqRatingReasonsDjctqInappropriateLanguage,
    )
    "djctqCriminalActs" -> decode.success(DjctqRatingReasonsDjctqCriminalActs)
    "djctqImpactingContent" -> decode.success(
      DjctqRatingReasonsDjctqImpactingContent,
    )
    "djctqFear" -> decode.success(DjctqRatingReasonsDjctqFear)
    "djctqMedicalProcedures" -> decode.success(
      DjctqRatingReasonsDjctqMedicalProcedures,
    )
    "djctqSensitiveTopics" -> decode.success(
      DjctqRatingReasonsDjctqSensitiveTopics,
    )
    "djctqFantasyViolence" -> decode.success(
      DjctqRatingReasonsDjctqFantasyViolence,
    )
    _ -> decode.failure(
      DjctqRatingReasonsDjctqRatingReasonUnspecified,
      "a valid DjctqRatingReasons",
    )
  }
}

/// Rating system in Turkey - Evaluation and Classification Board of the Ministry of Culture and Tourism
pub type EcbmctRating {
  EcbmctRatingEcbmctUnspecified
  EcbmctRatingEcbmctG
  EcbmctRatingEcbmct7a
  EcbmctRatingEcbmct7plus
  EcbmctRatingEcbmct13a
  EcbmctRatingEcbmct13plus
  EcbmctRatingEcbmct15a
  EcbmctRatingEcbmct15plus
  EcbmctRatingEcbmct18plus
  EcbmctRatingEcbmctUnrated
}

pub fn ecbmct_rating_to_string(value: EcbmctRating) -> String {
  case value {
    EcbmctRatingEcbmctUnspecified -> "ecbmctUnspecified"
    EcbmctRatingEcbmctG -> "ecbmctG"
    EcbmctRatingEcbmct7a -> "ecbmct7a"
    EcbmctRatingEcbmct7plus -> "ecbmct7plus"
    EcbmctRatingEcbmct13a -> "ecbmct13a"
    EcbmctRatingEcbmct13plus -> "ecbmct13plus"
    EcbmctRatingEcbmct15a -> "ecbmct15a"
    EcbmctRatingEcbmct15plus -> "ecbmct15plus"
    EcbmctRatingEcbmct18plus -> "ecbmct18plus"
    EcbmctRatingEcbmctUnrated -> "ecbmctUnrated"
  }
}

pub fn ecbmct_rating_decoder() -> Decoder(EcbmctRating) {
  use value <- decode.then(decode.string)
  case value {
    "ecbmctUnspecified" -> decode.success(EcbmctRatingEcbmctUnspecified)
    "ecbmctG" -> decode.success(EcbmctRatingEcbmctG)
    "ecbmct7a" -> decode.success(EcbmctRatingEcbmct7a)
    "ecbmct7plus" -> decode.success(EcbmctRatingEcbmct7plus)
    "ecbmct13a" -> decode.success(EcbmctRatingEcbmct13a)
    "ecbmct13plus" -> decode.success(EcbmctRatingEcbmct13plus)
    "ecbmct15a" -> decode.success(EcbmctRatingEcbmct15a)
    "ecbmct15plus" -> decode.success(EcbmctRatingEcbmct15plus)
    "ecbmct18plus" -> decode.success(EcbmctRatingEcbmct18plus)
    "ecbmctUnrated" -> decode.success(EcbmctRatingEcbmctUnrated)
    _ -> decode.failure(EcbmctRatingEcbmctUnspecified, "a valid EcbmctRating")
  }
}

/// The video's rating in Estonia.
pub type EefilmRating {
  EefilmRatingEefilmUnspecified
  EefilmRatingEefilmPere
  EefilmRatingEefilmL
  EefilmRatingEefilmMs6
  EefilmRatingEefilmK6
  EefilmRatingEefilmMs12
  EefilmRatingEefilmK12
  EefilmRatingEefilmK14
  EefilmRatingEefilmK16
  EefilmRatingEefilmUnrated
}

pub fn eefilm_rating_to_string(value: EefilmRating) -> String {
  case value {
    EefilmRatingEefilmUnspecified -> "eefilmUnspecified"
    EefilmRatingEefilmPere -> "eefilmPere"
    EefilmRatingEefilmL -> "eefilmL"
    EefilmRatingEefilmMs6 -> "eefilmMs6"
    EefilmRatingEefilmK6 -> "eefilmK6"
    EefilmRatingEefilmMs12 -> "eefilmMs12"
    EefilmRatingEefilmK12 -> "eefilmK12"
    EefilmRatingEefilmK14 -> "eefilmK14"
    EefilmRatingEefilmK16 -> "eefilmK16"
    EefilmRatingEefilmUnrated -> "eefilmUnrated"
  }
}

pub fn eefilm_rating_decoder() -> Decoder(EefilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "eefilmUnspecified" -> decode.success(EefilmRatingEefilmUnspecified)
    "eefilmPere" -> decode.success(EefilmRatingEefilmPere)
    "eefilmL" -> decode.success(EefilmRatingEefilmL)
    "eefilmMs6" -> decode.success(EefilmRatingEefilmMs6)
    "eefilmK6" -> decode.success(EefilmRatingEefilmK6)
    "eefilmMs12" -> decode.success(EefilmRatingEefilmMs12)
    "eefilmK12" -> decode.success(EefilmRatingEefilmK12)
    "eefilmK14" -> decode.success(EefilmRatingEefilmK14)
    "eefilmK16" -> decode.success(EefilmRatingEefilmK16)
    "eefilmUnrated" -> decode.success(EefilmRatingEefilmUnrated)
    _ -> decode.failure(EefilmRatingEefilmUnspecified, "a valid EefilmRating")
  }
}

/// The video's rating in Egypt.
pub type EgfilmRating {
  EgfilmRatingEgfilmUnspecified
  EgfilmRatingEgfilmGn
  EgfilmRatingEgfilm18
  EgfilmRatingEgfilmBn
  EgfilmRatingEgfilmUnrated
}

pub fn egfilm_rating_to_string(value: EgfilmRating) -> String {
  case value {
    EgfilmRatingEgfilmUnspecified -> "egfilmUnspecified"
    EgfilmRatingEgfilmGn -> "egfilmGn"
    EgfilmRatingEgfilm18 -> "egfilm18"
    EgfilmRatingEgfilmBn -> "egfilmBn"
    EgfilmRatingEgfilmUnrated -> "egfilmUnrated"
  }
}

pub fn egfilm_rating_decoder() -> Decoder(EgfilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "egfilmUnspecified" -> decode.success(EgfilmRatingEgfilmUnspecified)
    "egfilmGn" -> decode.success(EgfilmRatingEgfilmGn)
    "egfilm18" -> decode.success(EgfilmRatingEgfilm18)
    "egfilmBn" -> decode.success(EgfilmRatingEgfilmBn)
    "egfilmUnrated" -> decode.success(EgfilmRatingEgfilmUnrated)
    _ -> decode.failure(EgfilmRatingEgfilmUnspecified, "a valid EgfilmRating")
  }
}

/// The video's Eirin (映倫) rating. Eirin is the Japanese rating system.
pub type EirinRating {
  EirinRatingEirinUnspecified
  EirinRatingEirinG
  EirinRatingEirinPg12
  EirinRatingEirinR15plus
  EirinRatingEirinR18plus
  EirinRatingEirinUnrated
}

pub fn eirin_rating_to_string(value: EirinRating) -> String {
  case value {
    EirinRatingEirinUnspecified -> "eirinUnspecified"
    EirinRatingEirinG -> "eirinG"
    EirinRatingEirinPg12 -> "eirinPg12"
    EirinRatingEirinR15plus -> "eirinR15plus"
    EirinRatingEirinR18plus -> "eirinR18plus"
    EirinRatingEirinUnrated -> "eirinUnrated"
  }
}

pub fn eirin_rating_decoder() -> Decoder(EirinRating) {
  use value <- decode.then(decode.string)
  case value {
    "eirinUnspecified" -> decode.success(EirinRatingEirinUnspecified)
    "eirinG" -> decode.success(EirinRatingEirinG)
    "eirinPg12" -> decode.success(EirinRatingEirinPg12)
    "eirinR15plus" -> decode.success(EirinRatingEirinR15plus)
    "eirinR18plus" -> decode.success(EirinRatingEirinR18plus)
    "eirinUnrated" -> decode.success(EirinRatingEirinUnrated)
    _ -> decode.failure(EirinRatingEirinUnspecified, "a valid EirinRating")
  }
}

/// The video's rating from Malaysia's Film Censorship Board.
pub type FcbmRating {
  FcbmRatingFcbmUnspecified
  FcbmRatingFcbmU
  FcbmRatingFcbmPg13
  FcbmRatingFcbmP13
  FcbmRatingFcbm18
  FcbmRatingFcbm18sx
  FcbmRatingFcbm18pa
  FcbmRatingFcbm18sg
  FcbmRatingFcbm18pl
  FcbmRatingFcbmUnrated
}

pub fn fcbm_rating_to_string(value: FcbmRating) -> String {
  case value {
    FcbmRatingFcbmUnspecified -> "fcbmUnspecified"
    FcbmRatingFcbmU -> "fcbmU"
    FcbmRatingFcbmPg13 -> "fcbmPg13"
    FcbmRatingFcbmP13 -> "fcbmP13"
    FcbmRatingFcbm18 -> "fcbm18"
    FcbmRatingFcbm18sx -> "fcbm18sx"
    FcbmRatingFcbm18pa -> "fcbm18pa"
    FcbmRatingFcbm18sg -> "fcbm18sg"
    FcbmRatingFcbm18pl -> "fcbm18pl"
    FcbmRatingFcbmUnrated -> "fcbmUnrated"
  }
}

pub fn fcbm_rating_decoder() -> Decoder(FcbmRating) {
  use value <- decode.then(decode.string)
  case value {
    "fcbmUnspecified" -> decode.success(FcbmRatingFcbmUnspecified)
    "fcbmU" -> decode.success(FcbmRatingFcbmU)
    "fcbmPg13" -> decode.success(FcbmRatingFcbmPg13)
    "fcbmP13" -> decode.success(FcbmRatingFcbmP13)
    "fcbm18" -> decode.success(FcbmRatingFcbm18)
    "fcbm18sx" -> decode.success(FcbmRatingFcbm18sx)
    "fcbm18pa" -> decode.success(FcbmRatingFcbm18pa)
    "fcbm18sg" -> decode.success(FcbmRatingFcbm18sg)
    "fcbm18pl" -> decode.success(FcbmRatingFcbm18pl)
    "fcbmUnrated" -> decode.success(FcbmRatingFcbmUnrated)
    _ -> decode.failure(FcbmRatingFcbmUnspecified, "a valid FcbmRating")
  }
}

/// The video's rating from Hong Kong's Office for Film, Newspaper and Article Administration.
pub type FcoRating {
  FcoRatingFcoUnspecified
  FcoRatingFcoI
  FcoRatingFcoIia
  FcoRatingFcoIib
  FcoRatingFcoIi
  FcoRatingFcoIii
  FcoRatingFcoUnrated
}

pub fn fco_rating_to_string(value: FcoRating) -> String {
  case value {
    FcoRatingFcoUnspecified -> "fcoUnspecified"
    FcoRatingFcoI -> "fcoI"
    FcoRatingFcoIia -> "fcoIia"
    FcoRatingFcoIib -> "fcoIib"
    FcoRatingFcoIi -> "fcoIi"
    FcoRatingFcoIii -> "fcoIii"
    FcoRatingFcoUnrated -> "fcoUnrated"
  }
}

pub fn fco_rating_decoder() -> Decoder(FcoRating) {
  use value <- decode.then(decode.string)
  case value {
    "fcoUnspecified" -> decode.success(FcoRatingFcoUnspecified)
    "fcoI" -> decode.success(FcoRatingFcoI)
    "fcoIia" -> decode.success(FcoRatingFcoIia)
    "fcoIib" -> decode.success(FcoRatingFcoIib)
    "fcoIi" -> decode.success(FcoRatingFcoIi)
    "fcoIii" -> decode.success(FcoRatingFcoIii)
    "fcoUnrated" -> decode.success(FcoRatingFcoUnrated)
    _ -> decode.failure(FcoRatingFcoUnspecified, "a valid FcoRating")
  }
}

/// This property has been deprecated. Use the contentDetails.contentRating.cncRating instead.
pub type FmocRating {
  FmocRatingFmocUnspecified
  FmocRatingFmocU
  FmocRatingFmoc10
  FmocRatingFmoc12
  FmocRatingFmoc16
  FmocRatingFmoc18
  FmocRatingFmocE
  FmocRatingFmocUnrated
}

pub fn fmoc_rating_to_string(value: FmocRating) -> String {
  case value {
    FmocRatingFmocUnspecified -> "fmocUnspecified"
    FmocRatingFmocU -> "fmocU"
    FmocRatingFmoc10 -> "fmoc10"
    FmocRatingFmoc12 -> "fmoc12"
    FmocRatingFmoc16 -> "fmoc16"
    FmocRatingFmoc18 -> "fmoc18"
    FmocRatingFmocE -> "fmocE"
    FmocRatingFmocUnrated -> "fmocUnrated"
  }
}

pub fn fmoc_rating_decoder() -> Decoder(FmocRating) {
  use value <- decode.then(decode.string)
  case value {
    "fmocUnspecified" -> decode.success(FmocRatingFmocUnspecified)
    "fmocU" -> decode.success(FmocRatingFmocU)
    "fmoc10" -> decode.success(FmocRatingFmoc10)
    "fmoc12" -> decode.success(FmocRatingFmoc12)
    "fmoc16" -> decode.success(FmocRatingFmoc16)
    "fmoc18" -> decode.success(FmocRatingFmoc18)
    "fmocE" -> decode.success(FmocRatingFmocE)
    "fmocUnrated" -> decode.success(FmocRatingFmocUnrated)
    _ -> decode.failure(FmocRatingFmocUnspecified, "a valid FmocRating")
  }
}

/// The video's rating from South Africa's Film and Publication Board.
pub type FpbRating {
  FpbRatingFpbUnspecified
  FpbRatingFpbA
  FpbRatingFpbPg
  FpbRatingFpb79Pg
  FpbRatingFpb1012Pg
  FpbRatingFpb13
  FpbRatingFpb16
  FpbRatingFpb18
  FpbRatingFpbX18
  FpbRatingFpbXx
  FpbRatingFpbUnrated
  FpbRatingFpb10
}

pub fn fpb_rating_to_string(value: FpbRating) -> String {
  case value {
    FpbRatingFpbUnspecified -> "fpbUnspecified"
    FpbRatingFpbA -> "fpbA"
    FpbRatingFpbPg -> "fpbPg"
    FpbRatingFpb79Pg -> "fpb79Pg"
    FpbRatingFpb1012Pg -> "fpb1012Pg"
    FpbRatingFpb13 -> "fpb13"
    FpbRatingFpb16 -> "fpb16"
    FpbRatingFpb18 -> "fpb18"
    FpbRatingFpbX18 -> "fpbX18"
    FpbRatingFpbXx -> "fpbXx"
    FpbRatingFpbUnrated -> "fpbUnrated"
    FpbRatingFpb10 -> "fpb10"
  }
}

pub fn fpb_rating_decoder() -> Decoder(FpbRating) {
  use value <- decode.then(decode.string)
  case value {
    "fpbUnspecified" -> decode.success(FpbRatingFpbUnspecified)
    "fpbA" -> decode.success(FpbRatingFpbA)
    "fpbPg" -> decode.success(FpbRatingFpbPg)
    "fpb79Pg" -> decode.success(FpbRatingFpb79Pg)
    "fpb1012Pg" -> decode.success(FpbRatingFpb1012Pg)
    "fpb13" -> decode.success(FpbRatingFpb13)
    "fpb16" -> decode.success(FpbRatingFpb16)
    "fpb18" -> decode.success(FpbRatingFpb18)
    "fpbX18" -> decode.success(FpbRatingFpbX18)
    "fpbXx" -> decode.success(FpbRatingFpbXx)
    "fpbUnrated" -> decode.success(FpbRatingFpbUnrated)
    "fpb10" -> decode.success(FpbRatingFpb10)
    _ -> decode.failure(FpbRatingFpbUnspecified, "a valid FpbRating")
  }
}

/// Reasons that explain why the video received its FPB (South Africa) rating.
pub type FpbRatingReasons {
  FpbRatingReasonsFpbRatingReasonUnspecified
  FpbRatingReasonsFpbBlasphemy
  FpbRatingReasonsFpbLanguage
  FpbRatingReasonsFpbNudity
  FpbRatingReasonsFpbPrejudice
  FpbRatingReasonsFpbSex
  FpbRatingReasonsFpbViolence
  FpbRatingReasonsFpbDrugs
  FpbRatingReasonsFpbSexualViolence
  FpbRatingReasonsFpbHorror
  FpbRatingReasonsFpbCriminalTechniques
  FpbRatingReasonsFpbImitativeActsTechniques
}

pub fn fpb_rating_reasons_to_string(value: FpbRatingReasons) -> String {
  case value {
    FpbRatingReasonsFpbRatingReasonUnspecified -> "fpbRatingReasonUnspecified"
    FpbRatingReasonsFpbBlasphemy -> "fpbBlasphemy"
    FpbRatingReasonsFpbLanguage -> "fpbLanguage"
    FpbRatingReasonsFpbNudity -> "fpbNudity"
    FpbRatingReasonsFpbPrejudice -> "fpbPrejudice"
    FpbRatingReasonsFpbSex -> "fpbSex"
    FpbRatingReasonsFpbViolence -> "fpbViolence"
    FpbRatingReasonsFpbDrugs -> "fpbDrugs"
    FpbRatingReasonsFpbSexualViolence -> "fpbSexualViolence"
    FpbRatingReasonsFpbHorror -> "fpbHorror"
    FpbRatingReasonsFpbCriminalTechniques -> "fpbCriminalTechniques"
    FpbRatingReasonsFpbImitativeActsTechniques -> "fpbImitativeActsTechniques"
  }
}

pub fn fpb_rating_reasons_decoder() -> Decoder(FpbRatingReasons) {
  use value <- decode.then(decode.string)
  case value {
    "fpbRatingReasonUnspecified" -> decode.success(
      FpbRatingReasonsFpbRatingReasonUnspecified,
    )
    "fpbBlasphemy" -> decode.success(FpbRatingReasonsFpbBlasphemy)
    "fpbLanguage" -> decode.success(FpbRatingReasonsFpbLanguage)
    "fpbNudity" -> decode.success(FpbRatingReasonsFpbNudity)
    "fpbPrejudice" -> decode.success(FpbRatingReasonsFpbPrejudice)
    "fpbSex" -> decode.success(FpbRatingReasonsFpbSex)
    "fpbViolence" -> decode.success(FpbRatingReasonsFpbViolence)
    "fpbDrugs" -> decode.success(FpbRatingReasonsFpbDrugs)
    "fpbSexualViolence" -> decode.success(FpbRatingReasonsFpbSexualViolence)
    "fpbHorror" -> decode.success(FpbRatingReasonsFpbHorror)
    "fpbCriminalTechniques" -> decode.success(
      FpbRatingReasonsFpbCriminalTechniques,
    )
    "fpbImitativeActsTechniques" -> decode.success(
      FpbRatingReasonsFpbImitativeActsTechniques,
    )
    _ -> decode.failure(
      FpbRatingReasonsFpbRatingReasonUnspecified,
      "a valid FpbRatingReasons",
    )
  }
}

/// The video's Freiwillige Selbstkontrolle der Filmwirtschaft (FSK - Germany) rating.
pub type FskRating {
  FskRatingFskUnspecified
  FskRatingFsk0
  FskRatingFsk6
  FskRatingFsk12
  FskRatingFsk16
  FskRatingFsk18
  FskRatingFskUnrated
}

pub fn fsk_rating_to_string(value: FskRating) -> String {
  case value {
    FskRatingFskUnspecified -> "fskUnspecified"
    FskRatingFsk0 -> "fsk0"
    FskRatingFsk6 -> "fsk6"
    FskRatingFsk12 -> "fsk12"
    FskRatingFsk16 -> "fsk16"
    FskRatingFsk18 -> "fsk18"
    FskRatingFskUnrated -> "fskUnrated"
  }
}

pub fn fsk_rating_decoder() -> Decoder(FskRating) {
  use value <- decode.then(decode.string)
  case value {
    "fskUnspecified" -> decode.success(FskRatingFskUnspecified)
    "fsk0" -> decode.success(FskRatingFsk0)
    "fsk6" -> decode.success(FskRatingFsk6)
    "fsk12" -> decode.success(FskRatingFsk12)
    "fsk16" -> decode.success(FskRatingFsk16)
    "fsk18" -> decode.success(FskRatingFsk18)
    "fskUnrated" -> decode.success(FskRatingFskUnrated)
    _ -> decode.failure(FskRatingFskUnspecified, "a valid FskRating")
  }
}

/// The video's rating in Greece.
pub type GrfilmRating {
  GrfilmRatingGrfilmUnspecified
  GrfilmRatingGrfilmK
  GrfilmRatingGrfilmE
  GrfilmRatingGrfilmK12
  GrfilmRatingGrfilmK13
  GrfilmRatingGrfilmK15
  GrfilmRatingGrfilmK17
  GrfilmRatingGrfilmK18
  GrfilmRatingGrfilmUnrated
}

pub fn grfilm_rating_to_string(value: GrfilmRating) -> String {
  case value {
    GrfilmRatingGrfilmUnspecified -> "grfilmUnspecified"
    GrfilmRatingGrfilmK -> "grfilmK"
    GrfilmRatingGrfilmE -> "grfilmE"
    GrfilmRatingGrfilmK12 -> "grfilmK12"
    GrfilmRatingGrfilmK13 -> "grfilmK13"
    GrfilmRatingGrfilmK15 -> "grfilmK15"
    GrfilmRatingGrfilmK17 -> "grfilmK17"
    GrfilmRatingGrfilmK18 -> "grfilmK18"
    GrfilmRatingGrfilmUnrated -> "grfilmUnrated"
  }
}

pub fn grfilm_rating_decoder() -> Decoder(GrfilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "grfilmUnspecified" -> decode.success(GrfilmRatingGrfilmUnspecified)
    "grfilmK" -> decode.success(GrfilmRatingGrfilmK)
    "grfilmE" -> decode.success(GrfilmRatingGrfilmE)
    "grfilmK12" -> decode.success(GrfilmRatingGrfilmK12)
    "grfilmK13" -> decode.success(GrfilmRatingGrfilmK13)
    "grfilmK15" -> decode.success(GrfilmRatingGrfilmK15)
    "grfilmK17" -> decode.success(GrfilmRatingGrfilmK17)
    "grfilmK18" -> decode.success(GrfilmRatingGrfilmK18)
    "grfilmUnrated" -> decode.success(GrfilmRatingGrfilmUnrated)
    _ -> decode.failure(GrfilmRatingGrfilmUnspecified, "a valid GrfilmRating")
  }
}

/// The video's Instituto de la Cinematografía y de las Artes Audiovisuales (ICAA - Spain) rating.
pub type IcaaRating {
  IcaaRatingIcaaUnspecified
  IcaaRatingIcaaApta
  IcaaRatingIcaa7
  IcaaRatingIcaa12
  IcaaRatingIcaa13
  IcaaRatingIcaa16
  IcaaRatingIcaa18
  IcaaRatingIcaaX
  IcaaRatingIcaaUnrated
}

pub fn icaa_rating_to_string(value: IcaaRating) -> String {
  case value {
    IcaaRatingIcaaUnspecified -> "icaaUnspecified"
    IcaaRatingIcaaApta -> "icaaApta"
    IcaaRatingIcaa7 -> "icaa7"
    IcaaRatingIcaa12 -> "icaa12"
    IcaaRatingIcaa13 -> "icaa13"
    IcaaRatingIcaa16 -> "icaa16"
    IcaaRatingIcaa18 -> "icaa18"
    IcaaRatingIcaaX -> "icaaX"
    IcaaRatingIcaaUnrated -> "icaaUnrated"
  }
}

pub fn icaa_rating_decoder() -> Decoder(IcaaRating) {
  use value <- decode.then(decode.string)
  case value {
    "icaaUnspecified" -> decode.success(IcaaRatingIcaaUnspecified)
    "icaaApta" -> decode.success(IcaaRatingIcaaApta)
    "icaa7" -> decode.success(IcaaRatingIcaa7)
    "icaa12" -> decode.success(IcaaRatingIcaa12)
    "icaa13" -> decode.success(IcaaRatingIcaa13)
    "icaa16" -> decode.success(IcaaRatingIcaa16)
    "icaa18" -> decode.success(IcaaRatingIcaa18)
    "icaaX" -> decode.success(IcaaRatingIcaaX)
    "icaaUnrated" -> decode.success(IcaaRatingIcaaUnrated)
    _ -> decode.failure(IcaaRatingIcaaUnspecified, "a valid IcaaRating")
  }
}

/// The video's Irish Film Classification Office (IFCO - Ireland) rating. See the IFCO website for more information.
pub type IfcoRating {
  IfcoRatingIfcoUnspecified
  IfcoRatingIfcoG
  IfcoRatingIfcoPg
  IfcoRatingIfco12
  IfcoRatingIfco12a
  IfcoRatingIfco15
  IfcoRatingIfco15a
  IfcoRatingIfco16
  IfcoRatingIfco18
  IfcoRatingIfcoUnrated
}

pub fn ifco_rating_to_string(value: IfcoRating) -> String {
  case value {
    IfcoRatingIfcoUnspecified -> "ifcoUnspecified"
    IfcoRatingIfcoG -> "ifcoG"
    IfcoRatingIfcoPg -> "ifcoPg"
    IfcoRatingIfco12 -> "ifco12"
    IfcoRatingIfco12a -> "ifco12a"
    IfcoRatingIfco15 -> "ifco15"
    IfcoRatingIfco15a -> "ifco15a"
    IfcoRatingIfco16 -> "ifco16"
    IfcoRatingIfco18 -> "ifco18"
    IfcoRatingIfcoUnrated -> "ifcoUnrated"
  }
}

pub fn ifco_rating_decoder() -> Decoder(IfcoRating) {
  use value <- decode.then(decode.string)
  case value {
    "ifcoUnspecified" -> decode.success(IfcoRatingIfcoUnspecified)
    "ifcoG" -> decode.success(IfcoRatingIfcoG)
    "ifcoPg" -> decode.success(IfcoRatingIfcoPg)
    "ifco12" -> decode.success(IfcoRatingIfco12)
    "ifco12a" -> decode.success(IfcoRatingIfco12a)
    "ifco15" -> decode.success(IfcoRatingIfco15)
    "ifco15a" -> decode.success(IfcoRatingIfco15a)
    "ifco16" -> decode.success(IfcoRatingIfco16)
    "ifco18" -> decode.success(IfcoRatingIfco18)
    "ifcoUnrated" -> decode.success(IfcoRatingIfcoUnrated)
    _ -> decode.failure(IfcoRatingIfcoUnspecified, "a valid IfcoRating")
  }
}

/// The video's rating in Israel.
pub type IlfilmRating {
  IlfilmRatingIlfilmUnspecified
  IlfilmRatingIlfilmAa
  IlfilmRatingIlfilm12
  IlfilmRatingIlfilm14
  IlfilmRatingIlfilm16
  IlfilmRatingIlfilm18
  IlfilmRatingIlfilmUnrated
}

pub fn ilfilm_rating_to_string(value: IlfilmRating) -> String {
  case value {
    IlfilmRatingIlfilmUnspecified -> "ilfilmUnspecified"
    IlfilmRatingIlfilmAa -> "ilfilmAa"
    IlfilmRatingIlfilm12 -> "ilfilm12"
    IlfilmRatingIlfilm14 -> "ilfilm14"
    IlfilmRatingIlfilm16 -> "ilfilm16"
    IlfilmRatingIlfilm18 -> "ilfilm18"
    IlfilmRatingIlfilmUnrated -> "ilfilmUnrated"
  }
}

pub fn ilfilm_rating_decoder() -> Decoder(IlfilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "ilfilmUnspecified" -> decode.success(IlfilmRatingIlfilmUnspecified)
    "ilfilmAa" -> decode.success(IlfilmRatingIlfilmAa)
    "ilfilm12" -> decode.success(IlfilmRatingIlfilm12)
    "ilfilm14" -> decode.success(IlfilmRatingIlfilm14)
    "ilfilm16" -> decode.success(IlfilmRatingIlfilm16)
    "ilfilm18" -> decode.success(IlfilmRatingIlfilm18)
    "ilfilmUnrated" -> decode.success(IlfilmRatingIlfilmUnrated)
    _ -> decode.failure(IlfilmRatingIlfilmUnspecified, "a valid IlfilmRating")
  }
}

/// The video's INCAA (Instituto Nacional de Cine y Artes Audiovisuales - Argentina) rating.
pub type IncaaRating {
  IncaaRatingIncaaUnspecified
  IncaaRatingIncaaAtp
  IncaaRatingIncaaSam13
  IncaaRatingIncaaSam16
  IncaaRatingIncaaSam18
  IncaaRatingIncaaC
  IncaaRatingIncaaUnrated
}

pub fn incaa_rating_to_string(value: IncaaRating) -> String {
  case value {
    IncaaRatingIncaaUnspecified -> "incaaUnspecified"
    IncaaRatingIncaaAtp -> "incaaAtp"
    IncaaRatingIncaaSam13 -> "incaaSam13"
    IncaaRatingIncaaSam16 -> "incaaSam16"
    IncaaRatingIncaaSam18 -> "incaaSam18"
    IncaaRatingIncaaC -> "incaaC"
    IncaaRatingIncaaUnrated -> "incaaUnrated"
  }
}

pub fn incaa_rating_decoder() -> Decoder(IncaaRating) {
  use value <- decode.then(decode.string)
  case value {
    "incaaUnspecified" -> decode.success(IncaaRatingIncaaUnspecified)
    "incaaAtp" -> decode.success(IncaaRatingIncaaAtp)
    "incaaSam13" -> decode.success(IncaaRatingIncaaSam13)
    "incaaSam16" -> decode.success(IncaaRatingIncaaSam16)
    "incaaSam18" -> decode.success(IncaaRatingIncaaSam18)
    "incaaC" -> decode.success(IncaaRatingIncaaC)
    "incaaUnrated" -> decode.success(IncaaRatingIncaaUnrated)
    _ -> decode.failure(IncaaRatingIncaaUnspecified, "a valid IncaaRating")
  }
}

/// The video's rating from the Kenya Film Classification Board.
pub type KfcbRating {
  KfcbRatingKfcbUnspecified
  KfcbRatingKfcbG
  KfcbRatingKfcbPg
  KfcbRatingKfcb16plus
  KfcbRatingKfcbR
  KfcbRatingKfcbUnrated
}

pub fn kfcb_rating_to_string(value: KfcbRating) -> String {
  case value {
    KfcbRatingKfcbUnspecified -> "kfcbUnspecified"
    KfcbRatingKfcbG -> "kfcbG"
    KfcbRatingKfcbPg -> "kfcbPg"
    KfcbRatingKfcb16plus -> "kfcb16plus"
    KfcbRatingKfcbR -> "kfcbR"
    KfcbRatingKfcbUnrated -> "kfcbUnrated"
  }
}

pub fn kfcb_rating_decoder() -> Decoder(KfcbRating) {
  use value <- decode.then(decode.string)
  case value {
    "kfcbUnspecified" -> decode.success(KfcbRatingKfcbUnspecified)
    "kfcbG" -> decode.success(KfcbRatingKfcbG)
    "kfcbPg" -> decode.success(KfcbRatingKfcbPg)
    "kfcb16plus" -> decode.success(KfcbRatingKfcb16plus)
    "kfcbR" -> decode.success(KfcbRatingKfcbR)
    "kfcbUnrated" -> decode.success(KfcbRatingKfcbUnrated)
    _ -> decode.failure(KfcbRatingKfcbUnspecified, "a valid KfcbRating")
  }
}

/// The video's NICAM/Kijkwijzer rating from the Nederlands Instituut voor de Classificatie van Audiovisuele Media (Netherlands).
pub type KijkwijzerRating {
  KijkwijzerRatingKijkwijzerUnspecified
  KijkwijzerRatingKijkwijzerAl
  KijkwijzerRatingKijkwijzer6
  KijkwijzerRatingKijkwijzer9
  KijkwijzerRatingKijkwijzer12
  KijkwijzerRatingKijkwijzer16
  KijkwijzerRatingKijkwijzer18
  KijkwijzerRatingKijkwijzerUnrated
}

pub fn kijkwijzer_rating_to_string(value: KijkwijzerRating) -> String {
  case value {
    KijkwijzerRatingKijkwijzerUnspecified -> "kijkwijzerUnspecified"
    KijkwijzerRatingKijkwijzerAl -> "kijkwijzerAl"
    KijkwijzerRatingKijkwijzer6 -> "kijkwijzer6"
    KijkwijzerRatingKijkwijzer9 -> "kijkwijzer9"
    KijkwijzerRatingKijkwijzer12 -> "kijkwijzer12"
    KijkwijzerRatingKijkwijzer16 -> "kijkwijzer16"
    KijkwijzerRatingKijkwijzer18 -> "kijkwijzer18"
    KijkwijzerRatingKijkwijzerUnrated -> "kijkwijzerUnrated"
  }
}

pub fn kijkwijzer_rating_decoder() -> Decoder(KijkwijzerRating) {
  use value <- decode.then(decode.string)
  case value {
    "kijkwijzerUnspecified" -> decode.success(
      KijkwijzerRatingKijkwijzerUnspecified,
    )
    "kijkwijzerAl" -> decode.success(KijkwijzerRatingKijkwijzerAl)
    "kijkwijzer6" -> decode.success(KijkwijzerRatingKijkwijzer6)
    "kijkwijzer9" -> decode.success(KijkwijzerRatingKijkwijzer9)
    "kijkwijzer12" -> decode.success(KijkwijzerRatingKijkwijzer12)
    "kijkwijzer16" -> decode.success(KijkwijzerRatingKijkwijzer16)
    "kijkwijzer18" -> decode.success(KijkwijzerRatingKijkwijzer18)
    "kijkwijzerUnrated" -> decode.success(KijkwijzerRatingKijkwijzerUnrated)
    _ -> decode.failure(
      KijkwijzerRatingKijkwijzerUnspecified,
      "a valid KijkwijzerRating",
    )
  }
}

/// The video's Korea Media Rating Board (영상물등급위원회) rating. The KMRB rates videos in South Korea.
pub type KmrbRating {
  KmrbRatingKmrbUnspecified
  KmrbRatingKmrbAll
  KmrbRatingKmrb12plus
  KmrbRatingKmrb15plus
  KmrbRatingKmrbTeenr
  KmrbRatingKmrbR
  KmrbRatingKmrbUnrated
}

pub fn kmrb_rating_to_string(value: KmrbRating) -> String {
  case value {
    KmrbRatingKmrbUnspecified -> "kmrbUnspecified"
    KmrbRatingKmrbAll -> "kmrbAll"
    KmrbRatingKmrb12plus -> "kmrb12plus"
    KmrbRatingKmrb15plus -> "kmrb15plus"
    KmrbRatingKmrbTeenr -> "kmrbTeenr"
    KmrbRatingKmrbR -> "kmrbR"
    KmrbRatingKmrbUnrated -> "kmrbUnrated"
  }
}

pub fn kmrb_rating_decoder() -> Decoder(KmrbRating) {
  use value <- decode.then(decode.string)
  case value {
    "kmrbUnspecified" -> decode.success(KmrbRatingKmrbUnspecified)
    "kmrbAll" -> decode.success(KmrbRatingKmrbAll)
    "kmrb12plus" -> decode.success(KmrbRatingKmrb12plus)
    "kmrb15plus" -> decode.success(KmrbRatingKmrb15plus)
    "kmrbTeenr" -> decode.success(KmrbRatingKmrbTeenr)
    "kmrbR" -> decode.success(KmrbRatingKmrbR)
    "kmrbUnrated" -> decode.success(KmrbRatingKmrbUnrated)
    _ -> decode.failure(KmrbRatingKmrbUnspecified, "a valid KmrbRating")
  }
}

/// The video's rating from Indonesia's Lembaga Sensor Film.
pub type LsfRating {
  LsfRatingLsfUnspecified
  LsfRatingLsfSu
  LsfRatingLsfA
  LsfRatingLsfBo
  LsfRatingLsf13
  LsfRatingLsfR
  LsfRatingLsf17
  LsfRatingLsfD
  LsfRatingLsf21
  LsfRatingLsfUnrated
}

pub fn lsf_rating_to_string(value: LsfRating) -> String {
  case value {
    LsfRatingLsfUnspecified -> "lsfUnspecified"
    LsfRatingLsfSu -> "lsfSu"
    LsfRatingLsfA -> "lsfA"
    LsfRatingLsfBo -> "lsfBo"
    LsfRatingLsf13 -> "lsf13"
    LsfRatingLsfR -> "lsfR"
    LsfRatingLsf17 -> "lsf17"
    LsfRatingLsfD -> "lsfD"
    LsfRatingLsf21 -> "lsf21"
    LsfRatingLsfUnrated -> "lsfUnrated"
  }
}

pub fn lsf_rating_decoder() -> Decoder(LsfRating) {
  use value <- decode.then(decode.string)
  case value {
    "lsfUnspecified" -> decode.success(LsfRatingLsfUnspecified)
    "lsfSu" -> decode.success(LsfRatingLsfSu)
    "lsfA" -> decode.success(LsfRatingLsfA)
    "lsfBo" -> decode.success(LsfRatingLsfBo)
    "lsf13" -> decode.success(LsfRatingLsf13)
    "lsfR" -> decode.success(LsfRatingLsfR)
    "lsf17" -> decode.success(LsfRatingLsf17)
    "lsfD" -> decode.success(LsfRatingLsfD)
    "lsf21" -> decode.success(LsfRatingLsf21)
    "lsfUnrated" -> decode.success(LsfRatingLsfUnrated)
    _ -> decode.failure(LsfRatingLsfUnspecified, "a valid LsfRating")
  }
}

/// The video's rating from Malta's Film Age-Classification Board.
pub type MccaaRating {
  MccaaRatingMccaaUnspecified
  MccaaRatingMccaaU
  MccaaRatingMccaaPg
  MccaaRatingMccaa12a
  MccaaRatingMccaa12
  MccaaRatingMccaa14
  MccaaRatingMccaa15
  MccaaRatingMccaa16
  MccaaRatingMccaa18
  MccaaRatingMccaaUnrated
}

pub fn mccaa_rating_to_string(value: MccaaRating) -> String {
  case value {
    MccaaRatingMccaaUnspecified -> "mccaaUnspecified"
    MccaaRatingMccaaU -> "mccaaU"
    MccaaRatingMccaaPg -> "mccaaPg"
    MccaaRatingMccaa12a -> "mccaa12a"
    MccaaRatingMccaa12 -> "mccaa12"
    MccaaRatingMccaa14 -> "mccaa14"
    MccaaRatingMccaa15 -> "mccaa15"
    MccaaRatingMccaa16 -> "mccaa16"
    MccaaRatingMccaa18 -> "mccaa18"
    MccaaRatingMccaaUnrated -> "mccaaUnrated"
  }
}

pub fn mccaa_rating_decoder() -> Decoder(MccaaRating) {
  use value <- decode.then(decode.string)
  case value {
    "mccaaUnspecified" -> decode.success(MccaaRatingMccaaUnspecified)
    "mccaaU" -> decode.success(MccaaRatingMccaaU)
    "mccaaPg" -> decode.success(MccaaRatingMccaaPg)
    "mccaa12a" -> decode.success(MccaaRatingMccaa12a)
    "mccaa12" -> decode.success(MccaaRatingMccaa12)
    "mccaa14" -> decode.success(MccaaRatingMccaa14)
    "mccaa15" -> decode.success(MccaaRatingMccaa15)
    "mccaa16" -> decode.success(MccaaRatingMccaa16)
    "mccaa18" -> decode.success(MccaaRatingMccaa18)
    "mccaaUnrated" -> decode.success(MccaaRatingMccaaUnrated)
    _ -> decode.failure(MccaaRatingMccaaUnspecified, "a valid MccaaRating")
  }
}

/// The video's rating from the Danish Film Institute's (Det Danske Filminstitut) Media Council for Children and Young People.
pub type MccypRating {
  MccypRatingMccypUnspecified
  MccypRatingMccypA
  MccypRatingMccyp7
  MccypRatingMccyp11
  MccypRatingMccyp15
  MccypRatingMccypUnrated
}

pub fn mccyp_rating_to_string(value: MccypRating) -> String {
  case value {
    MccypRatingMccypUnspecified -> "mccypUnspecified"
    MccypRatingMccypA -> "mccypA"
    MccypRatingMccyp7 -> "mccyp7"
    MccypRatingMccyp11 -> "mccyp11"
    MccypRatingMccyp15 -> "mccyp15"
    MccypRatingMccypUnrated -> "mccypUnrated"
  }
}

pub fn mccyp_rating_decoder() -> Decoder(MccypRating) {
  use value <- decode.then(decode.string)
  case value {
    "mccypUnspecified" -> decode.success(MccypRatingMccypUnspecified)
    "mccypA" -> decode.success(MccypRatingMccypA)
    "mccyp7" -> decode.success(MccypRatingMccyp7)
    "mccyp11" -> decode.success(MccypRatingMccyp11)
    "mccyp15" -> decode.success(MccypRatingMccyp15)
    "mccypUnrated" -> decode.success(MccypRatingMccypUnrated)
    _ -> decode.failure(MccypRatingMccypUnspecified, "a valid MccypRating")
  }
}

/// The video's rating system for Vietnam - MCST
pub type McstRating {
  McstRatingMcstUnspecified
  McstRatingMcstP
  McstRatingMcst0
  McstRatingMcstC13
  McstRatingMcstC16
  McstRatingMcst16plus
  McstRatingMcstC18
  McstRatingMcstGpg
  McstRatingMcstUnrated
}

pub fn mcst_rating_to_string(value: McstRating) -> String {
  case value {
    McstRatingMcstUnspecified -> "mcstUnspecified"
    McstRatingMcstP -> "mcstP"
    McstRatingMcst0 -> "mcst0"
    McstRatingMcstC13 -> "mcstC13"
    McstRatingMcstC16 -> "mcstC16"
    McstRatingMcst16plus -> "mcst16plus"
    McstRatingMcstC18 -> "mcstC18"
    McstRatingMcstGpg -> "mcstGPg"
    McstRatingMcstUnrated -> "mcstUnrated"
  }
}

pub fn mcst_rating_decoder() -> Decoder(McstRating) {
  use value <- decode.then(decode.string)
  case value {
    "mcstUnspecified" -> decode.success(McstRatingMcstUnspecified)
    "mcstP" -> decode.success(McstRatingMcstP)
    "mcst0" -> decode.success(McstRatingMcst0)
    "mcstC13" -> decode.success(McstRatingMcstC13)
    "mcstC16" -> decode.success(McstRatingMcstC16)
    "mcst16plus" -> decode.success(McstRatingMcst16plus)
    "mcstC18" -> decode.success(McstRatingMcstC18)
    "mcstGPg" -> decode.success(McstRatingMcstGpg)
    "mcstUnrated" -> decode.success(McstRatingMcstUnrated)
    _ -> decode.failure(McstRatingMcstUnspecified, "a valid McstRating")
  }
}

/// The video's rating from Singapore's Media Development Authority (MDA) and, specifically, it's Board of Film Censors (BFC).
pub type MdaRating {
  MdaRatingMdaUnspecified
  MdaRatingMdaG
  MdaRatingMdaPg
  MdaRatingMdaPg13
  MdaRatingMdaNc16
  MdaRatingMdaM18
  MdaRatingMdaR21
  MdaRatingMdaUnrated
}

pub fn mda_rating_to_string(value: MdaRating) -> String {
  case value {
    MdaRatingMdaUnspecified -> "mdaUnspecified"
    MdaRatingMdaG -> "mdaG"
    MdaRatingMdaPg -> "mdaPg"
    MdaRatingMdaPg13 -> "mdaPg13"
    MdaRatingMdaNc16 -> "mdaNc16"
    MdaRatingMdaM18 -> "mdaM18"
    MdaRatingMdaR21 -> "mdaR21"
    MdaRatingMdaUnrated -> "mdaUnrated"
  }
}

pub fn mda_rating_decoder() -> Decoder(MdaRating) {
  use value <- decode.then(decode.string)
  case value {
    "mdaUnspecified" -> decode.success(MdaRatingMdaUnspecified)
    "mdaG" -> decode.success(MdaRatingMdaG)
    "mdaPg" -> decode.success(MdaRatingMdaPg)
    "mdaPg13" -> decode.success(MdaRatingMdaPg13)
    "mdaNc16" -> decode.success(MdaRatingMdaNc16)
    "mdaM18" -> decode.success(MdaRatingMdaM18)
    "mdaR21" -> decode.success(MdaRatingMdaR21)
    "mdaUnrated" -> decode.success(MdaRatingMdaUnrated)
    _ -> decode.failure(MdaRatingMdaUnspecified, "a valid MdaRating")
  }
}

/// The video's rating from Medietilsynet, the Norwegian Media Authority.
pub type MedietilsynetRating {
  MedietilsynetRatingMedietilsynetUnspecified
  MedietilsynetRatingMedietilsynetA
  MedietilsynetRatingMedietilsynet6
  MedietilsynetRatingMedietilsynet7
  MedietilsynetRatingMedietilsynet9
  MedietilsynetRatingMedietilsynet11
  MedietilsynetRatingMedietilsynet12
  MedietilsynetRatingMedietilsynet15
  MedietilsynetRatingMedietilsynet18
  MedietilsynetRatingMedietilsynetUnrated
}

pub fn medietilsynet_rating_to_string(value: MedietilsynetRating) -> String {
  case value {
    MedietilsynetRatingMedietilsynetUnspecified -> "medietilsynetUnspecified"
    MedietilsynetRatingMedietilsynetA -> "medietilsynetA"
    MedietilsynetRatingMedietilsynet6 -> "medietilsynet6"
    MedietilsynetRatingMedietilsynet7 -> "medietilsynet7"
    MedietilsynetRatingMedietilsynet9 -> "medietilsynet9"
    MedietilsynetRatingMedietilsynet11 -> "medietilsynet11"
    MedietilsynetRatingMedietilsynet12 -> "medietilsynet12"
    MedietilsynetRatingMedietilsynet15 -> "medietilsynet15"
    MedietilsynetRatingMedietilsynet18 -> "medietilsynet18"
    MedietilsynetRatingMedietilsynetUnrated -> "medietilsynetUnrated"
  }
}

pub fn medietilsynet_rating_decoder() -> Decoder(MedietilsynetRating) {
  use value <- decode.then(decode.string)
  case value {
    "medietilsynetUnspecified" -> decode.success(
      MedietilsynetRatingMedietilsynetUnspecified,
    )
    "medietilsynetA" -> decode.success(MedietilsynetRatingMedietilsynetA)
    "medietilsynet6" -> decode.success(MedietilsynetRatingMedietilsynet6)
    "medietilsynet7" -> decode.success(MedietilsynetRatingMedietilsynet7)
    "medietilsynet9" -> decode.success(MedietilsynetRatingMedietilsynet9)
    "medietilsynet11" -> decode.success(MedietilsynetRatingMedietilsynet11)
    "medietilsynet12" -> decode.success(MedietilsynetRatingMedietilsynet12)
    "medietilsynet15" -> decode.success(MedietilsynetRatingMedietilsynet15)
    "medietilsynet18" -> decode.success(MedietilsynetRatingMedietilsynet18)
    "medietilsynetUnrated" -> decode.success(
      MedietilsynetRatingMedietilsynetUnrated,
    )
    _ -> decode.failure(
      MedietilsynetRatingMedietilsynetUnspecified,
      "a valid MedietilsynetRating",
    )
  }
}

/// The video's rating from Finland's Kansallinen Audiovisuaalinen Instituutti (National Audiovisual Institute).
pub type MekuRating {
  MekuRatingMekuUnspecified
  MekuRatingMekuS
  MekuRatingMeku7
  MekuRatingMeku12
  MekuRatingMeku16
  MekuRatingMeku18
  MekuRatingMekuUnrated
}

pub fn meku_rating_to_string(value: MekuRating) -> String {
  case value {
    MekuRatingMekuUnspecified -> "mekuUnspecified"
    MekuRatingMekuS -> "mekuS"
    MekuRatingMeku7 -> "meku7"
    MekuRatingMeku12 -> "meku12"
    MekuRatingMeku16 -> "meku16"
    MekuRatingMeku18 -> "meku18"
    MekuRatingMekuUnrated -> "mekuUnrated"
  }
}

pub fn meku_rating_decoder() -> Decoder(MekuRating) {
  use value <- decode.then(decode.string)
  case value {
    "mekuUnspecified" -> decode.success(MekuRatingMekuUnspecified)
    "mekuS" -> decode.success(MekuRatingMekuS)
    "meku7" -> decode.success(MekuRatingMeku7)
    "meku12" -> decode.success(MekuRatingMeku12)
    "meku16" -> decode.success(MekuRatingMeku16)
    "meku18" -> decode.success(MekuRatingMeku18)
    "mekuUnrated" -> decode.success(MekuRatingMekuUnrated)
    _ -> decode.failure(MekuRatingMekuUnspecified, "a valid MekuRating")
  }
}

/// The rating system for MENA countries, a clone of MPAA. It is needed to prevent titles go live w/o additional QC check, since some of them can be inappropriate for the countries at all. See b/33408548 for more details.
pub type MenaMpaaRating {
  MenaMpaaRatingMenaMpaaUnspecified
  MenaMpaaRatingMenaMpaaG
  MenaMpaaRatingMenaMpaaPg
  MenaMpaaRatingMenaMpaaPg13
  MenaMpaaRatingMenaMpaaR
  MenaMpaaRatingMenaMpaaUnrated
}

pub fn mena_mpaa_rating_to_string(value: MenaMpaaRating) -> String {
  case value {
    MenaMpaaRatingMenaMpaaUnspecified -> "menaMpaaUnspecified"
    MenaMpaaRatingMenaMpaaG -> "menaMpaaG"
    MenaMpaaRatingMenaMpaaPg -> "menaMpaaPg"
    MenaMpaaRatingMenaMpaaPg13 -> "menaMpaaPg13"
    MenaMpaaRatingMenaMpaaR -> "menaMpaaR"
    MenaMpaaRatingMenaMpaaUnrated -> "menaMpaaUnrated"
  }
}

pub fn mena_mpaa_rating_decoder() -> Decoder(MenaMpaaRating) {
  use value <- decode.then(decode.string)
  case value {
    "menaMpaaUnspecified" -> decode.success(MenaMpaaRatingMenaMpaaUnspecified)
    "menaMpaaG" -> decode.success(MenaMpaaRatingMenaMpaaG)
    "menaMpaaPg" -> decode.success(MenaMpaaRatingMenaMpaaPg)
    "menaMpaaPg13" -> decode.success(MenaMpaaRatingMenaMpaaPg13)
    "menaMpaaR" -> decode.success(MenaMpaaRatingMenaMpaaR)
    "menaMpaaUnrated" -> decode.success(MenaMpaaRatingMenaMpaaUnrated)
    _ -> decode.failure(
      MenaMpaaRatingMenaMpaaUnspecified,
      "a valid MenaMpaaRating",
    )
  }
}

/// The video's rating from the Ministero dei Beni e delle Attività Culturali e del Turismo (Italy).
pub type MibacRating {
  MibacRatingMibacUnspecified
  MibacRatingMibacT
  MibacRatingMibacVap
  MibacRatingMibacVm6
  MibacRatingMibacVm12
  MibacRatingMibacVm14
  MibacRatingMibacVm16
  MibacRatingMibacVm18
  MibacRatingMibacUnrated
}

pub fn mibac_rating_to_string(value: MibacRating) -> String {
  case value {
    MibacRatingMibacUnspecified -> "mibacUnspecified"
    MibacRatingMibacT -> "mibacT"
    MibacRatingMibacVap -> "mibacVap"
    MibacRatingMibacVm6 -> "mibacVm6"
    MibacRatingMibacVm12 -> "mibacVm12"
    MibacRatingMibacVm14 -> "mibacVm14"
    MibacRatingMibacVm16 -> "mibacVm16"
    MibacRatingMibacVm18 -> "mibacVm18"
    MibacRatingMibacUnrated -> "mibacUnrated"
  }
}

pub fn mibac_rating_decoder() -> Decoder(MibacRating) {
  use value <- decode.then(decode.string)
  case value {
    "mibacUnspecified" -> decode.success(MibacRatingMibacUnspecified)
    "mibacT" -> decode.success(MibacRatingMibacT)
    "mibacVap" -> decode.success(MibacRatingMibacVap)
    "mibacVm6" -> decode.success(MibacRatingMibacVm6)
    "mibacVm12" -> decode.success(MibacRatingMibacVm12)
    "mibacVm14" -> decode.success(MibacRatingMibacVm14)
    "mibacVm16" -> decode.success(MibacRatingMibacVm16)
    "mibacVm18" -> decode.success(MibacRatingMibacVm18)
    "mibacUnrated" -> decode.success(MibacRatingMibacUnrated)
    _ -> decode.failure(MibacRatingMibacUnspecified, "a valid MibacRating")
  }
}

/// The video's Ministerio de Cultura (Colombia) rating.
pub type MocRating {
  MocRatingMocUnspecified
  MocRatingMocE
  MocRatingMocT
  MocRatingMoc7
  MocRatingMoc12
  MocRatingMoc15
  MocRatingMoc18
  MocRatingMocX
  MocRatingMocBanned
  MocRatingMocUnrated
}

pub fn moc_rating_to_string(value: MocRating) -> String {
  case value {
    MocRatingMocUnspecified -> "mocUnspecified"
    MocRatingMocE -> "mocE"
    MocRatingMocT -> "mocT"
    MocRatingMoc7 -> "moc7"
    MocRatingMoc12 -> "moc12"
    MocRatingMoc15 -> "moc15"
    MocRatingMoc18 -> "moc18"
    MocRatingMocX -> "mocX"
    MocRatingMocBanned -> "mocBanned"
    MocRatingMocUnrated -> "mocUnrated"
  }
}

pub fn moc_rating_decoder() -> Decoder(MocRating) {
  use value <- decode.then(decode.string)
  case value {
    "mocUnspecified" -> decode.success(MocRatingMocUnspecified)
    "mocE" -> decode.success(MocRatingMocE)
    "mocT" -> decode.success(MocRatingMocT)
    "moc7" -> decode.success(MocRatingMoc7)
    "moc12" -> decode.success(MocRatingMoc12)
    "moc15" -> decode.success(MocRatingMoc15)
    "moc18" -> decode.success(MocRatingMoc18)
    "mocX" -> decode.success(MocRatingMocX)
    "mocBanned" -> decode.success(MocRatingMocBanned)
    "mocUnrated" -> decode.success(MocRatingMocUnrated)
    _ -> decode.failure(MocRatingMocUnspecified, "a valid MocRating")
  }
}

/// The video's rating from Taiwan's Ministry of Culture (文化部).
pub type MoctwRating {
  MoctwRatingMoctwUnspecified
  MoctwRatingMoctwG
  MoctwRatingMoctwP
  MoctwRatingMoctwPg
  MoctwRatingMoctwR
  MoctwRatingMoctwUnrated
  MoctwRatingMoctwR12
  MoctwRatingMoctwR15
}

pub fn moctw_rating_to_string(value: MoctwRating) -> String {
  case value {
    MoctwRatingMoctwUnspecified -> "moctwUnspecified"
    MoctwRatingMoctwG -> "moctwG"
    MoctwRatingMoctwP -> "moctwP"
    MoctwRatingMoctwPg -> "moctwPg"
    MoctwRatingMoctwR -> "moctwR"
    MoctwRatingMoctwUnrated -> "moctwUnrated"
    MoctwRatingMoctwR12 -> "moctwR12"
    MoctwRatingMoctwR15 -> "moctwR15"
  }
}

pub fn moctw_rating_decoder() -> Decoder(MoctwRating) {
  use value <- decode.then(decode.string)
  case value {
    "moctwUnspecified" -> decode.success(MoctwRatingMoctwUnspecified)
    "moctwG" -> decode.success(MoctwRatingMoctwG)
    "moctwP" -> decode.success(MoctwRatingMoctwP)
    "moctwPg" -> decode.success(MoctwRatingMoctwPg)
    "moctwR" -> decode.success(MoctwRatingMoctwR)
    "moctwUnrated" -> decode.success(MoctwRatingMoctwUnrated)
    "moctwR12" -> decode.success(MoctwRatingMoctwR12)
    "moctwR15" -> decode.success(MoctwRatingMoctwR15)
    _ -> decode.failure(MoctwRatingMoctwUnspecified, "a valid MoctwRating")
  }
}

/// The video's Motion Picture Association of America (MPAA) rating.
pub type MpaaRating {
  MpaaRatingMpaaUnspecified
  MpaaRatingMpaaG
  MpaaRatingMpaaPg
  MpaaRatingMpaaPg13
  MpaaRatingMpaaR
  MpaaRatingMpaaNc17
  MpaaRatingMpaaX
  MpaaRatingMpaaUnrated
}

pub fn mpaa_rating_to_string(value: MpaaRating) -> String {
  case value {
    MpaaRatingMpaaUnspecified -> "mpaaUnspecified"
    MpaaRatingMpaaG -> "mpaaG"
    MpaaRatingMpaaPg -> "mpaaPg"
    MpaaRatingMpaaPg13 -> "mpaaPg13"
    MpaaRatingMpaaR -> "mpaaR"
    MpaaRatingMpaaNc17 -> "mpaaNc17"
    MpaaRatingMpaaX -> "mpaaX"
    MpaaRatingMpaaUnrated -> "mpaaUnrated"
  }
}

pub fn mpaa_rating_decoder() -> Decoder(MpaaRating) {
  use value <- decode.then(decode.string)
  case value {
    "mpaaUnspecified" -> decode.success(MpaaRatingMpaaUnspecified)
    "mpaaG" -> decode.success(MpaaRatingMpaaG)
    "mpaaPg" -> decode.success(MpaaRatingMpaaPg)
    "mpaaPg13" -> decode.success(MpaaRatingMpaaPg13)
    "mpaaR" -> decode.success(MpaaRatingMpaaR)
    "mpaaNc17" -> decode.success(MpaaRatingMpaaNc17)
    "mpaaX" -> decode.success(MpaaRatingMpaaX)
    "mpaaUnrated" -> decode.success(MpaaRatingMpaaUnrated)
    _ -> decode.failure(MpaaRatingMpaaUnspecified, "a valid MpaaRating")
  }
}

/// The rating system for trailer, DVD, and Ad in the US. See http://movielabs.com/md/ratings/v2.3/html/US_MPAAT_Ratings.html.
pub type MpaatRating {
  MpaatRatingMpaatUnspecified
  MpaatRatingMpaatGb
  MpaatRatingMpaatRb
}

pub fn mpaat_rating_to_string(value: MpaatRating) -> String {
  case value {
    MpaatRatingMpaatUnspecified -> "mpaatUnspecified"
    MpaatRatingMpaatGb -> "mpaatGb"
    MpaatRatingMpaatRb -> "mpaatRb"
  }
}

pub fn mpaat_rating_decoder() -> Decoder(MpaatRating) {
  use value <- decode.then(decode.string)
  case value {
    "mpaatUnspecified" -> decode.success(MpaatRatingMpaatUnspecified)
    "mpaatGb" -> decode.success(MpaatRatingMpaatGb)
    "mpaatRb" -> decode.success(MpaatRatingMpaatRb)
    _ -> decode.failure(MpaatRatingMpaatUnspecified, "a valid MpaatRating")
  }
}

/// The video's rating from the Movie and Television Review and Classification Board (Philippines).
pub type MtrcbRating {
  MtrcbRatingMtrcbUnspecified
  MtrcbRatingMtrcbG
  MtrcbRatingMtrcbPg
  MtrcbRatingMtrcbR13
  MtrcbRatingMtrcbR16
  MtrcbRatingMtrcbR18
  MtrcbRatingMtrcbX
  MtrcbRatingMtrcbUnrated
}

pub fn mtrcb_rating_to_string(value: MtrcbRating) -> String {
  case value {
    MtrcbRatingMtrcbUnspecified -> "mtrcbUnspecified"
    MtrcbRatingMtrcbG -> "mtrcbG"
    MtrcbRatingMtrcbPg -> "mtrcbPg"
    MtrcbRatingMtrcbR13 -> "mtrcbR13"
    MtrcbRatingMtrcbR16 -> "mtrcbR16"
    MtrcbRatingMtrcbR18 -> "mtrcbR18"
    MtrcbRatingMtrcbX -> "mtrcbX"
    MtrcbRatingMtrcbUnrated -> "mtrcbUnrated"
  }
}

pub fn mtrcb_rating_decoder() -> Decoder(MtrcbRating) {
  use value <- decode.then(decode.string)
  case value {
    "mtrcbUnspecified" -> decode.success(MtrcbRatingMtrcbUnspecified)
    "mtrcbG" -> decode.success(MtrcbRatingMtrcbG)
    "mtrcbPg" -> decode.success(MtrcbRatingMtrcbPg)
    "mtrcbR13" -> decode.success(MtrcbRatingMtrcbR13)
    "mtrcbR16" -> decode.success(MtrcbRatingMtrcbR16)
    "mtrcbR18" -> decode.success(MtrcbRatingMtrcbR18)
    "mtrcbX" -> decode.success(MtrcbRatingMtrcbX)
    "mtrcbUnrated" -> decode.success(MtrcbRatingMtrcbUnrated)
    _ -> decode.failure(MtrcbRatingMtrcbUnspecified, "a valid MtrcbRating")
  }
}

/// The video's rating from the Maldives National Bureau of Classification.
pub type NbcRating {
  NbcRatingNbcUnspecified
  NbcRatingNbcG
  NbcRatingNbcPg
  NbcRatingNbc12plus
  NbcRatingNbc15plus
  NbcRatingNbc18plus
  NbcRatingNbc18plusr
  NbcRatingNbcPu
  NbcRatingNbcUnrated
}

pub fn nbc_rating_to_string(value: NbcRating) -> String {
  case value {
    NbcRatingNbcUnspecified -> "nbcUnspecified"
    NbcRatingNbcG -> "nbcG"
    NbcRatingNbcPg -> "nbcPg"
    NbcRatingNbc12plus -> "nbc12plus"
    NbcRatingNbc15plus -> "nbc15plus"
    NbcRatingNbc18plus -> "nbc18plus"
    NbcRatingNbc18plusr -> "nbc18plusr"
    NbcRatingNbcPu -> "nbcPu"
    NbcRatingNbcUnrated -> "nbcUnrated"
  }
}

pub fn nbc_rating_decoder() -> Decoder(NbcRating) {
  use value <- decode.then(decode.string)
  case value {
    "nbcUnspecified" -> decode.success(NbcRatingNbcUnspecified)
    "nbcG" -> decode.success(NbcRatingNbcG)
    "nbcPg" -> decode.success(NbcRatingNbcPg)
    "nbc12plus" -> decode.success(NbcRatingNbc12plus)
    "nbc15plus" -> decode.success(NbcRatingNbc15plus)
    "nbc18plus" -> decode.success(NbcRatingNbc18plus)
    "nbc18plusr" -> decode.success(NbcRatingNbc18plusr)
    "nbcPu" -> decode.success(NbcRatingNbcPu)
    "nbcUnrated" -> decode.success(NbcRatingNbcUnrated)
    _ -> decode.failure(NbcRatingNbcUnspecified, "a valid NbcRating")
  }
}

/// The video's rating in Poland.
pub type NbcplRating {
  NbcplRatingNbcplUnspecified
  NbcplRatingNbcplI
  NbcplRatingNbcplIi
  NbcplRatingNbcplIii
  NbcplRatingNbcplIv
  NbcplRatingNbcpl18plus
  NbcplRatingNbcplUnrated
}

pub fn nbcpl_rating_to_string(value: NbcplRating) -> String {
  case value {
    NbcplRatingNbcplUnspecified -> "nbcplUnspecified"
    NbcplRatingNbcplI -> "nbcplI"
    NbcplRatingNbcplIi -> "nbcplIi"
    NbcplRatingNbcplIii -> "nbcplIii"
    NbcplRatingNbcplIv -> "nbcplIv"
    NbcplRatingNbcpl18plus -> "nbcpl18plus"
    NbcplRatingNbcplUnrated -> "nbcplUnrated"
  }
}

pub fn nbcpl_rating_decoder() -> Decoder(NbcplRating) {
  use value <- decode.then(decode.string)
  case value {
    "nbcplUnspecified" -> decode.success(NbcplRatingNbcplUnspecified)
    "nbcplI" -> decode.success(NbcplRatingNbcplI)
    "nbcplIi" -> decode.success(NbcplRatingNbcplIi)
    "nbcplIii" -> decode.success(NbcplRatingNbcplIii)
    "nbcplIv" -> decode.success(NbcplRatingNbcplIv)
    "nbcpl18plus" -> decode.success(NbcplRatingNbcpl18plus)
    "nbcplUnrated" -> decode.success(NbcplRatingNbcplUnrated)
    _ -> decode.failure(NbcplRatingNbcplUnspecified, "a valid NbcplRating")
  }
}

/// The video's rating from the Bulgarian National Film Center.
pub type NfrcRating {
  NfrcRatingNfrcUnspecified
  NfrcRatingNfrcA
  NfrcRatingNfrcB
  NfrcRatingNfrcC
  NfrcRatingNfrcD
  NfrcRatingNfrcX
  NfrcRatingNfrcUnrated
}

pub fn nfrc_rating_to_string(value: NfrcRating) -> String {
  case value {
    NfrcRatingNfrcUnspecified -> "nfrcUnspecified"
    NfrcRatingNfrcA -> "nfrcA"
    NfrcRatingNfrcB -> "nfrcB"
    NfrcRatingNfrcC -> "nfrcC"
    NfrcRatingNfrcD -> "nfrcD"
    NfrcRatingNfrcX -> "nfrcX"
    NfrcRatingNfrcUnrated -> "nfrcUnrated"
  }
}

pub fn nfrc_rating_decoder() -> Decoder(NfrcRating) {
  use value <- decode.then(decode.string)
  case value {
    "nfrcUnspecified" -> decode.success(NfrcRatingNfrcUnspecified)
    "nfrcA" -> decode.success(NfrcRatingNfrcA)
    "nfrcB" -> decode.success(NfrcRatingNfrcB)
    "nfrcC" -> decode.success(NfrcRatingNfrcC)
    "nfrcD" -> decode.success(NfrcRatingNfrcD)
    "nfrcX" -> decode.success(NfrcRatingNfrcX)
    "nfrcUnrated" -> decode.success(NfrcRatingNfrcUnrated)
    _ -> decode.failure(NfrcRatingNfrcUnspecified, "a valid NfrcRating")
  }
}

/// The video's rating from Nigeria's National Film and Video Censors Board.
pub type NfvcbRating {
  NfvcbRatingNfvcbUnspecified
  NfvcbRatingNfvcbG
  NfvcbRatingNfvcbPg
  NfvcbRatingNfvcb12
  NfvcbRatingNfvcb12a
  NfvcbRatingNfvcb15
  NfvcbRatingNfvcb18
  NfvcbRatingNfvcbRe
  NfvcbRatingNfvcbUnrated
}

pub fn nfvcb_rating_to_string(value: NfvcbRating) -> String {
  case value {
    NfvcbRatingNfvcbUnspecified -> "nfvcbUnspecified"
    NfvcbRatingNfvcbG -> "nfvcbG"
    NfvcbRatingNfvcbPg -> "nfvcbPg"
    NfvcbRatingNfvcb12 -> "nfvcb12"
    NfvcbRatingNfvcb12a -> "nfvcb12a"
    NfvcbRatingNfvcb15 -> "nfvcb15"
    NfvcbRatingNfvcb18 -> "nfvcb18"
    NfvcbRatingNfvcbRe -> "nfvcbRe"
    NfvcbRatingNfvcbUnrated -> "nfvcbUnrated"
  }
}

pub fn nfvcb_rating_decoder() -> Decoder(NfvcbRating) {
  use value <- decode.then(decode.string)
  case value {
    "nfvcbUnspecified" -> decode.success(NfvcbRatingNfvcbUnspecified)
    "nfvcbG" -> decode.success(NfvcbRatingNfvcbG)
    "nfvcbPg" -> decode.success(NfvcbRatingNfvcbPg)
    "nfvcb12" -> decode.success(NfvcbRatingNfvcb12)
    "nfvcb12a" -> decode.success(NfvcbRatingNfvcb12a)
    "nfvcb15" -> decode.success(NfvcbRatingNfvcb15)
    "nfvcb18" -> decode.success(NfvcbRatingNfvcb18)
    "nfvcbRe" -> decode.success(NfvcbRatingNfvcbRe)
    "nfvcbUnrated" -> decode.success(NfvcbRatingNfvcbUnrated)
    _ -> decode.failure(NfvcbRatingNfvcbUnspecified, "a valid NfvcbRating")
  }
}

/// The video's rating from the Nacionãlais Kino centrs (National Film Centre of Latvia).
pub type NkclvRating {
  NkclvRatingNkclvUnspecified
  NkclvRatingNkclvU
  NkclvRatingNkclv7plus
  NkclvRatingNkclv12plus
  NkclvRatingNkclv16plus
  NkclvRatingNkclv18plus
  NkclvRatingNkclvUnrated
}

pub fn nkclv_rating_to_string(value: NkclvRating) -> String {
  case value {
    NkclvRatingNkclvUnspecified -> "nkclvUnspecified"
    NkclvRatingNkclvU -> "nkclvU"
    NkclvRatingNkclv7plus -> "nkclv7plus"
    NkclvRatingNkclv12plus -> "nkclv12plus"
    NkclvRatingNkclv16plus -> "nkclv16plus"
    NkclvRatingNkclv18plus -> "nkclv18plus"
    NkclvRatingNkclvUnrated -> "nkclvUnrated"
  }
}

pub fn nkclv_rating_decoder() -> Decoder(NkclvRating) {
  use value <- decode.then(decode.string)
  case value {
    "nkclvUnspecified" -> decode.success(NkclvRatingNkclvUnspecified)
    "nkclvU" -> decode.success(NkclvRatingNkclvU)
    "nkclv7plus" -> decode.success(NkclvRatingNkclv7plus)
    "nkclv12plus" -> decode.success(NkclvRatingNkclv12plus)
    "nkclv16plus" -> decode.success(NkclvRatingNkclv16plus)
    "nkclv18plus" -> decode.success(NkclvRatingNkclv18plus)
    "nkclvUnrated" -> decode.success(NkclvRatingNkclvUnrated)
    _ -> decode.failure(NkclvRatingNkclvUnspecified, "a valid NkclvRating")
  }
}

/// The National Media Council ratings system for United Arab Emirates.
pub type NmcRating {
  NmcRatingNmcUnspecified
  NmcRatingNmcG
  NmcRatingNmcPg
  NmcRatingNmcPg13
  NmcRatingNmcPg15
  NmcRatingNmc15plus
  NmcRatingNmc18plus
  NmcRatingNmc18tc
  NmcRatingNmcUnrated
}

pub fn nmc_rating_to_string(value: NmcRating) -> String {
  case value {
    NmcRatingNmcUnspecified -> "nmcUnspecified"
    NmcRatingNmcG -> "nmcG"
    NmcRatingNmcPg -> "nmcPg"
    NmcRatingNmcPg13 -> "nmcPg13"
    NmcRatingNmcPg15 -> "nmcPg15"
    NmcRatingNmc15plus -> "nmc15plus"
    NmcRatingNmc18plus -> "nmc18plus"
    NmcRatingNmc18tc -> "nmc18tc"
    NmcRatingNmcUnrated -> "nmcUnrated"
  }
}

pub fn nmc_rating_decoder() -> Decoder(NmcRating) {
  use value <- decode.then(decode.string)
  case value {
    "nmcUnspecified" -> decode.success(NmcRatingNmcUnspecified)
    "nmcG" -> decode.success(NmcRatingNmcG)
    "nmcPg" -> decode.success(NmcRatingNmcPg)
    "nmcPg13" -> decode.success(NmcRatingNmcPg13)
    "nmcPg15" -> decode.success(NmcRatingNmcPg15)
    "nmc15plus" -> decode.success(NmcRatingNmc15plus)
    "nmc18plus" -> decode.success(NmcRatingNmc18plus)
    "nmc18tc" -> decode.success(NmcRatingNmc18tc)
    "nmcUnrated" -> decode.success(NmcRatingNmcUnrated)
    _ -> decode.failure(NmcRatingNmcUnspecified, "a valid NmcRating")
  }
}

/// The video's Office of Film and Literature Classification (OFLC - New Zealand) rating.
pub type OflcRating {
  OflcRatingOflcUnspecified
  OflcRatingOflcG
  OflcRatingOflcPg
  OflcRatingOflcM
  OflcRatingOflcR13
  OflcRatingOflcR15
  OflcRatingOflcR16
  OflcRatingOflcR18
  OflcRatingOflcUnrated
  OflcRatingOflcRp13
  OflcRatingOflcRp16
  OflcRatingOflcRp18
}

pub fn oflc_rating_to_string(value: OflcRating) -> String {
  case value {
    OflcRatingOflcUnspecified -> "oflcUnspecified"
    OflcRatingOflcG -> "oflcG"
    OflcRatingOflcPg -> "oflcPg"
    OflcRatingOflcM -> "oflcM"
    OflcRatingOflcR13 -> "oflcR13"
    OflcRatingOflcR15 -> "oflcR15"
    OflcRatingOflcR16 -> "oflcR16"
    OflcRatingOflcR18 -> "oflcR18"
    OflcRatingOflcUnrated -> "oflcUnrated"
    OflcRatingOflcRp13 -> "oflcRp13"
    OflcRatingOflcRp16 -> "oflcRp16"
    OflcRatingOflcRp18 -> "oflcRp18"
  }
}

pub fn oflc_rating_decoder() -> Decoder(OflcRating) {
  use value <- decode.then(decode.string)
  case value {
    "oflcUnspecified" -> decode.success(OflcRatingOflcUnspecified)
    "oflcG" -> decode.success(OflcRatingOflcG)
    "oflcPg" -> decode.success(OflcRatingOflcPg)
    "oflcM" -> decode.success(OflcRatingOflcM)
    "oflcR13" -> decode.success(OflcRatingOflcR13)
    "oflcR15" -> decode.success(OflcRatingOflcR15)
    "oflcR16" -> decode.success(OflcRatingOflcR16)
    "oflcR18" -> decode.success(OflcRatingOflcR18)
    "oflcUnrated" -> decode.success(OflcRatingOflcUnrated)
    "oflcRp13" -> decode.success(OflcRatingOflcRp13)
    "oflcRp16" -> decode.success(OflcRatingOflcRp16)
    "oflcRp18" -> decode.success(OflcRatingOflcRp18)
    _ -> decode.failure(OflcRatingOflcUnspecified, "a valid OflcRating")
  }
}

/// The video's rating in Peru.
pub type PefilmRating {
  PefilmRatingPefilmUnspecified
  PefilmRatingPefilmPt
  PefilmRatingPefilmPg
  PefilmRatingPefilm14
  PefilmRatingPefilm18
  PefilmRatingPefilmUnrated
}

pub fn pefilm_rating_to_string(value: PefilmRating) -> String {
  case value {
    PefilmRatingPefilmUnspecified -> "pefilmUnspecified"
    PefilmRatingPefilmPt -> "pefilmPt"
    PefilmRatingPefilmPg -> "pefilmPg"
    PefilmRatingPefilm14 -> "pefilm14"
    PefilmRatingPefilm18 -> "pefilm18"
    PefilmRatingPefilmUnrated -> "pefilmUnrated"
  }
}

pub fn pefilm_rating_decoder() -> Decoder(PefilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "pefilmUnspecified" -> decode.success(PefilmRatingPefilmUnspecified)
    "pefilmPt" -> decode.success(PefilmRatingPefilmPt)
    "pefilmPg" -> decode.success(PefilmRatingPefilmPg)
    "pefilm14" -> decode.success(PefilmRatingPefilm14)
    "pefilm18" -> decode.success(PefilmRatingPefilm18)
    "pefilmUnrated" -> decode.success(PefilmRatingPefilmUnrated)
    _ -> decode.failure(PefilmRatingPefilmUnspecified, "a valid PefilmRating")
  }
}

/// The video's rating from the Hungarian Nemzeti Filmiroda, the Rating Committee of the National Office of Film.
pub type RcnofRating {
  RcnofRatingRcnofUnspecified
  RcnofRatingRcnofI
  RcnofRatingRcnofIi
  RcnofRatingRcnofIii
  RcnofRatingRcnofIv
  RcnofRatingRcnofV
  RcnofRatingRcnofVi
  RcnofRatingRcnofUnrated
}

pub fn rcnof_rating_to_string(value: RcnofRating) -> String {
  case value {
    RcnofRatingRcnofUnspecified -> "rcnofUnspecified"
    RcnofRatingRcnofI -> "rcnofI"
    RcnofRatingRcnofIi -> "rcnofIi"
    RcnofRatingRcnofIii -> "rcnofIii"
    RcnofRatingRcnofIv -> "rcnofIv"
    RcnofRatingRcnofV -> "rcnofV"
    RcnofRatingRcnofVi -> "rcnofVi"
    RcnofRatingRcnofUnrated -> "rcnofUnrated"
  }
}

pub fn rcnof_rating_decoder() -> Decoder(RcnofRating) {
  use value <- decode.then(decode.string)
  case value {
    "rcnofUnspecified" -> decode.success(RcnofRatingRcnofUnspecified)
    "rcnofI" -> decode.success(RcnofRatingRcnofI)
    "rcnofIi" -> decode.success(RcnofRatingRcnofIi)
    "rcnofIii" -> decode.success(RcnofRatingRcnofIii)
    "rcnofIv" -> decode.success(RcnofRatingRcnofIv)
    "rcnofV" -> decode.success(RcnofRatingRcnofV)
    "rcnofVi" -> decode.success(RcnofRatingRcnofVi)
    "rcnofUnrated" -> decode.success(RcnofRatingRcnofUnrated)
    _ -> decode.failure(RcnofRatingRcnofUnspecified, "a valid RcnofRating")
  }
}

/// The video's rating in Venezuela.
pub type ResorteviolenciaRating {
  ResorteviolenciaRatingResorteviolenciaUnspecified
  ResorteviolenciaRatingResorteviolenciaA
  ResorteviolenciaRatingResorteviolenciaB
  ResorteviolenciaRatingResorteviolenciaC
  ResorteviolenciaRatingResorteviolenciaD
  ResorteviolenciaRatingResorteviolenciaE
  ResorteviolenciaRatingResorteviolenciaUnrated
}

pub fn resorteviolencia_rating_to_string(value: ResorteviolenciaRating) -> String {
  case value
  {
    ResorteviolenciaRatingResorteviolenciaUnspecified -> "resorteviolenciaUnspecified"
    ResorteviolenciaRatingResorteviolenciaA -> "resorteviolenciaA"
    ResorteviolenciaRatingResorteviolenciaB -> "resorteviolenciaB"
    ResorteviolenciaRatingResorteviolenciaC -> "resorteviolenciaC"
    ResorteviolenciaRatingResorteviolenciaD -> "resorteviolenciaD"
    ResorteviolenciaRatingResorteviolenciaE -> "resorteviolenciaE"
    ResorteviolenciaRatingResorteviolenciaUnrated -> "resorteviolenciaUnrated"
  }
}

pub fn resorteviolencia_rating_decoder() -> Decoder(ResorteviolenciaRating) {
  use value <- decode.then(decode.string)
  case value {
    "resorteviolenciaUnspecified" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaUnspecified,
    )
    "resorteviolenciaA" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaA,
    )
    "resorteviolenciaB" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaB,
    )
    "resorteviolenciaC" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaC,
    )
    "resorteviolenciaD" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaD,
    )
    "resorteviolenciaE" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaE,
    )
    "resorteviolenciaUnrated" -> decode.success(
      ResorteviolenciaRatingResorteviolenciaUnrated,
    )
    _ -> decode.failure(
      ResorteviolenciaRatingResorteviolenciaUnspecified,
      "a valid ResorteviolenciaRating",
    )
  }
}

/// The video's General Directorate of Radio, Television and Cinematography (Mexico) rating.
pub type RtcRating {
  RtcRatingRtcUnspecified
  RtcRatingRtcAa
  RtcRatingRtcA
  RtcRatingRtcB
  RtcRatingRtcB15
  RtcRatingRtcC
  RtcRatingRtcD
  RtcRatingRtcUnrated
}

pub fn rtc_rating_to_string(value: RtcRating) -> String {
  case value {
    RtcRatingRtcUnspecified -> "rtcUnspecified"
    RtcRatingRtcAa -> "rtcAa"
    RtcRatingRtcA -> "rtcA"
    RtcRatingRtcB -> "rtcB"
    RtcRatingRtcB15 -> "rtcB15"
    RtcRatingRtcC -> "rtcC"
    RtcRatingRtcD -> "rtcD"
    RtcRatingRtcUnrated -> "rtcUnrated"
  }
}

pub fn rtc_rating_decoder() -> Decoder(RtcRating) {
  use value <- decode.then(decode.string)
  case value {
    "rtcUnspecified" -> decode.success(RtcRatingRtcUnspecified)
    "rtcAa" -> decode.success(RtcRatingRtcAa)
    "rtcA" -> decode.success(RtcRatingRtcA)
    "rtcB" -> decode.success(RtcRatingRtcB)
    "rtcB15" -> decode.success(RtcRatingRtcB15)
    "rtcC" -> decode.success(RtcRatingRtcC)
    "rtcD" -> decode.success(RtcRatingRtcD)
    "rtcUnrated" -> decode.success(RtcRatingRtcUnrated)
    _ -> decode.failure(RtcRatingRtcUnspecified, "a valid RtcRating")
  }
}

/// The video's rating from Ireland's Raidió Teilifís Éireann.
pub type RteRating {
  RteRatingRteUnspecified
  RteRatingRteGa
  RteRatingRteCh
  RteRatingRtePs
  RteRatingRteMa
  RteRatingRteUnrated
}

pub fn rte_rating_to_string(value: RteRating) -> String {
  case value {
    RteRatingRteUnspecified -> "rteUnspecified"
    RteRatingRteGa -> "rteGa"
    RteRatingRteCh -> "rteCh"
    RteRatingRtePs -> "rtePs"
    RteRatingRteMa -> "rteMa"
    RteRatingRteUnrated -> "rteUnrated"
  }
}

pub fn rte_rating_decoder() -> Decoder(RteRating) {
  use value <- decode.then(decode.string)
  case value {
    "rteUnspecified" -> decode.success(RteRatingRteUnspecified)
    "rteGa" -> decode.success(RteRatingRteGa)
    "rteCh" -> decode.success(RteRatingRteCh)
    "rtePs" -> decode.success(RteRatingRtePs)
    "rteMa" -> decode.success(RteRatingRteMa)
    "rteUnrated" -> decode.success(RteRatingRteUnrated)
    _ -> decode.failure(RteRatingRteUnspecified, "a valid RteRating")
  }
}

/// The video's National Film Registry of the Russian Federation (MKRF - Russia) rating.
pub type RussiaRating {
  RussiaRatingRussiaUnspecified
  RussiaRatingRussia0
  RussiaRatingRussia6
  RussiaRatingRussia12
  RussiaRatingRussia16
  RussiaRatingRussia18
  RussiaRatingRussiaUnrated
}

pub fn russia_rating_to_string(value: RussiaRating) -> String {
  case value {
    RussiaRatingRussiaUnspecified -> "russiaUnspecified"
    RussiaRatingRussia0 -> "russia0"
    RussiaRatingRussia6 -> "russia6"
    RussiaRatingRussia12 -> "russia12"
    RussiaRatingRussia16 -> "russia16"
    RussiaRatingRussia18 -> "russia18"
    RussiaRatingRussiaUnrated -> "russiaUnrated"
  }
}

pub fn russia_rating_decoder() -> Decoder(RussiaRating) {
  use value <- decode.then(decode.string)
  case value {
    "russiaUnspecified" -> decode.success(RussiaRatingRussiaUnspecified)
    "russia0" -> decode.success(RussiaRatingRussia0)
    "russia6" -> decode.success(RussiaRatingRussia6)
    "russia12" -> decode.success(RussiaRatingRussia12)
    "russia16" -> decode.success(RussiaRatingRussia16)
    "russia18" -> decode.success(RussiaRatingRussia18)
    "russiaUnrated" -> decode.success(RussiaRatingRussiaUnrated)
    _ -> decode.failure(RussiaRatingRussiaUnspecified, "a valid RussiaRating")
  }
}

/// The video's rating in Slovakia.
pub type SkfilmRating {
  SkfilmRatingSkfilmUnspecified
  SkfilmRatingSkfilmG
  SkfilmRatingSkfilmP2
  SkfilmRatingSkfilmP5
  SkfilmRatingSkfilmP8
  SkfilmRatingSkfilmUnrated
}

pub fn skfilm_rating_to_string(value: SkfilmRating) -> String {
  case value {
    SkfilmRatingSkfilmUnspecified -> "skfilmUnspecified"
    SkfilmRatingSkfilmG -> "skfilmG"
    SkfilmRatingSkfilmP2 -> "skfilmP2"
    SkfilmRatingSkfilmP5 -> "skfilmP5"
    SkfilmRatingSkfilmP8 -> "skfilmP8"
    SkfilmRatingSkfilmUnrated -> "skfilmUnrated"
  }
}

pub fn skfilm_rating_decoder() -> Decoder(SkfilmRating) {
  use value <- decode.then(decode.string)
  case value {
    "skfilmUnspecified" -> decode.success(SkfilmRatingSkfilmUnspecified)
    "skfilmG" -> decode.success(SkfilmRatingSkfilmG)
    "skfilmP2" -> decode.success(SkfilmRatingSkfilmP2)
    "skfilmP5" -> decode.success(SkfilmRatingSkfilmP5)
    "skfilmP8" -> decode.success(SkfilmRatingSkfilmP8)
    "skfilmUnrated" -> decode.success(SkfilmRatingSkfilmUnrated)
    _ -> decode.failure(SkfilmRatingSkfilmUnspecified, "a valid SkfilmRating")
  }
}

/// The video's rating in Iceland.
pub type SmaisRating {
  SmaisRatingSmaisUnspecified
  SmaisRatingSmaisL
  SmaisRatingSmais7
  SmaisRatingSmais12
  SmaisRatingSmais14
  SmaisRatingSmais16
  SmaisRatingSmais18
  SmaisRatingSmaisUnrated
}

pub fn smais_rating_to_string(value: SmaisRating) -> String {
  case value {
    SmaisRatingSmaisUnspecified -> "smaisUnspecified"
    SmaisRatingSmaisL -> "smaisL"
    SmaisRatingSmais7 -> "smais7"
    SmaisRatingSmais12 -> "smais12"
    SmaisRatingSmais14 -> "smais14"
    SmaisRatingSmais16 -> "smais16"
    SmaisRatingSmais18 -> "smais18"
    SmaisRatingSmaisUnrated -> "smaisUnrated"
  }
}

pub fn smais_rating_decoder() -> Decoder(SmaisRating) {
  use value <- decode.then(decode.string)
  case value {
    "smaisUnspecified" -> decode.success(SmaisRatingSmaisUnspecified)
    "smaisL" -> decode.success(SmaisRatingSmaisL)
    "smais7" -> decode.success(SmaisRatingSmais7)
    "smais12" -> decode.success(SmaisRatingSmais12)
    "smais14" -> decode.success(SmaisRatingSmais14)
    "smais16" -> decode.success(SmaisRatingSmais16)
    "smais18" -> decode.success(SmaisRatingSmais18)
    "smaisUnrated" -> decode.success(SmaisRatingSmaisUnrated)
    _ -> decode.failure(SmaisRatingSmaisUnspecified, "a valid SmaisRating")
  }
}

/// The video's rating from Statens medieråd (Sweden's National Media Council).
pub type SmsaRating {
  SmsaRatingSmsaUnspecified
  SmsaRatingSmsaA
  SmsaRatingSmsa7
  SmsaRatingSmsa11
  SmsaRatingSmsa15
  SmsaRatingSmsaUnrated
}

pub fn smsa_rating_to_string(value: SmsaRating) -> String {
  case value {
    SmsaRatingSmsaUnspecified -> "smsaUnspecified"
    SmsaRatingSmsaA -> "smsaA"
    SmsaRatingSmsa7 -> "smsa7"
    SmsaRatingSmsa11 -> "smsa11"
    SmsaRatingSmsa15 -> "smsa15"
    SmsaRatingSmsaUnrated -> "smsaUnrated"
  }
}

pub fn smsa_rating_decoder() -> Decoder(SmsaRating) {
  use value <- decode.then(decode.string)
  case value {
    "smsaUnspecified" -> decode.success(SmsaRatingSmsaUnspecified)
    "smsaA" -> decode.success(SmsaRatingSmsaA)
    "smsa7" -> decode.success(SmsaRatingSmsa7)
    "smsa11" -> decode.success(SmsaRatingSmsa11)
    "smsa15" -> decode.success(SmsaRatingSmsa15)
    "smsaUnrated" -> decode.success(SmsaRatingSmsaUnrated)
    _ -> decode.failure(SmsaRatingSmsaUnspecified, "a valid SmsaRating")
  }
}

/// The video's TV Parental Guidelines (TVPG) rating.
pub type TvpgRating {
  TvpgRatingTvpgUnspecified
  TvpgRatingTvpgY
  TvpgRatingTvpgY7
  TvpgRatingTvpgY7Fv
  TvpgRatingTvpgG
  TvpgRatingTvpgPg
  TvpgRatingPg14
  TvpgRatingTvpgMa
  TvpgRatingTvpgUnrated
}

pub fn tvpg_rating_to_string(value: TvpgRating) -> String {
  case value {
    TvpgRatingTvpgUnspecified -> "tvpgUnspecified"
    TvpgRatingTvpgY -> "tvpgY"
    TvpgRatingTvpgY7 -> "tvpgY7"
    TvpgRatingTvpgY7Fv -> "tvpgY7Fv"
    TvpgRatingTvpgG -> "tvpgG"
    TvpgRatingTvpgPg -> "tvpgPg"
    TvpgRatingPg14 -> "pg14"
    TvpgRatingTvpgMa -> "tvpgMa"
    TvpgRatingTvpgUnrated -> "tvpgUnrated"
  }
}

pub fn tvpg_rating_decoder() -> Decoder(TvpgRating) {
  use value <- decode.then(decode.string)
  case value {
    "tvpgUnspecified" -> decode.success(TvpgRatingTvpgUnspecified)
    "tvpgY" -> decode.success(TvpgRatingTvpgY)
    "tvpgY7" -> decode.success(TvpgRatingTvpgY7)
    "tvpgY7Fv" -> decode.success(TvpgRatingTvpgY7Fv)
    "tvpgG" -> decode.success(TvpgRatingTvpgG)
    "tvpgPg" -> decode.success(TvpgRatingTvpgPg)
    "pg14" -> decode.success(TvpgRatingPg14)
    "tvpgMa" -> decode.success(TvpgRatingTvpgMa)
    "tvpgUnrated" -> decode.success(TvpgRatingTvpgUnrated)
    _ -> decode.failure(TvpgRatingTvpgUnspecified, "a valid TvpgRating")
  }
}

/// A rating that YouTube uses to identify age-restricted content.
pub type YtRating {
  YtRatingYtUnspecified
  YtRatingYtAgeRestricted
}

pub fn yt_rating_to_string(value: YtRating) -> String {
  case value {
    YtRatingYtUnspecified -> "ytUnspecified"
    YtRatingYtAgeRestricted -> "ytAgeRestricted"
  }
}

pub fn yt_rating_decoder() -> Decoder(YtRating) {
  use value <- decode.then(decode.string)
  case value {
    "ytUnspecified" -> decode.success(YtRatingYtUnspecified)
    "ytAgeRestricted" -> decode.success(YtRatingYtAgeRestricted)
    _ -> decode.failure(YtRatingYtUnspecified, "a valid YtRating")
  }
}