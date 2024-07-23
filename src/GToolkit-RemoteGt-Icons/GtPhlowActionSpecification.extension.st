Extension { #name : #GtPhlowActionSpecification }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowActionSpecification >> actionFor: anAction [
	"Specifications should implement this method to create a local phlow action from the remote data."
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowActionSpecification class >> phlowActionFromDictionary: aSpecificationDictionary [
	^ self fromDictionary: aSpecificationDictionary
]
