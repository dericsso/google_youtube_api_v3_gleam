//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success, then, failure}
import gleam/option

/// Ratings schemes. The country-specific ratings are mostly for movies and shows. LINT.IfChange
pub type ContentRating {
  ContentRating(
    acb_rating: option.Option(AcbRating),
    agcom_rating: option.Option(AgcomRating),
    anatel_rating: option.Option(AnatelRating),
    bbfc_rating: option.Option(BbfcRating),
    bfvc_rating: option.Option(BfvcRating),
    bmukk_rating: option.Option(BmukkRating),
    catv_rating: option.Option(CatvRating),
    catvfr_rating: option.Option(CatvfrRating),
    cbfc_rating: option.Option(CbfcRating),
    ccc_rating: option.Option(CccRating),
    cce_rating: option.Option(CceRating),
    chfilm_rating: option.Option(ChfilmRating),
    chvrs_rating: option.Option(ChvrsRating),
    cicf_rating: option.Option(CicfRating),
    cna_rating: option.Option(CnaRating),
    cnc_rating: option.Option(CncRating),
    csa_rating: option.Option(CsaRating),
    cscf_rating: option.Option(CscfRating),
    czfilm_rating: option.Option(CzfilmRating),
    djctq_rating: option.Option(DjctqRating),
    djctq_rating_reasons: option.Option(List(DjctqRatingReasons)),
    ecbmct_rating: option.Option(EcbmctRating),
    eefilm_rating: option.Option(EefilmRating),
    egfilm_rating: option.Option(EgfilmRating),
    eirin_rating: option.Option(EirinRating),
    fcbm_rating: option.Option(FcbmRating),
    fco_rating: option.Option(FcoRating),
    fmoc_rating: option.Option(FmocRating),
    fpb_rating: option.Option(FpbRating),
    fpb_rating_reasons: option.Option(List(FpbRatingReasons)),
    fsk_rating: option.Option(FskRating),
    grfilm_rating: option.Option(GrfilmRating),
    icaa_rating: option.Option(IcaaRating),
    ifco_rating: option.Option(IfcoRating),
    ilfilm_rating: option.Option(IlfilmRating),
    incaa_rating: option.Option(IncaaRating),
    kfcb_rating: option.Option(KfcbRating),
    kijkwijzer_rating: option.Option(KijkwijzerRating),
    kmrb_rating: option.Option(KmrbRating),
    lsf_rating: option.Option(LsfRating),
    mccaa_rating: option.Option(MccaaRating),
    mccyp_rating: option.Option(MccypRating),
    mcst_rating: option.Option(McstRating),
    mda_rating: option.Option(MdaRating),
    medietilsynet_rating: option.Option(MedietilsynetRating),
    meku_rating: option.Option(MekuRating),
    mena_mpaa_rating: option.Option(MenaMpaaRating),
    mibac_rating: option.Option(MibacRating),
    moc_rating: option.Option(MocRating),
    moctw_rating: option.Option(MoctwRating),
    mpaa_rating: option.Option(MpaaRating),
    mpaat_rating: option.Option(MpaatRating),
    mtrcb_rating: option.Option(MtrcbRating),
    nbc_rating: option.Option(NbcRating),
    nbcpl_rating: option.Option(NbcplRating),
    nfrc_rating: option.Option(NfrcRating),
    nfvcb_rating: option.Option(NfvcbRating),
    nkclv_rating: option.Option(NkclvRating),
    nmc_rating: option.Option(NmcRating),
    oflc_rating: option.Option(OflcRating),
    pefilm_rating: option.Option(PefilmRating),
    rcnof_rating: option.Option(RcnofRating),
    resorteviolencia_rating: option.Option(ResorteviolenciaRating),
    rtc_rating: option.Option(RtcRating),
    rte_rating: option.Option(RteRating),
    russia_rating: option.Option(RussiaRating),
    skfilm_rating: option.Option(SkfilmRating),
    smais_rating: option.Option(SmaisRating),
    smsa_rating: option.Option(SmsaRating),
    tvpg_rating: option.Option(TvpgRating),
    yt_rating: option.Option(YtRating),
  )
}

pub fn decoder() -> Decoder(ContentRating) {
  use acb_rating <- optional_field(
    "acbRating",
    option.None,
    optional(acb_rating_decoder()),
  )
  use agcom_rating <- optional_field(
    "agcomRating",
    option.None,
    optional(agcom_rating_decoder()),
  )
  use anatel_rating <- optional_field(
    "anatelRating",
    option.None,
    optional(anatel_rating_decoder()),
  )
  use bbfc_rating <- optional_field(
    "bbfcRating",
    option.None,
    optional(bbfc_rating_decoder()),
  )
  use bfvc_rating <- optional_field(
    "bfvcRating",
    option.None,
    optional(bfvc_rating_decoder()),
  )
  use bmukk_rating <- optional_field(
    "bmukkRating",
    option.None,
    optional(bmukk_rating_decoder()),
  )
  use catv_rating <- optional_field(
    "catvRating",
    option.None,
    optional(catv_rating_decoder()),
  )
  use catvfr_rating <- optional_field(
    "catvfrRating",
    option.None,
    optional(catvfr_rating_decoder()),
  )
  use cbfc_rating <- optional_field(
    "cbfcRating",
    option.None,
    optional(cbfc_rating_decoder()),
  )
  use ccc_rating <- optional_field(
    "cccRating",
    option.None,
    optional(ccc_rating_decoder()),
  )
  use cce_rating <- optional_field(
    "cceRating",
    option.None,
    optional(cce_rating_decoder()),
  )
  use chfilm_rating <- optional_field(
    "chfilmRating",
    option.None,
    optional(chfilm_rating_decoder()),
  )
  use chvrs_rating <- optional_field(
    "chvrsRating",
    option.None,
    optional(chvrs_rating_decoder()),
  )
  use cicf_rating <- optional_field(
    "cicfRating",
    option.None,
    optional(cicf_rating_decoder()),
  )
  use cna_rating <- optional_field(
    "cnaRating",
    option.None,
    optional(cna_rating_decoder()),
  )
  use cnc_rating <- optional_field(
    "cncRating",
    option.None,
    optional(cnc_rating_decoder()),
  )
  use csa_rating <- optional_field(
    "csaRating",
    option.None,
    optional(csa_rating_decoder()),
  )
  use cscf_rating <- optional_field(
    "cscfRating",
    option.None,
    optional(cscf_rating_decoder()),
  )
  use czfilm_rating <- optional_field(
    "czfilmRating",
    option.None,
    optional(czfilm_rating_decoder()),
  )
  use djctq_rating <- optional_field(
    "djctqRating",
    option.None,
    optional(djctq_rating_decoder()),
  )
  use djctq_rating_reasons <- optional_field(
    "djctqRatingReasons",
    option.None,
    optional(list(djctq_rating_reasons_decoder())),
  )
  use ecbmct_rating <- optional_field(
    "ecbmctRating",
    option.None,
    optional(ecbmct_rating_decoder()),
  )
  use eefilm_rating <- optional_field(
    "eefilmRating",
    option.None,
    optional(eefilm_rating_decoder()),
  )
  use egfilm_rating <- optional_field(
    "egfilmRating",
    option.None,
    optional(egfilm_rating_decoder()),
  )
  use eirin_rating <- optional_field(
    "eirinRating",
    option.None,
    optional(eirin_rating_decoder()),
  )
  use fcbm_rating <- optional_field(
    "fcbmRating",
    option.None,
    optional(fcbm_rating_decoder()),
  )
  use fco_rating <- optional_field(
    "fcoRating",
    option.None,
    optional(fco_rating_decoder()),
  )
  use fmoc_rating <- optional_field(
    "fmocRating",
    option.None,
    optional(fmoc_rating_decoder()),
  )
  use fpb_rating <- optional_field(
    "fpbRating",
    option.None,
    optional(fpb_rating_decoder()),
  )
  use fpb_rating_reasons <- optional_field(
    "fpbRatingReasons",
    option.None,
    optional(list(fpb_rating_reasons_decoder())),
  )
  use fsk_rating <- optional_field(
    "fskRating",
    option.None,
    optional(fsk_rating_decoder()),
  )
  use grfilm_rating <- optional_field(
    "grfilmRating",
    option.None,
    optional(grfilm_rating_decoder()),
  )
  use icaa_rating <- optional_field(
    "icaaRating",
    option.None,
    optional(icaa_rating_decoder()),
  )
  use ifco_rating <- optional_field(
    "ifcoRating",
    option.None,
    optional(ifco_rating_decoder()),
  )
  use ilfilm_rating <- optional_field(
    "ilfilmRating",
    option.None,
    optional(ilfilm_rating_decoder()),
  )
  use incaa_rating <- optional_field(
    "incaaRating",
    option.None,
    optional(incaa_rating_decoder()),
  )
  use kfcb_rating <- optional_field(
    "kfcbRating",
    option.None,
    optional(kfcb_rating_decoder()),
  )
  use kijkwijzer_rating <- optional_field(
    "kijkwijzerRating",
    option.None,
    optional(kijkwijzer_rating_decoder()),
  )
  use kmrb_rating <- optional_field(
    "kmrbRating",
    option.None,
    optional(kmrb_rating_decoder()),
  )
  use lsf_rating <- optional_field(
    "lsfRating",
    option.None,
    optional(lsf_rating_decoder()),
  )
  use mccaa_rating <- optional_field(
    "mccaaRating",
    option.None,
    optional(mccaa_rating_decoder()),
  )
  use mccyp_rating <- optional_field(
    "mccypRating",
    option.None,
    optional(mccyp_rating_decoder()),
  )
  use mcst_rating <- optional_field(
    "mcstRating",
    option.None,
    optional(mcst_rating_decoder()),
  )
  use mda_rating <- optional_field(
    "mdaRating",
    option.None,
    optional(mda_rating_decoder()),
  )
  use medietilsynet_rating <- optional_field(
    "medietilsynetRating",
    option.None,
    optional(medietilsynet_rating_decoder()),
  )
  use meku_rating <- optional_field(
    "mekuRating",
    option.None,
    optional(meku_rating_decoder()),
  )
  use mena_mpaa_rating <- optional_field(
    "menaMpaaRating",
    option.None,
    optional(mena_mpaa_rating_decoder()),
  )
  use mibac_rating <- optional_field(
    "mibacRating",
    option.None,
    optional(mibac_rating_decoder()),
  )
  use moc_rating <- optional_field(
    "mocRating",
    option.None,
    optional(moc_rating_decoder()),
  )
  use moctw_rating <- optional_field(
    "moctwRating",
    option.None,
    optional(moctw_rating_decoder()),
  )
  use mpaa_rating <- optional_field(
    "mpaaRating",
    option.None,
    optional(mpaa_rating_decoder()),
  )
  use mpaat_rating <- optional_field(
    "mpaatRating",
    option.None,
    optional(mpaat_rating_decoder()),
  )
  use mtrcb_rating <- optional_field(
    "mtrcbRating",
    option.None,
    optional(mtrcb_rating_decoder()),
  )
  use nbc_rating <- optional_field(
    "nbcRating",
    option.None,
    optional(nbc_rating_decoder()),
  )
  use nbcpl_rating <- optional_field(
    "nbcplRating",
    option.None,
    optional(nbcpl_rating_decoder()),
  )
  use nfrc_rating <- optional_field(
    "nfrcRating",
    option.None,
    optional(nfrc_rating_decoder()),
  )
  use nfvcb_rating <- optional_field(
    "nfvcbRating",
    option.None,
    optional(nfvcb_rating_decoder()),
  )
  use nkclv_rating <- optional_field(
    "nkclvRating",
    option.None,
    optional(nkclv_rating_decoder()),
  )
  use nmc_rating <- optional_field(
    "nmcRating",
    option.None,
    optional(nmc_rating_decoder()),
  )
  use oflc_rating <- optional_field(
    "oflcRating",
    option.None,
    optional(oflc_rating_decoder()),
  )
  use pefilm_rating <- optional_field(
    "pefilmRating",
    option.None,
    optional(pefilm_rating_decoder()),
  )
  use rcnof_rating <- optional_field(
    "rcnofRating",
    option.None,
    optional(rcnof_rating_decoder()),
  )
  use resorteviolencia_rating <- optional_field(
    "resorteviolenciaRating",
    option.None,
    optional(resorteviolencia_rating_decoder()),
  )
  use rtc_rating <- optional_field(
    "rtcRating",
    option.None,
    optional(rtc_rating_decoder()),
  )
  use rte_rating <- optional_field(
    "rteRating",
    option.None,
    optional(rte_rating_decoder()),
  )
  use russia_rating <- optional_field(
    "russiaRating",
    option.None,
    optional(russia_rating_decoder()),
  )
  use skfilm_rating <- optional_field(
    "skfilmRating",
    option.None,
    optional(skfilm_rating_decoder()),
  )
  use smais_rating <- optional_field(
    "smaisRating",
    option.None,
    optional(smais_rating_decoder()),
  )
  use smsa_rating <- optional_field(
    "smsaRating",
    option.None,
    optional(smsa_rating_decoder()),
  )
  use tvpg_rating <- optional_field(
    "tvpgRating",
    option.None,
    optional(tvpg_rating_decoder()),
  )
  use yt_rating <- optional_field(
    "ytRating",
    option.None,
    optional(yt_rating_decoder()),
  )
  success(
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
  use value <- then(string)
  case value {
    "acbUnspecified" -> success(AcbRatingAcbUnspecified)
    "acbE" -> success(AcbRatingAcbE)
    "acbP" -> success(AcbRatingAcbP)
    "acbC" -> success(AcbRatingAcbC)
    "acbG" -> success(AcbRatingAcbG)
    "acbPg" -> success(AcbRatingAcbPg)
    "acbM" -> success(AcbRatingAcbM)
    "acbMa15plus" -> success(AcbRatingAcbMa15plus)
    "acbR18plus" -> success(AcbRatingAcbR18plus)
    "acbUnrated" -> success(AcbRatingAcbUnrated)
    _ -> failure(AcbRatingAcbUnspecified, "a valid AcbRating")
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
  use value <- then(string)
  case value {
    "agcomUnspecified" -> success(AgcomRatingAgcomUnspecified)
    "agcomT" -> success(AgcomRatingAgcomT)
    "agcomVm14" -> success(AgcomRatingAgcomVm14)
    "agcomVm18" -> success(AgcomRatingAgcomVm18)
    "agcomUnrated" -> success(AgcomRatingAgcomUnrated)
    _ -> failure(AgcomRatingAgcomUnspecified, "a valid AgcomRating")
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
  use value <- then(string)
  case value {
    "anatelUnspecified" -> success(AnatelRatingAnatelUnspecified)
    "anatelF" -> success(AnatelRatingAnatelF)
    "anatelI" -> success(AnatelRatingAnatelI)
    "anatelI7" -> success(AnatelRatingAnatelI7)
    "anatelI10" -> success(AnatelRatingAnatelI10)
    "anatelI12" -> success(AnatelRatingAnatelI12)
    "anatelR" -> success(AnatelRatingAnatelR)
    "anatelA" -> success(AnatelRatingAnatelA)
    "anatelUnrated" -> success(AnatelRatingAnatelUnrated)
    _ -> failure(AnatelRatingAnatelUnspecified, "a valid AnatelRating")
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
  use value <- then(string)
  case value {
    "bbfcUnspecified" -> success(BbfcRatingBbfcUnspecified)
    "bbfcU" -> success(BbfcRatingBbfcU)
    "bbfcPg" -> success(BbfcRatingBbfcPg)
    "bbfc12a" -> success(BbfcRatingBbfc12a)
    "bbfc12" -> success(BbfcRatingBbfc12)
    "bbfc15" -> success(BbfcRatingBbfc15)
    "bbfc18" -> success(BbfcRatingBbfc18)
    "bbfcR18" -> success(BbfcRatingBbfcR18)
    "bbfcUnrated" -> success(BbfcRatingBbfcUnrated)
    _ -> failure(BbfcRatingBbfcUnspecified, "a valid BbfcRating")
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
  use value <- then(string)
  case value {
    "bfvcUnspecified" -> success(BfvcRatingBfvcUnspecified)
    "bfvcG" -> success(BfvcRatingBfvcG)
    "bfvcE" -> success(BfvcRatingBfvcE)
    "bfvc13" -> success(BfvcRatingBfvc13)
    "bfvc15" -> success(BfvcRatingBfvc15)
    "bfvc18" -> success(BfvcRatingBfvc18)
    "bfvc20" -> success(BfvcRatingBfvc20)
    "bfvcB" -> success(BfvcRatingBfvcB)
    "bfvcUnrated" -> success(BfvcRatingBfvcUnrated)
    _ -> failure(BfvcRatingBfvcUnspecified, "a valid BfvcRating")
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
  use value <- then(string)
  case value {
    "bmukkUnspecified" -> success(BmukkRatingBmukkUnspecified)
    "bmukkAa" -> success(BmukkRatingBmukkAa)
    "bmukk6" -> success(BmukkRatingBmukk6)
    "bmukk8" -> success(BmukkRatingBmukk8)
    "bmukk10" -> success(BmukkRatingBmukk10)
    "bmukk12" -> success(BmukkRatingBmukk12)
    "bmukk14" -> success(BmukkRatingBmukk14)
    "bmukk16" -> success(BmukkRatingBmukk16)
    "bmukkUnrated" -> success(BmukkRatingBmukkUnrated)
    _ -> failure(BmukkRatingBmukkUnspecified, "a valid BmukkRating")
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
  use value <- then(string)
  case value {
    "catvUnspecified" -> success(CatvRatingCatvUnspecified)
    "catvC" -> success(CatvRatingCatvC)
    "catvC8" -> success(CatvRatingCatvC8)
    "catvG" -> success(CatvRatingCatvG)
    "catvPg" -> success(CatvRatingCatvPg)
    "catv14plus" -> success(CatvRatingCatv14plus)
    "catv18plus" -> success(CatvRatingCatv18plus)
    "catvUnrated" -> success(CatvRatingCatvUnrated)
    "catvE" -> success(CatvRatingCatvE)
    _ -> failure(CatvRatingCatvUnspecified, "a valid CatvRating")
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
  use value <- then(string)
  case value {
    "catvfrUnspecified" -> success(CatvfrRatingCatvfrUnspecified)
    "catvfrG" -> success(CatvfrRatingCatvfrG)
    "catvfr8plus" -> success(CatvfrRatingCatvfr8plus)
    "catvfr13plus" -> success(CatvfrRatingCatvfr13plus)
    "catvfr16plus" -> success(CatvfrRatingCatvfr16plus)
    "catvfr18plus" -> success(CatvfrRatingCatvfr18plus)
    "catvfrUnrated" -> success(CatvfrRatingCatvfrUnrated)
    "catvfrE" -> success(CatvfrRatingCatvfrE)
    _ -> failure(CatvfrRatingCatvfrUnspecified, "a valid CatvfrRating")
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
  use value <- then(string)
  case value {
    "cbfcUnspecified" -> success(CbfcRatingCbfcUnspecified)
    "cbfcU" -> success(CbfcRatingCbfcU)
    "cbfcUA" -> success(CbfcRatingCbfcUa)
    "cbfcUA7plus" -> success(CbfcRatingCbfcUa7plus)
    "cbfcUA13plus" -> success(CbfcRatingCbfcUa13plus)
    "cbfcUA16plus" -> success(CbfcRatingCbfcUa16plus)
    "cbfcA" -> success(CbfcRatingCbfcA)
    "cbfcS" -> success(CbfcRatingCbfcS)
    "cbfcUnrated" -> success(CbfcRatingCbfcUnrated)
    _ -> failure(CbfcRatingCbfcUnspecified, "a valid CbfcRating")
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
  use value <- then(string)
  case value {
    "cccUnspecified" -> success(CccRatingCccUnspecified)
    "cccTe" -> success(CccRatingCccTe)
    "ccc6" -> success(CccRatingCcc6)
    "ccc14" -> success(CccRatingCcc14)
    "ccc18" -> success(CccRatingCcc18)
    "ccc18v" -> success(CccRatingCcc18v)
    "ccc18s" -> success(CccRatingCcc18s)
    "cccUnrated" -> success(CccRatingCccUnrated)
    _ -> failure(CccRatingCccUnspecified, "a valid CccRating")
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
  use value <- then(string)
  case value {
    "cceUnspecified" -> success(CceRatingCceUnspecified)
    "cceM4" -> success(CceRatingCceM4)
    "cceM6" -> success(CceRatingCceM6)
    "cceM12" -> success(CceRatingCceM12)
    "cceM16" -> success(CceRatingCceM16)
    "cceM18" -> success(CceRatingCceM18)
    "cceUnrated" -> success(CceRatingCceUnrated)
    "cceM14" -> success(CceRatingCceM14)
    _ -> failure(CceRatingCceUnspecified, "a valid CceRating")
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
  use value <- then(string)
  case value {
    "chfilmUnspecified" -> success(ChfilmRatingChfilmUnspecified)
    "chfilm0" -> success(ChfilmRatingChfilm0)
    "chfilm6" -> success(ChfilmRatingChfilm6)
    "chfilm12" -> success(ChfilmRatingChfilm12)
    "chfilm16" -> success(ChfilmRatingChfilm16)
    "chfilm18" -> success(ChfilmRatingChfilm18)
    "chfilmUnrated" -> success(ChfilmRatingChfilmUnrated)
    _ -> failure(ChfilmRatingChfilmUnspecified, "a valid ChfilmRating")
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
  use value <- then(string)
  case value {
    "chvrsUnspecified" -> success(ChvrsRatingChvrsUnspecified)
    "chvrsG" -> success(ChvrsRatingChvrsG)
    "chvrsPg" -> success(ChvrsRatingChvrsPg)
    "chvrs14a" -> success(ChvrsRatingChvrs14a)
    "chvrs18a" -> success(ChvrsRatingChvrs18a)
    "chvrsR" -> success(ChvrsRatingChvrsR)
    "chvrsE" -> success(ChvrsRatingChvrsE)
    "chvrsUnrated" -> success(ChvrsRatingChvrsUnrated)
    _ -> failure(ChvrsRatingChvrsUnspecified, "a valid ChvrsRating")
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
  use value <- then(string)
  case value {
    "cicfUnspecified" -> success(CicfRatingCicfUnspecified)
    "cicfE" -> success(CicfRatingCicfE)
    "cicfKtEa" -> success(CicfRatingCicfKtEa)
    "cicfKntEna" -> success(CicfRatingCicfKntEna)
    "cicfUnrated" -> success(CicfRatingCicfUnrated)
    _ -> failure(CicfRatingCicfUnspecified, "a valid CicfRating")
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
  use value <- then(string)
  case value {
    "cnaUnspecified" -> success(CnaRatingCnaUnspecified)
    "cnaAp" -> success(CnaRatingCnaAp)
    "cna12" -> success(CnaRatingCna12)
    "cna15" -> success(CnaRatingCna15)
    "cna18" -> success(CnaRatingCna18)
    "cna18plus" -> success(CnaRatingCna18plus)
    "cnaUnrated" -> success(CnaRatingCnaUnrated)
    _ -> failure(CnaRatingCnaUnspecified, "a valid CnaRating")
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
  use value <- then(string)
  case value {
    "cncUnspecified" -> success(CncRatingCncUnspecified)
    "cncT" -> success(CncRatingCncT)
    "cnc10" -> success(CncRatingCnc10)
    "cnc12" -> success(CncRatingCnc12)
    "cnc16" -> success(CncRatingCnc16)
    "cnc18" -> success(CncRatingCnc18)
    "cncE" -> success(CncRatingCncE)
    "cncInterdiction" -> success(CncRatingCncInterdiction)
    "cncUnrated" -> success(CncRatingCncUnrated)
    _ -> failure(CncRatingCncUnspecified, "a valid CncRating")
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
  use value <- then(string)
  case value {
    "csaUnspecified" -> success(CsaRatingCsaUnspecified)
    "csaT" -> success(CsaRatingCsaT)
    "csa10" -> success(CsaRatingCsa10)
    "csa12" -> success(CsaRatingCsa12)
    "csa16" -> success(CsaRatingCsa16)
    "csa18" -> success(CsaRatingCsa18)
    "csaInterdiction" -> success(CsaRatingCsaInterdiction)
    "csaUnrated" -> success(CsaRatingCsaUnrated)
    _ -> failure(CsaRatingCsaUnspecified, "a valid CsaRating")
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
  use value <- then(string)
  case value {
    "cscfUnspecified" -> success(CscfRatingCscfUnspecified)
    "cscfAl" -> success(CscfRatingCscfAl)
    "cscfA" -> success(CscfRatingCscfA)
    "cscf6" -> success(CscfRatingCscf6)
    "cscf9" -> success(CscfRatingCscf9)
    "cscf12" -> success(CscfRatingCscf12)
    "cscf16" -> success(CscfRatingCscf16)
    "cscf18" -> success(CscfRatingCscf18)
    "cscfUnrated" -> success(CscfRatingCscfUnrated)
    _ -> failure(CscfRatingCscfUnspecified, "a valid CscfRating")
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
  use value <- then(string)
  case value {
    "czfilmUnspecified" -> success(CzfilmRatingCzfilmUnspecified)
    "czfilmU" -> success(CzfilmRatingCzfilmU)
    "czfilm12" -> success(CzfilmRatingCzfilm12)
    "czfilm14" -> success(CzfilmRatingCzfilm14)
    "czfilm18" -> success(CzfilmRatingCzfilm18)
    "czfilmUnrated" -> success(CzfilmRatingCzfilmUnrated)
    _ -> failure(CzfilmRatingCzfilmUnspecified, "a valid CzfilmRating")
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
  use value <- then(string)
  case value {
    "djctqUnspecified" -> success(DjctqRatingDjctqUnspecified)
    "djctqL" -> success(DjctqRatingDjctqL)
    "djctq10" -> success(DjctqRatingDjctq10)
    "djctq12" -> success(DjctqRatingDjctq12)
    "djctq14" -> success(DjctqRatingDjctq14)
    "djctq16" -> success(DjctqRatingDjctq16)
    "djctq18" -> success(DjctqRatingDjctq18)
    "djctqEr" -> success(DjctqRatingDjctqEr)
    "djctqL10" -> success(DjctqRatingDjctqL10)
    "djctqL12" -> success(DjctqRatingDjctqL12)
    "djctqL14" -> success(DjctqRatingDjctqL14)
    "djctqL16" -> success(DjctqRatingDjctqL16)
    "djctqL18" -> success(DjctqRatingDjctqL18)
    "djctq1012" -> success(DjctqRatingDjctq1012)
    "djctq1014" -> success(DjctqRatingDjctq1014)
    "djctq1016" -> success(DjctqRatingDjctq1016)
    "djctq1018" -> success(DjctqRatingDjctq1018)
    "djctq1214" -> success(DjctqRatingDjctq1214)
    "djctq1216" -> success(DjctqRatingDjctq1216)
    "djctq1218" -> success(DjctqRatingDjctq1218)
    "djctq1416" -> success(DjctqRatingDjctq1416)
    "djctq1418" -> success(DjctqRatingDjctq1418)
    "djctq1618" -> success(DjctqRatingDjctq1618)
    "djctqUnrated" -> success(DjctqRatingDjctqUnrated)
    _ -> failure(DjctqRatingDjctqUnspecified, "a valid DjctqRating")
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
  use value <- then(string)
  case value {
    "djctqRatingReasonUnspecified" -> success(
      DjctqRatingReasonsDjctqRatingReasonUnspecified,
    )
    "djctqViolence" -> success(DjctqRatingReasonsDjctqViolence)
    "djctqExtremeViolence" -> success(DjctqRatingReasonsDjctqExtremeViolence)
    "djctqSexualContent" -> success(DjctqRatingReasonsDjctqSexualContent)
    "djctqNudity" -> success(DjctqRatingReasonsDjctqNudity)
    "djctqSex" -> success(DjctqRatingReasonsDjctqSex)
    "djctqExplicitSex" -> success(DjctqRatingReasonsDjctqExplicitSex)
    "djctqDrugs" -> success(DjctqRatingReasonsDjctqDrugs)
    "djctqLegalDrugs" -> success(DjctqRatingReasonsDjctqLegalDrugs)
    "djctqIllegalDrugs" -> success(DjctqRatingReasonsDjctqIllegalDrugs)
    "djctqInappropriateLanguage" -> success(
      DjctqRatingReasonsDjctqInappropriateLanguage,
    )
    "djctqCriminalActs" -> success(DjctqRatingReasonsDjctqCriminalActs)
    "djctqImpactingContent" -> success(DjctqRatingReasonsDjctqImpactingContent)
    "djctqFear" -> success(DjctqRatingReasonsDjctqFear)
    "djctqMedicalProcedures" -> success(
      DjctqRatingReasonsDjctqMedicalProcedures,
    )
    "djctqSensitiveTopics" -> success(DjctqRatingReasonsDjctqSensitiveTopics)
    "djctqFantasyViolence" -> success(DjctqRatingReasonsDjctqFantasyViolence)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "ecbmctUnspecified" -> success(EcbmctRatingEcbmctUnspecified)
    "ecbmctG" -> success(EcbmctRatingEcbmctG)
    "ecbmct7a" -> success(EcbmctRatingEcbmct7a)
    "ecbmct7plus" -> success(EcbmctRatingEcbmct7plus)
    "ecbmct13a" -> success(EcbmctRatingEcbmct13a)
    "ecbmct13plus" -> success(EcbmctRatingEcbmct13plus)
    "ecbmct15a" -> success(EcbmctRatingEcbmct15a)
    "ecbmct15plus" -> success(EcbmctRatingEcbmct15plus)
    "ecbmct18plus" -> success(EcbmctRatingEcbmct18plus)
    "ecbmctUnrated" -> success(EcbmctRatingEcbmctUnrated)
    _ -> failure(EcbmctRatingEcbmctUnspecified, "a valid EcbmctRating")
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
  use value <- then(string)
  case value {
    "eefilmUnspecified" -> success(EefilmRatingEefilmUnspecified)
    "eefilmPere" -> success(EefilmRatingEefilmPere)
    "eefilmL" -> success(EefilmRatingEefilmL)
    "eefilmMs6" -> success(EefilmRatingEefilmMs6)
    "eefilmK6" -> success(EefilmRatingEefilmK6)
    "eefilmMs12" -> success(EefilmRatingEefilmMs12)
    "eefilmK12" -> success(EefilmRatingEefilmK12)
    "eefilmK14" -> success(EefilmRatingEefilmK14)
    "eefilmK16" -> success(EefilmRatingEefilmK16)
    "eefilmUnrated" -> success(EefilmRatingEefilmUnrated)
    _ -> failure(EefilmRatingEefilmUnspecified, "a valid EefilmRating")
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
  use value <- then(string)
  case value {
    "egfilmUnspecified" -> success(EgfilmRatingEgfilmUnspecified)
    "egfilmGn" -> success(EgfilmRatingEgfilmGn)
    "egfilm18" -> success(EgfilmRatingEgfilm18)
    "egfilmBn" -> success(EgfilmRatingEgfilmBn)
    "egfilmUnrated" -> success(EgfilmRatingEgfilmUnrated)
    _ -> failure(EgfilmRatingEgfilmUnspecified, "a valid EgfilmRating")
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
  use value <- then(string)
  case value {
    "eirinUnspecified" -> success(EirinRatingEirinUnspecified)
    "eirinG" -> success(EirinRatingEirinG)
    "eirinPg12" -> success(EirinRatingEirinPg12)
    "eirinR15plus" -> success(EirinRatingEirinR15plus)
    "eirinR18plus" -> success(EirinRatingEirinR18plus)
    "eirinUnrated" -> success(EirinRatingEirinUnrated)
    _ -> failure(EirinRatingEirinUnspecified, "a valid EirinRating")
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
  use value <- then(string)
  case value {
    "fcbmUnspecified" -> success(FcbmRatingFcbmUnspecified)
    "fcbmU" -> success(FcbmRatingFcbmU)
    "fcbmPg13" -> success(FcbmRatingFcbmPg13)
    "fcbmP13" -> success(FcbmRatingFcbmP13)
    "fcbm18" -> success(FcbmRatingFcbm18)
    "fcbm18sx" -> success(FcbmRatingFcbm18sx)
    "fcbm18pa" -> success(FcbmRatingFcbm18pa)
    "fcbm18sg" -> success(FcbmRatingFcbm18sg)
    "fcbm18pl" -> success(FcbmRatingFcbm18pl)
    "fcbmUnrated" -> success(FcbmRatingFcbmUnrated)
    _ -> failure(FcbmRatingFcbmUnspecified, "a valid FcbmRating")
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
  use value <- then(string)
  case value {
    "fcoUnspecified" -> success(FcoRatingFcoUnspecified)
    "fcoI" -> success(FcoRatingFcoI)
    "fcoIia" -> success(FcoRatingFcoIia)
    "fcoIib" -> success(FcoRatingFcoIib)
    "fcoIi" -> success(FcoRatingFcoIi)
    "fcoIii" -> success(FcoRatingFcoIii)
    "fcoUnrated" -> success(FcoRatingFcoUnrated)
    _ -> failure(FcoRatingFcoUnspecified, "a valid FcoRating")
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
  use value <- then(string)
  case value {
    "fmocUnspecified" -> success(FmocRatingFmocUnspecified)
    "fmocU" -> success(FmocRatingFmocU)
    "fmoc10" -> success(FmocRatingFmoc10)
    "fmoc12" -> success(FmocRatingFmoc12)
    "fmoc16" -> success(FmocRatingFmoc16)
    "fmoc18" -> success(FmocRatingFmoc18)
    "fmocE" -> success(FmocRatingFmocE)
    "fmocUnrated" -> success(FmocRatingFmocUnrated)
    _ -> failure(FmocRatingFmocUnspecified, "a valid FmocRating")
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
  use value <- then(string)
  case value {
    "fpbUnspecified" -> success(FpbRatingFpbUnspecified)
    "fpbA" -> success(FpbRatingFpbA)
    "fpbPg" -> success(FpbRatingFpbPg)
    "fpb79Pg" -> success(FpbRatingFpb79Pg)
    "fpb1012Pg" -> success(FpbRatingFpb1012Pg)
    "fpb13" -> success(FpbRatingFpb13)
    "fpb16" -> success(FpbRatingFpb16)
    "fpb18" -> success(FpbRatingFpb18)
    "fpbX18" -> success(FpbRatingFpbX18)
    "fpbXx" -> success(FpbRatingFpbXx)
    "fpbUnrated" -> success(FpbRatingFpbUnrated)
    "fpb10" -> success(FpbRatingFpb10)
    _ -> failure(FpbRatingFpbUnspecified, "a valid FpbRating")
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
  use value <- then(string)
  case value {
    "fpbRatingReasonUnspecified" -> success(
      FpbRatingReasonsFpbRatingReasonUnspecified,
    )
    "fpbBlasphemy" -> success(FpbRatingReasonsFpbBlasphemy)
    "fpbLanguage" -> success(FpbRatingReasonsFpbLanguage)
    "fpbNudity" -> success(FpbRatingReasonsFpbNudity)
    "fpbPrejudice" -> success(FpbRatingReasonsFpbPrejudice)
    "fpbSex" -> success(FpbRatingReasonsFpbSex)
    "fpbViolence" -> success(FpbRatingReasonsFpbViolence)
    "fpbDrugs" -> success(FpbRatingReasonsFpbDrugs)
    "fpbSexualViolence" -> success(FpbRatingReasonsFpbSexualViolence)
    "fpbHorror" -> success(FpbRatingReasonsFpbHorror)
    "fpbCriminalTechniques" -> success(FpbRatingReasonsFpbCriminalTechniques)
    "fpbImitativeActsTechniques" -> success(
      FpbRatingReasonsFpbImitativeActsTechniques,
    )
    _ -> failure(
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
  use value <- then(string)
  case value {
    "fskUnspecified" -> success(FskRatingFskUnspecified)
    "fsk0" -> success(FskRatingFsk0)
    "fsk6" -> success(FskRatingFsk6)
    "fsk12" -> success(FskRatingFsk12)
    "fsk16" -> success(FskRatingFsk16)
    "fsk18" -> success(FskRatingFsk18)
    "fskUnrated" -> success(FskRatingFskUnrated)
    _ -> failure(FskRatingFskUnspecified, "a valid FskRating")
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
  use value <- then(string)
  case value {
    "grfilmUnspecified" -> success(GrfilmRatingGrfilmUnspecified)
    "grfilmK" -> success(GrfilmRatingGrfilmK)
    "grfilmE" -> success(GrfilmRatingGrfilmE)
    "grfilmK12" -> success(GrfilmRatingGrfilmK12)
    "grfilmK13" -> success(GrfilmRatingGrfilmK13)
    "grfilmK15" -> success(GrfilmRatingGrfilmK15)
    "grfilmK17" -> success(GrfilmRatingGrfilmK17)
    "grfilmK18" -> success(GrfilmRatingGrfilmK18)
    "grfilmUnrated" -> success(GrfilmRatingGrfilmUnrated)
    _ -> failure(GrfilmRatingGrfilmUnspecified, "a valid GrfilmRating")
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
  use value <- then(string)
  case value {
    "icaaUnspecified" -> success(IcaaRatingIcaaUnspecified)
    "icaaApta" -> success(IcaaRatingIcaaApta)
    "icaa7" -> success(IcaaRatingIcaa7)
    "icaa12" -> success(IcaaRatingIcaa12)
    "icaa13" -> success(IcaaRatingIcaa13)
    "icaa16" -> success(IcaaRatingIcaa16)
    "icaa18" -> success(IcaaRatingIcaa18)
    "icaaX" -> success(IcaaRatingIcaaX)
    "icaaUnrated" -> success(IcaaRatingIcaaUnrated)
    _ -> failure(IcaaRatingIcaaUnspecified, "a valid IcaaRating")
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
  use value <- then(string)
  case value {
    "ifcoUnspecified" -> success(IfcoRatingIfcoUnspecified)
    "ifcoG" -> success(IfcoRatingIfcoG)
    "ifcoPg" -> success(IfcoRatingIfcoPg)
    "ifco12" -> success(IfcoRatingIfco12)
    "ifco12a" -> success(IfcoRatingIfco12a)
    "ifco15" -> success(IfcoRatingIfco15)
    "ifco15a" -> success(IfcoRatingIfco15a)
    "ifco16" -> success(IfcoRatingIfco16)
    "ifco18" -> success(IfcoRatingIfco18)
    "ifcoUnrated" -> success(IfcoRatingIfcoUnrated)
    _ -> failure(IfcoRatingIfcoUnspecified, "a valid IfcoRating")
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
  use value <- then(string)
  case value {
    "ilfilmUnspecified" -> success(IlfilmRatingIlfilmUnspecified)
    "ilfilmAa" -> success(IlfilmRatingIlfilmAa)
    "ilfilm12" -> success(IlfilmRatingIlfilm12)
    "ilfilm14" -> success(IlfilmRatingIlfilm14)
    "ilfilm16" -> success(IlfilmRatingIlfilm16)
    "ilfilm18" -> success(IlfilmRatingIlfilm18)
    "ilfilmUnrated" -> success(IlfilmRatingIlfilmUnrated)
    _ -> failure(IlfilmRatingIlfilmUnspecified, "a valid IlfilmRating")
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
  use value <- then(string)
  case value {
    "incaaUnspecified" -> success(IncaaRatingIncaaUnspecified)
    "incaaAtp" -> success(IncaaRatingIncaaAtp)
    "incaaSam13" -> success(IncaaRatingIncaaSam13)
    "incaaSam16" -> success(IncaaRatingIncaaSam16)
    "incaaSam18" -> success(IncaaRatingIncaaSam18)
    "incaaC" -> success(IncaaRatingIncaaC)
    "incaaUnrated" -> success(IncaaRatingIncaaUnrated)
    _ -> failure(IncaaRatingIncaaUnspecified, "a valid IncaaRating")
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
  use value <- then(string)
  case value {
    "kfcbUnspecified" -> success(KfcbRatingKfcbUnspecified)
    "kfcbG" -> success(KfcbRatingKfcbG)
    "kfcbPg" -> success(KfcbRatingKfcbPg)
    "kfcb16plus" -> success(KfcbRatingKfcb16plus)
    "kfcbR" -> success(KfcbRatingKfcbR)
    "kfcbUnrated" -> success(KfcbRatingKfcbUnrated)
    _ -> failure(KfcbRatingKfcbUnspecified, "a valid KfcbRating")
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
  use value <- then(string)
  case value {
    "kijkwijzerUnspecified" -> success(KijkwijzerRatingKijkwijzerUnspecified)
    "kijkwijzerAl" -> success(KijkwijzerRatingKijkwijzerAl)
    "kijkwijzer6" -> success(KijkwijzerRatingKijkwijzer6)
    "kijkwijzer9" -> success(KijkwijzerRatingKijkwijzer9)
    "kijkwijzer12" -> success(KijkwijzerRatingKijkwijzer12)
    "kijkwijzer16" -> success(KijkwijzerRatingKijkwijzer16)
    "kijkwijzer18" -> success(KijkwijzerRatingKijkwijzer18)
    "kijkwijzerUnrated" -> success(KijkwijzerRatingKijkwijzerUnrated)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "kmrbUnspecified" -> success(KmrbRatingKmrbUnspecified)
    "kmrbAll" -> success(KmrbRatingKmrbAll)
    "kmrb12plus" -> success(KmrbRatingKmrb12plus)
    "kmrb15plus" -> success(KmrbRatingKmrb15plus)
    "kmrbTeenr" -> success(KmrbRatingKmrbTeenr)
    "kmrbR" -> success(KmrbRatingKmrbR)
    "kmrbUnrated" -> success(KmrbRatingKmrbUnrated)
    _ -> failure(KmrbRatingKmrbUnspecified, "a valid KmrbRating")
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
  use value <- then(string)
  case value {
    "lsfUnspecified" -> success(LsfRatingLsfUnspecified)
    "lsfSu" -> success(LsfRatingLsfSu)
    "lsfA" -> success(LsfRatingLsfA)
    "lsfBo" -> success(LsfRatingLsfBo)
    "lsf13" -> success(LsfRatingLsf13)
    "lsfR" -> success(LsfRatingLsfR)
    "lsf17" -> success(LsfRatingLsf17)
    "lsfD" -> success(LsfRatingLsfD)
    "lsf21" -> success(LsfRatingLsf21)
    "lsfUnrated" -> success(LsfRatingLsfUnrated)
    _ -> failure(LsfRatingLsfUnspecified, "a valid LsfRating")
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
  use value <- then(string)
  case value {
    "mccaaUnspecified" -> success(MccaaRatingMccaaUnspecified)
    "mccaaU" -> success(MccaaRatingMccaaU)
    "mccaaPg" -> success(MccaaRatingMccaaPg)
    "mccaa12a" -> success(MccaaRatingMccaa12a)
    "mccaa12" -> success(MccaaRatingMccaa12)
    "mccaa14" -> success(MccaaRatingMccaa14)
    "mccaa15" -> success(MccaaRatingMccaa15)
    "mccaa16" -> success(MccaaRatingMccaa16)
    "mccaa18" -> success(MccaaRatingMccaa18)
    "mccaaUnrated" -> success(MccaaRatingMccaaUnrated)
    _ -> failure(MccaaRatingMccaaUnspecified, "a valid MccaaRating")
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
  use value <- then(string)
  case value {
    "mccypUnspecified" -> success(MccypRatingMccypUnspecified)
    "mccypA" -> success(MccypRatingMccypA)
    "mccyp7" -> success(MccypRatingMccyp7)
    "mccyp11" -> success(MccypRatingMccyp11)
    "mccyp15" -> success(MccypRatingMccyp15)
    "mccypUnrated" -> success(MccypRatingMccypUnrated)
    _ -> failure(MccypRatingMccypUnspecified, "a valid MccypRating")
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
  use value <- then(string)
  case value {
    "mcstUnspecified" -> success(McstRatingMcstUnspecified)
    "mcstP" -> success(McstRatingMcstP)
    "mcst0" -> success(McstRatingMcst0)
    "mcstC13" -> success(McstRatingMcstC13)
    "mcstC16" -> success(McstRatingMcstC16)
    "mcst16plus" -> success(McstRatingMcst16plus)
    "mcstC18" -> success(McstRatingMcstC18)
    "mcstGPg" -> success(McstRatingMcstGpg)
    "mcstUnrated" -> success(McstRatingMcstUnrated)
    _ -> failure(McstRatingMcstUnspecified, "a valid McstRating")
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
  use value <- then(string)
  case value {
    "mdaUnspecified" -> success(MdaRatingMdaUnspecified)
    "mdaG" -> success(MdaRatingMdaG)
    "mdaPg" -> success(MdaRatingMdaPg)
    "mdaPg13" -> success(MdaRatingMdaPg13)
    "mdaNc16" -> success(MdaRatingMdaNc16)
    "mdaM18" -> success(MdaRatingMdaM18)
    "mdaR21" -> success(MdaRatingMdaR21)
    "mdaUnrated" -> success(MdaRatingMdaUnrated)
    _ -> failure(MdaRatingMdaUnspecified, "a valid MdaRating")
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
  use value <- then(string)
  case value {
    "medietilsynetUnspecified" -> success(
      MedietilsynetRatingMedietilsynetUnspecified,
    )
    "medietilsynetA" -> success(MedietilsynetRatingMedietilsynetA)
    "medietilsynet6" -> success(MedietilsynetRatingMedietilsynet6)
    "medietilsynet7" -> success(MedietilsynetRatingMedietilsynet7)
    "medietilsynet9" -> success(MedietilsynetRatingMedietilsynet9)
    "medietilsynet11" -> success(MedietilsynetRatingMedietilsynet11)
    "medietilsynet12" -> success(MedietilsynetRatingMedietilsynet12)
    "medietilsynet15" -> success(MedietilsynetRatingMedietilsynet15)
    "medietilsynet18" -> success(MedietilsynetRatingMedietilsynet18)
    "medietilsynetUnrated" -> success(MedietilsynetRatingMedietilsynetUnrated)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "mekuUnspecified" -> success(MekuRatingMekuUnspecified)
    "mekuS" -> success(MekuRatingMekuS)
    "meku7" -> success(MekuRatingMeku7)
    "meku12" -> success(MekuRatingMeku12)
    "meku16" -> success(MekuRatingMeku16)
    "meku18" -> success(MekuRatingMeku18)
    "mekuUnrated" -> success(MekuRatingMekuUnrated)
    _ -> failure(MekuRatingMekuUnspecified, "a valid MekuRating")
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
  use value <- then(string)
  case value {
    "menaMpaaUnspecified" -> success(MenaMpaaRatingMenaMpaaUnspecified)
    "menaMpaaG" -> success(MenaMpaaRatingMenaMpaaG)
    "menaMpaaPg" -> success(MenaMpaaRatingMenaMpaaPg)
    "menaMpaaPg13" -> success(MenaMpaaRatingMenaMpaaPg13)
    "menaMpaaR" -> success(MenaMpaaRatingMenaMpaaR)
    "menaMpaaUnrated" -> success(MenaMpaaRatingMenaMpaaUnrated)
    _ -> failure(MenaMpaaRatingMenaMpaaUnspecified, "a valid MenaMpaaRating")
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
  use value <- then(string)
  case value {
    "mibacUnspecified" -> success(MibacRatingMibacUnspecified)
    "mibacT" -> success(MibacRatingMibacT)
    "mibacVap" -> success(MibacRatingMibacVap)
    "mibacVm6" -> success(MibacRatingMibacVm6)
    "mibacVm12" -> success(MibacRatingMibacVm12)
    "mibacVm14" -> success(MibacRatingMibacVm14)
    "mibacVm16" -> success(MibacRatingMibacVm16)
    "mibacVm18" -> success(MibacRatingMibacVm18)
    "mibacUnrated" -> success(MibacRatingMibacUnrated)
    _ -> failure(MibacRatingMibacUnspecified, "a valid MibacRating")
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
  use value <- then(string)
  case value {
    "mocUnspecified" -> success(MocRatingMocUnspecified)
    "mocE" -> success(MocRatingMocE)
    "mocT" -> success(MocRatingMocT)
    "moc7" -> success(MocRatingMoc7)
    "moc12" -> success(MocRatingMoc12)
    "moc15" -> success(MocRatingMoc15)
    "moc18" -> success(MocRatingMoc18)
    "mocX" -> success(MocRatingMocX)
    "mocBanned" -> success(MocRatingMocBanned)
    "mocUnrated" -> success(MocRatingMocUnrated)
    _ -> failure(MocRatingMocUnspecified, "a valid MocRating")
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
  use value <- then(string)
  case value {
    "moctwUnspecified" -> success(MoctwRatingMoctwUnspecified)
    "moctwG" -> success(MoctwRatingMoctwG)
    "moctwP" -> success(MoctwRatingMoctwP)
    "moctwPg" -> success(MoctwRatingMoctwPg)
    "moctwR" -> success(MoctwRatingMoctwR)
    "moctwUnrated" -> success(MoctwRatingMoctwUnrated)
    "moctwR12" -> success(MoctwRatingMoctwR12)
    "moctwR15" -> success(MoctwRatingMoctwR15)
    _ -> failure(MoctwRatingMoctwUnspecified, "a valid MoctwRating")
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
  use value <- then(string)
  case value {
    "mpaaUnspecified" -> success(MpaaRatingMpaaUnspecified)
    "mpaaG" -> success(MpaaRatingMpaaG)
    "mpaaPg" -> success(MpaaRatingMpaaPg)
    "mpaaPg13" -> success(MpaaRatingMpaaPg13)
    "mpaaR" -> success(MpaaRatingMpaaR)
    "mpaaNc17" -> success(MpaaRatingMpaaNc17)
    "mpaaX" -> success(MpaaRatingMpaaX)
    "mpaaUnrated" -> success(MpaaRatingMpaaUnrated)
    _ -> failure(MpaaRatingMpaaUnspecified, "a valid MpaaRating")
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
  use value <- then(string)
  case value {
    "mpaatUnspecified" -> success(MpaatRatingMpaatUnspecified)
    "mpaatGb" -> success(MpaatRatingMpaatGb)
    "mpaatRb" -> success(MpaatRatingMpaatRb)
    _ -> failure(MpaatRatingMpaatUnspecified, "a valid MpaatRating")
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
  use value <- then(string)
  case value {
    "mtrcbUnspecified" -> success(MtrcbRatingMtrcbUnspecified)
    "mtrcbG" -> success(MtrcbRatingMtrcbG)
    "mtrcbPg" -> success(MtrcbRatingMtrcbPg)
    "mtrcbR13" -> success(MtrcbRatingMtrcbR13)
    "mtrcbR16" -> success(MtrcbRatingMtrcbR16)
    "mtrcbR18" -> success(MtrcbRatingMtrcbR18)
    "mtrcbX" -> success(MtrcbRatingMtrcbX)
    "mtrcbUnrated" -> success(MtrcbRatingMtrcbUnrated)
    _ -> failure(MtrcbRatingMtrcbUnspecified, "a valid MtrcbRating")
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
  use value <- then(string)
  case value {
    "nbcUnspecified" -> success(NbcRatingNbcUnspecified)
    "nbcG" -> success(NbcRatingNbcG)
    "nbcPg" -> success(NbcRatingNbcPg)
    "nbc12plus" -> success(NbcRatingNbc12plus)
    "nbc15plus" -> success(NbcRatingNbc15plus)
    "nbc18plus" -> success(NbcRatingNbc18plus)
    "nbc18plusr" -> success(NbcRatingNbc18plusr)
    "nbcPu" -> success(NbcRatingNbcPu)
    "nbcUnrated" -> success(NbcRatingNbcUnrated)
    _ -> failure(NbcRatingNbcUnspecified, "a valid NbcRating")
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
  use value <- then(string)
  case value {
    "nbcplUnspecified" -> success(NbcplRatingNbcplUnspecified)
    "nbcplI" -> success(NbcplRatingNbcplI)
    "nbcplIi" -> success(NbcplRatingNbcplIi)
    "nbcplIii" -> success(NbcplRatingNbcplIii)
    "nbcplIv" -> success(NbcplRatingNbcplIv)
    "nbcpl18plus" -> success(NbcplRatingNbcpl18plus)
    "nbcplUnrated" -> success(NbcplRatingNbcplUnrated)
    _ -> failure(NbcplRatingNbcplUnspecified, "a valid NbcplRating")
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
  use value <- then(string)
  case value {
    "nfrcUnspecified" -> success(NfrcRatingNfrcUnspecified)
    "nfrcA" -> success(NfrcRatingNfrcA)
    "nfrcB" -> success(NfrcRatingNfrcB)
    "nfrcC" -> success(NfrcRatingNfrcC)
    "nfrcD" -> success(NfrcRatingNfrcD)
    "nfrcX" -> success(NfrcRatingNfrcX)
    "nfrcUnrated" -> success(NfrcRatingNfrcUnrated)
    _ -> failure(NfrcRatingNfrcUnspecified, "a valid NfrcRating")
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
  use value <- then(string)
  case value {
    "nfvcbUnspecified" -> success(NfvcbRatingNfvcbUnspecified)
    "nfvcbG" -> success(NfvcbRatingNfvcbG)
    "nfvcbPg" -> success(NfvcbRatingNfvcbPg)
    "nfvcb12" -> success(NfvcbRatingNfvcb12)
    "nfvcb12a" -> success(NfvcbRatingNfvcb12a)
    "nfvcb15" -> success(NfvcbRatingNfvcb15)
    "nfvcb18" -> success(NfvcbRatingNfvcb18)
    "nfvcbRe" -> success(NfvcbRatingNfvcbRe)
    "nfvcbUnrated" -> success(NfvcbRatingNfvcbUnrated)
    _ -> failure(NfvcbRatingNfvcbUnspecified, "a valid NfvcbRating")
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
  use value <- then(string)
  case value {
    "nkclvUnspecified" -> success(NkclvRatingNkclvUnspecified)
    "nkclvU" -> success(NkclvRatingNkclvU)
    "nkclv7plus" -> success(NkclvRatingNkclv7plus)
    "nkclv12plus" -> success(NkclvRatingNkclv12plus)
    "nkclv16plus" -> success(NkclvRatingNkclv16plus)
    "nkclv18plus" -> success(NkclvRatingNkclv18plus)
    "nkclvUnrated" -> success(NkclvRatingNkclvUnrated)
    _ -> failure(NkclvRatingNkclvUnspecified, "a valid NkclvRating")
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
  use value <- then(string)
  case value {
    "nmcUnspecified" -> success(NmcRatingNmcUnspecified)
    "nmcG" -> success(NmcRatingNmcG)
    "nmcPg" -> success(NmcRatingNmcPg)
    "nmcPg13" -> success(NmcRatingNmcPg13)
    "nmcPg15" -> success(NmcRatingNmcPg15)
    "nmc15plus" -> success(NmcRatingNmc15plus)
    "nmc18plus" -> success(NmcRatingNmc18plus)
    "nmc18tc" -> success(NmcRatingNmc18tc)
    "nmcUnrated" -> success(NmcRatingNmcUnrated)
    _ -> failure(NmcRatingNmcUnspecified, "a valid NmcRating")
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
  use value <- then(string)
  case value {
    "oflcUnspecified" -> success(OflcRatingOflcUnspecified)
    "oflcG" -> success(OflcRatingOflcG)
    "oflcPg" -> success(OflcRatingOflcPg)
    "oflcM" -> success(OflcRatingOflcM)
    "oflcR13" -> success(OflcRatingOflcR13)
    "oflcR15" -> success(OflcRatingOflcR15)
    "oflcR16" -> success(OflcRatingOflcR16)
    "oflcR18" -> success(OflcRatingOflcR18)
    "oflcUnrated" -> success(OflcRatingOflcUnrated)
    "oflcRp13" -> success(OflcRatingOflcRp13)
    "oflcRp16" -> success(OflcRatingOflcRp16)
    "oflcRp18" -> success(OflcRatingOflcRp18)
    _ -> failure(OflcRatingOflcUnspecified, "a valid OflcRating")
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
  use value <- then(string)
  case value {
    "pefilmUnspecified" -> success(PefilmRatingPefilmUnspecified)
    "pefilmPt" -> success(PefilmRatingPefilmPt)
    "pefilmPg" -> success(PefilmRatingPefilmPg)
    "pefilm14" -> success(PefilmRatingPefilm14)
    "pefilm18" -> success(PefilmRatingPefilm18)
    "pefilmUnrated" -> success(PefilmRatingPefilmUnrated)
    _ -> failure(PefilmRatingPefilmUnspecified, "a valid PefilmRating")
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
  use value <- then(string)
  case value {
    "rcnofUnspecified" -> success(RcnofRatingRcnofUnspecified)
    "rcnofI" -> success(RcnofRatingRcnofI)
    "rcnofIi" -> success(RcnofRatingRcnofIi)
    "rcnofIii" -> success(RcnofRatingRcnofIii)
    "rcnofIv" -> success(RcnofRatingRcnofIv)
    "rcnofV" -> success(RcnofRatingRcnofV)
    "rcnofVi" -> success(RcnofRatingRcnofVi)
    "rcnofUnrated" -> success(RcnofRatingRcnofUnrated)
    _ -> failure(RcnofRatingRcnofUnspecified, "a valid RcnofRating")
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
  use value <- then(string)
  case value {
    "resorteviolenciaUnspecified" -> success(
      ResorteviolenciaRatingResorteviolenciaUnspecified,
    )
    "resorteviolenciaA" -> success(ResorteviolenciaRatingResorteviolenciaA)
    "resorteviolenciaB" -> success(ResorteviolenciaRatingResorteviolenciaB)
    "resorteviolenciaC" -> success(ResorteviolenciaRatingResorteviolenciaC)
    "resorteviolenciaD" -> success(ResorteviolenciaRatingResorteviolenciaD)
    "resorteviolenciaE" -> success(ResorteviolenciaRatingResorteviolenciaE)
    "resorteviolenciaUnrated" -> success(
      ResorteviolenciaRatingResorteviolenciaUnrated,
    )
    _ -> failure(
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
  use value <- then(string)
  case value {
    "rtcUnspecified" -> success(RtcRatingRtcUnspecified)
    "rtcAa" -> success(RtcRatingRtcAa)
    "rtcA" -> success(RtcRatingRtcA)
    "rtcB" -> success(RtcRatingRtcB)
    "rtcB15" -> success(RtcRatingRtcB15)
    "rtcC" -> success(RtcRatingRtcC)
    "rtcD" -> success(RtcRatingRtcD)
    "rtcUnrated" -> success(RtcRatingRtcUnrated)
    _ -> failure(RtcRatingRtcUnspecified, "a valid RtcRating")
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
  use value <- then(string)
  case value {
    "rteUnspecified" -> success(RteRatingRteUnspecified)
    "rteGa" -> success(RteRatingRteGa)
    "rteCh" -> success(RteRatingRteCh)
    "rtePs" -> success(RteRatingRtePs)
    "rteMa" -> success(RteRatingRteMa)
    "rteUnrated" -> success(RteRatingRteUnrated)
    _ -> failure(RteRatingRteUnspecified, "a valid RteRating")
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
  use value <- then(string)
  case value {
    "russiaUnspecified" -> success(RussiaRatingRussiaUnspecified)
    "russia0" -> success(RussiaRatingRussia0)
    "russia6" -> success(RussiaRatingRussia6)
    "russia12" -> success(RussiaRatingRussia12)
    "russia16" -> success(RussiaRatingRussia16)
    "russia18" -> success(RussiaRatingRussia18)
    "russiaUnrated" -> success(RussiaRatingRussiaUnrated)
    _ -> failure(RussiaRatingRussiaUnspecified, "a valid RussiaRating")
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
  use value <- then(string)
  case value {
    "skfilmUnspecified" -> success(SkfilmRatingSkfilmUnspecified)
    "skfilmG" -> success(SkfilmRatingSkfilmG)
    "skfilmP2" -> success(SkfilmRatingSkfilmP2)
    "skfilmP5" -> success(SkfilmRatingSkfilmP5)
    "skfilmP8" -> success(SkfilmRatingSkfilmP8)
    "skfilmUnrated" -> success(SkfilmRatingSkfilmUnrated)
    _ -> failure(SkfilmRatingSkfilmUnspecified, "a valid SkfilmRating")
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
  use value <- then(string)
  case value {
    "smaisUnspecified" -> success(SmaisRatingSmaisUnspecified)
    "smaisL" -> success(SmaisRatingSmaisL)
    "smais7" -> success(SmaisRatingSmais7)
    "smais12" -> success(SmaisRatingSmais12)
    "smais14" -> success(SmaisRatingSmais14)
    "smais16" -> success(SmaisRatingSmais16)
    "smais18" -> success(SmaisRatingSmais18)
    "smaisUnrated" -> success(SmaisRatingSmaisUnrated)
    _ -> failure(SmaisRatingSmaisUnspecified, "a valid SmaisRating")
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
  use value <- then(string)
  case value {
    "smsaUnspecified" -> success(SmsaRatingSmsaUnspecified)
    "smsaA" -> success(SmsaRatingSmsaA)
    "smsa7" -> success(SmsaRatingSmsa7)
    "smsa11" -> success(SmsaRatingSmsa11)
    "smsa15" -> success(SmsaRatingSmsa15)
    "smsaUnrated" -> success(SmsaRatingSmsaUnrated)
    _ -> failure(SmsaRatingSmsaUnspecified, "a valid SmsaRating")
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
  use value <- then(string)
  case value {
    "tvpgUnspecified" -> success(TvpgRatingTvpgUnspecified)
    "tvpgY" -> success(TvpgRatingTvpgY)
    "tvpgY7" -> success(TvpgRatingTvpgY7)
    "tvpgY7Fv" -> success(TvpgRatingTvpgY7Fv)
    "tvpgG" -> success(TvpgRatingTvpgG)
    "tvpgPg" -> success(TvpgRatingTvpgPg)
    "pg14" -> success(TvpgRatingPg14)
    "tvpgMa" -> success(TvpgRatingTvpgMa)
    "tvpgUnrated" -> success(TvpgRatingTvpgUnrated)
    _ -> failure(TvpgRatingTvpgUnspecified, "a valid TvpgRating")
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
  use value <- then(string)
  case value {
    "ytUnspecified" -> success(YtRatingYtUnspecified)
    "ytAgeRestricted" -> success(YtRatingYtAgeRestricted)
    _ -> failure(YtRatingYtUnspecified, "a valid YtRating")
  }
}