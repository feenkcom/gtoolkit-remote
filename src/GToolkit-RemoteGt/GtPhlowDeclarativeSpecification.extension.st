Extension { #name : #GtPhlowDeclarativeSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDeclarativeSpecification >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDeclarativeSpecification class >> fromDictionary: aSpecificationDictionary [
	"Answer the specification based on its exported data"
	| typeName |

	typeName := aSpecificationDictionary at: '__typeName'.
	^(Smalltalk globals at: typeName asSymbol) 
		fromJSONDictionary: aSpecificationDictionary.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDeclarativeSpecification class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary |

	viewDictionary := STONJSON fromString: aString.
	^self fromJSONDictionary: viewDictionary.
]
