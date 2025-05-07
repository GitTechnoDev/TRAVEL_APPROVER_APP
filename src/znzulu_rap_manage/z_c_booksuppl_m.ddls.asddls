@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppl Projection Entity View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_C_BOOKSUPPL_M 
as projection on Z_I_BOOKSUPPL_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @ObjectModel.text.element: [ 'Description' ]
    SupplementId,
    _SupplementText.Description as Description: localized,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
     @Consumption.valueHelpDefinition: [{ entity: {
                                     name: 'I_Currency',
                                    element: 'Currency' } }] 
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking: redirected to parent Z_C_BOOKING_M,
    _Supplement,
    _SupplementText,
    _Travel: redirected to Z_C_TRAVEL_M
}
