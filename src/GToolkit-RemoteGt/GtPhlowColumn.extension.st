Extension { #name : #GtPhlowColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> asGtDeclarativeColumnDataType [
	^ [ dataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType new beUnknown ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> canBeForGtDeclarativeView [
	^ self asGtDeclarativeColumnDataType isUnknown not
]
