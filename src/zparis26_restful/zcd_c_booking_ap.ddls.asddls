@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Consumption'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZCD_C_BOOKING_AP
  as projection on ZCD_I_BOOKING_M_AP
{
  key travel_id       as TravelID,
  key booking_id      as BookingID,
      booking_date    as BookingDate,
      customer_id     as CustomerID,
      carrier_id      as CarrierID,
      _Carrier.Name   as CarrierName,
      connection_id   as ConnectionID,
      flight_date     as FlightDate,
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      /* Associations */
      _Travel: redirected to parent ZCD_C_TRAVEL_AP,
      _BookSupplement: redirected to composition child ZCD_C_BOOKSUP_AP,
      _Customer,
      _Carrier
}
