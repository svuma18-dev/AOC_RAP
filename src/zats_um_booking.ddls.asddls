@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking as child entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZATS_UM_BOOKING
  as select from /dmo/booking_m

  composition [0..*] of ZATS_UM_BOOKSUPPL        as _Booksuppl

  association        to parent ZATS_UM_TRAVEL           as _Travel on $projection.TravelId = _Travel.TravelId

  association [1..1] to /dmo/customer            as _Customer      on $projection.CustomerId = _Customer.customer_id
  association [1..1] to /dmo/carrier             as _Carrier       on $projection.CarrierId = _Carrier.carrier_id
  association [1..1] to /dmo/connection          as _Connection    on $projection.ConnectionId = _Connection.connection_id
  association [1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on $projection.BookingStatus = _BookingStatus.BookingStatus
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      /*Expose Associtions*/
      _Travel,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus,
      _Booksuppl
}
