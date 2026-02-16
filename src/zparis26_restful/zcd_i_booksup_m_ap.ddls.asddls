@AbapCatalog.sqlViewName: 'ZVW_BOOKSUP_M_AP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement'
define view ZCD_I_BOOKSUP_M_AP
  as select from ztb_booksup_m_ap as BookingSupplement
  association        to parent ZCD_I_BOOKING_M_AP as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                     and $projection.booking_id = _Booking.booking_id
  association [1..1] to ZCD_I_TRAVELS_M_AP        as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement         as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
      /* Associations */
      _Travel,
      _Booking,
      _Product,
      _SupplementText

}
