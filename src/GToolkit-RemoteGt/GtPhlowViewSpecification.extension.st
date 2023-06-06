Extension { #name : #GtPhlowViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification classSide >> fromDictionary: viewDictionary [
	"Answer the view specified by viewDictionary"
	| viewName |

	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification classSide >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary viewName |

	viewDictionary := STONJSON fromString: aString.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]
