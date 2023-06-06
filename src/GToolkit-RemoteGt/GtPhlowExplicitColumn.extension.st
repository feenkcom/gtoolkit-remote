Extension { #name : #GtPhlowExplicitColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowExplicitColumn >> asGtDeclarativeColumnDataType [
	^ [ dataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType new beUnknown ]
]
