Extension { #name : 'GtRemotePhlowDeclarativeView' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView class >> globalsDictionary [

	self halt.  "How to look up classes?"
	^ GsCurrentSession currentSession symbolList
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView class >> readJsonString: aString [

	self halt.
	^ JsonParser parse: aString
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowDeclarativeView >> writeJsonString: aJsonObject [

	^ STON toJsonStringPretty: aJsonObject
]
