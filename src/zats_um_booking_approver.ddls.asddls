@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Approver projection'
@Metadata.allowExtensions: true
define view entity ZATS_UM_BOOKING_APPROVER
  as projection on ZATS_UM_BOOKING
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingStatus,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZATS_UM_TRAVEL_approver
}
