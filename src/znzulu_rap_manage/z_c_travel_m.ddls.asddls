@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection Entity View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z_C_TRAVEL_M
provider contract transactional_query
 as projection on Z_I_TRAVEL_M
{
    key TravelId,
    
    @ObjectModel.text.element: [ 'AgencyName' ]
    AgencyId,
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    CustomerId,
    _Customer.FirstName as CustomerName,
    BeginDate,
    EndDate,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    @ObjectModel.text.element: [ 'OverallStatusText' ]
    OverallStatus,
    _Status._Text.Text as OverallStatusText: localized,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child Z_C_BOOKING_M,
    _Currency,
    _Customer,
    _Status
}
