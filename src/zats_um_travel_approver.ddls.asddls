@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Approver projection'
@Metadata.allowExtensions: true
define root view entity ZATS_UM_TRAVEL_APPROVER
  as projection on ZATS_UM_TRAVEL
{
      @ObjectModel.text.element: [ 'Description' ]
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Agency',
        entity.element: 'AgencyID'
        }]
      AgencyId,
      @Semantics.text: true
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
       @Consumption.valueHelpDefinition: [{ 
        entity.name: '/DMO/I_Customer',
        entity.element: 'CustomerID'
        }]
      CustomerId,
      @Semantics.text: true
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,   
      TotalPrice,
      CurrencyCode,
      @Semantics.text: true
      Description,
      @Consumption.valueHelpDefinition: [{
        entity.name: '/DMO/I_Overall_Status_VH',
        entity.element: 'OverallStatus'  }]
      @ObjectModel.text.element: [ 'StatusText' ]
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      @Semantics.text: true
      StatusText,
      Criticality,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child ZATS_UM_BOOKING_APPROVER,
      _Currency,
      _Customer,
      _OverallStatus
}
