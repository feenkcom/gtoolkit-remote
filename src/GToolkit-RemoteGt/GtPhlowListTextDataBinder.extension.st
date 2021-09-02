Extension { #name : 'GtPhlowListTextDataBinder' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListTextDataBinder >> asRemotePhlowDeclarativeListingType [
	^ GtPhlowDeclarativeListingType new beText
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListTextDataBinder >> asRemotePhlowDeclarativeValueComputationFor: anItemObject index: anItemIndex [
	^ GtPhlowDeclarativeListingValueComputation new
		computation: textComputation
		arguments: { anItemObject . anItemIndex }
]
