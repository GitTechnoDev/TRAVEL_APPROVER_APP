@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection Entity View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_C_BOOKING_M
  as projection on Z_I_BOOKING_M
{
  key TravelId,
  key BookingId,
      BookingDate,
       @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.FirstName as CustomerName,
       @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'BookStatusText' ]
      BookingStatus,
      _Book_Status._Text.Text as BookStatusText: localized,
      LastChangedAt,
      /* Associations */
      _Bookingsuppl: redirected to composition child Z_C_BOOKSUPPL_M ,
      _Book_Status,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent Z_C_TRAVEL_M
}
