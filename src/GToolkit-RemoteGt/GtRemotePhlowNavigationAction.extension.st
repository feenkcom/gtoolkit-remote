Extension { #name : #GtRemotePhlowNavigationAction }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowNavigationAction class >> fromDictionary: aSpecificationDictionary [
	"Answer the specification based on its exported data"
	| typeName |

	typeName := aSpecificationDictionary at: '__typeName'.
	^(Smalltalk globals at: typeName asSymbol) 
		fromJSONDictionary: aSpecificationDictionary.
]
