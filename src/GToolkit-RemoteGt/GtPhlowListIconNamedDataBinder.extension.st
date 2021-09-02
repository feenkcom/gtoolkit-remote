Extension { #name : 'GtPhlowListIconNamedDataBinder' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListIconNamedDataBinder >> asRemotePhlowDeclarativeListingType [
	^ GtPhlowDeclarativeListingType new beIcon
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowListIconNamedDataBinder >> asRemotePhlowDeclarativeValueComputationFor: anItemObject index: anItemIndex [
	^ GtPhlowDeclarativeListingValueComputation new
		computation: iconNameComputation
		arguments: { anItemObject . anItemIndex }
]
