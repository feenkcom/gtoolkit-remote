Extension { #name : #GtPhlowViewSpecification }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification classSide >> globalsDictionary [

	self halt.  "How to look up classes?"
	^ GsCurrentSession currentSession symbolList
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification classSide >> new [

	^ super new initialize
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification classSide >> readJsonString: aString [

	self halt.
	^ JsonParser parse: aString
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification >> writeJsonString: aJsonObject [

	^ aJsonObject asJson
]
