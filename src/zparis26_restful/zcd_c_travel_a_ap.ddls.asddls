@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver Consumption Travel'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZCD_C_TRAVEL_A_AP provider contract transactional_query
  as projection on ZCD_I_TRAVELS_M_AP
{
  key travel_id          as TravelID,
      agency_id          as AgencyID,
      _Agency.Name       as AgencyName,
      customer_id        as CustomerID,
      _Customer.LastName as CustomerName,
      begin_date         as BeginDate,
      end_date           as EndDate,
      booking_fee        as BookingFee,
      total_price        as TotalPrice,
      currency_code      as CurrencyCode,
      overall_status     as TravelStatus,
      description        as Description,
      last_changed_at    as LastChangedAt,
      /* Associations */
      _Booking: redirected to composition child ZCD_C_BOOKING_A_AP,
      _Agency,
      _Customer
}
