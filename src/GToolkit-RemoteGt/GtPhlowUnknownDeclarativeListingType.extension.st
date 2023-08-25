Extension { #name : #GtPhlowUnknownDeclarativeListingType }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowUnknownDeclarativeListingType >> createColumnWithSpecification: aColumnSpecification atIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [
	Error signal: 'Unknown columns types cannot be used in remote phlow'
]
