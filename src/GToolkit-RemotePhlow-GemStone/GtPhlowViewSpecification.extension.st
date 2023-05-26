Extension { #name : #GtPhlowViewSpecification }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification class >> globalsDictionary [

	self halt.  "How to look up classes?"
	^ GsCurrentSession currentSession symbolList
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification class >> new [

	^ super new initialize
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification class >> readJsonString: aString [

	self halt.
	^ JsonParser parse: aString
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtPhlowViewSpecification >> writeJsonString: aJsonObject [

	^ aJsonObject asJson
]
