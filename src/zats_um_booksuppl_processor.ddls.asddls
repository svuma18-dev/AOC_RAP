@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel processor projection'
@Metadata.allowExtensions: true
define view entity ZATS_UM_BOOKSUPPL_PROCESSOR
  as projection on ZATS_UM_BOOKSUPPL
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
    @Consumption.valueHelpDefinition: [{
       entity.name: '/DMO/I_Supplement',
       entity.element: 'SupplementID'
       }]
  SupplementId,
  Price,
  CurrencyCode,
  LastChangedAt,
  /* Associations */
  _Booking: redirected to parent ZATS_UM_BOOKING_PROCESSOR,
  _Product,
  _SupplementText,
  _Travel: redirected to ZATS_UM_TRAVEL_PROCESSOR
}
