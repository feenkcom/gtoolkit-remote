Extension { #name : #GtRemotePhlowDeclarativeView }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView classSide >> globalsDictionary [

	self halt.  "How to look up classes?"
	^ GsCurrentSession currentSession symbolList
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView classSide >> new [

	^ super new initialize
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView classSide >> readJsonString: aString [

	self halt.
	^ JsonParser parse: aString
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView >> writeJsonString: aJsonObject [

	^ STON toJsonStringPretty: aJsonObject
]
