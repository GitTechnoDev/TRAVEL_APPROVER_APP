@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approve Projection Travel'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@UI.headerInfo: {
    typeName: 'Travel',
    typeNamePlural: 'Travels',
    title: {
        type: #STANDARD,
        label: 'Travel',
        value: 'TravelId'
    }
}
define root view entity Z_C_TRAVEL_APPROVE_M
  provider contract transactional_query
  as projection on Z_I_TRAVEL_M
{
      @UI.facet: [{ id: 'Travel',
                     purpose: #STANDARD,
                     type: #IDENTIFICATION_REFERENCE,
                     label: 'Travel',
                     position: 10 },
                   { id: 'Booking',
                     purpose: #STANDARD,
                     type: #LINEITEM_REFERENCE,
                     position: 20,
                     targetElement: '_Booking' } ]
      @UI:{ lineItem: [{ position: 10, importance: #HIGH  }],
            identification: [{ position: 10 }] }
      @Search.defaultSearchElement: true
  key TravelId,
      @UI: { lineItem: [{ position: 20, importance: #HIGH }],
             identification: [{ position: 20  }],
             selectionField: [{ position: 20 }]}
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Agency', element: 'AgencyID' } }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name as AgencyName,
      @UI: { lineItem: [{ position: 30, importance: #HIGH }],
                          identification: [{ position: 30  }],
                          selectionField: [{ position: 30 }]}
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Customer', element: 'CustomerID' } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.LastName as CustomerName,
      @UI:{identification: [{ position: 40, label: 'Begin Date' }]}
      BeginDate,
       @UI:{identification: [{ position: 41, label: 'End Date' }]}
      EndDate,
      @UI:{ lineItem: [{ position: 42, label: 'Booking Fee', importance: #HIGH }],
            identification: [{ position: 42, label: 'Booking Fee' }]}
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
        @UI:{ lineItem: [{ position: 43, label: 'Total Price', importance: #HIGH }],
            identification: [{ position: 43, label: 'Total Price' }]}
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: {
                                  name: 'I_Currency',
                                  element: 'Currency' } }]
      CurrencyCode,
       @UI:{ lineItem: [{ position: 45, label: 'Description', importance: #MEDIUM }],
            identification: [{ position: 45, label: 'Description' }]}
      Description,
      @UI: { lineItem: [{ position: 15, importance: #HIGH },
                        {type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'Accept  Travel'},
                         {type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'Reject Travel'}],
             identification: [{ position: 15 },
                              {type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'Accept  Travel'},
                              {type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'Reject Travel'}],
             textArrangement: #TEXT_ONLY,
             selectionField: [{ position: 40 }]  }
      @EndUserText.label: 'Overall Status'  
       @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Overall_Status_VH',
                                           element: 'OverallStatus' } }]
      @ObjectModel.text.element: [ 'OverallStatusText' ]                                
      OverallStatus,
      @UI.hidden: true
      _Status._Text.Text as OverallStatusText: localized,
       @UI.hidden: true
      CreatedBy,
       @UI.hidden: true
      CreatedAt,
       @UI.hidden: true
      LastChangedBy,
       @UI.hidden: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child Z_C_BOOKING_APPROVE_M,
      _Currency,
      _Customer,
      _Status
}
