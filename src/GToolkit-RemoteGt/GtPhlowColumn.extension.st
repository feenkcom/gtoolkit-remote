Extension { #name : #GtPhlowColumn }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> asGtDeclarativeColumnDataType [
	^ self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumn >> canBeForGtDeclarativeView [
	^ self asGtDeclarativeColumnDataType isUnknown not
]
