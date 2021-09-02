Extension { #name : 'GtPhlowListTextualLinkDataBinder' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListTextualLinkDataBinder >> asRemotePhlowDeclarativeListingType [
	^ GtPhlowDeclarativeListingType new beTextLink
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListTextualLinkDataBinder >> asRemotePhlowDeclarativeValueComputationFor: anItemObject index: anItemIndex [
	^ GtPhlowDeclarativeListingValueComputation new
		computation: textComputation
		arguments: { anItemObject . anItemIndex }
]
