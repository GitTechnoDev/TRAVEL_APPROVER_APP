@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View Managed'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_BOOKING_M
  as select from znbooking_tech_m
  association to parent Z_I_TRAVEL_M as _Travel on $projection.TravelId = _Travel.TravelId
  composition [0..*] of Z_I_BOOKSUPPL_M as _Bookingsuppl
  
  association [1..1] to /DMO/I_Carrier           as _Carrier     on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Customer          as _Customer    on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Connection        as _Connection  on  $projection.CarrierId    = _Connection.AirlineID
                                                                 and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _Book_Status on  $projection.BookingStatus = _Book_Status.BookingStatus
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
      // the persistent field last_changed_at plays a specific role in ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at as LastChangedAt,
      //Composition Relationship for child to mother 
      _Travel,
      
      //Commposition Relationship from Mother to Child
      _Bookingsuppl,
      
      //expose associetion
      _Carrier,
      _Customer,
      _Connection,
      _Book_Status
}
