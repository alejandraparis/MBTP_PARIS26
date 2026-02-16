@AbapCatalog.sqlViewName: 'ZVW_BOOKING_M_AP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view ZCD_I_BOOKING_M_AP
  as select from ztb_booking_m_ap as Booking
  association        to parent ZCD_I_TRAVELS_M_AP as _Travel     on  $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZCD_I_BOOKSUP_M_AP        as _BookSupplement
  association [1..1] to /DMO/I_Customer           as _Customer   on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier            as _Carrier    on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection         as _Connection on  $projection.carrier_id    = _Connection.AirlineID
                                                                 and $projection.connection_id = _Connection.ConnectionID

{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      @Semantics.currencyCode: true
      currency_code,
      booking_status,
      last_changed_at,
      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection
}
