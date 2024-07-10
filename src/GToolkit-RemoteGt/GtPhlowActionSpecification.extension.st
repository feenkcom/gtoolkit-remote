Extension { #name : #GtPhlowActionSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowActionSpecification >> actionFor: anAction [
	"Specifications should implement this method to create a local phlow action from the remote data."
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowActionSpecification class >> fromDictionary: aSpecificationDictionary [
	"Answer the specification based on its exported data"
	| typeName |

	typeName := aSpecificationDictionary at: '__typeName'.
	^(Smalltalk globals at: typeName asSymbol) 
		fromJSONDictionary: aSpecificationDictionary.
]
