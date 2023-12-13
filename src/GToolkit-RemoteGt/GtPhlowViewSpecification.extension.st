Extension { #name : #GtPhlowViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> asJSONForExport [ 
	"Answer the receiver serialised in JSON format"

	^STONJSON toStringPretty: self asDictionaryForExport
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification class >> fromDictionary: viewDictionary [
	"Answer the view specified by viewDictionary"
	| viewName |

	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(Smalltalk globals at: viewName asSymbol) fromJSONDictionary: viewDictionary.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification class >> fromJSONString: aString [
	"Answer the view specified by aString"

	| viewDictionary |

	viewDictionary := STONJSON fromString: aString.
	^self fromDictionary: viewDictionary.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> gtActionBuildViewFor: anAction [
	<gtAction>
	
	^ anAction button
		  icon: BrGlamorousIcons go;
		  tooltip: 'Create view';
		  action: [ :aButton |
		  	aButton phlow spawnObject: (self viewFor: GtPhlowView empty)  ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewSpecification >> viewFor: aView [
	"Specifications should implement this method to create a local phlow view from the remote data."
]
