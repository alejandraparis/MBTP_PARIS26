@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZCD_C_BOOKSUP_AP
  as projection on ZCD_I_BOOKSUP_M_AP
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      price                       as Price,
      currency_code               as CurrencyCode,
      last_changed_at             as LastChangedAt,
      /* Associations */
      _Travel : redirected to ZCD_C_TRAVEL_AP,
      _Booking : redirected to parent ZCD_C_BOOKING_AP,
      _SupplementText
}
