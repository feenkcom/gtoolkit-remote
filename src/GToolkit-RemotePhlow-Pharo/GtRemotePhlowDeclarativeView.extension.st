Extension { #name : 'GtRemotePhlowDeclarativeView' }

{ #category : '*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowDeclarativeView class >> globalsDictionary [
	"Answer the Smalltalk globals dictionary"

	^ Smalltalk globals
]

{ #category : '*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowDeclarativeView class >> readJsonString: aString [

	^ STONJSON fromString: aString
]

{ #category : '*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowDeclarativeView >> writeJsonString: aJsonObject [

	^ STONJSON toStringPretty: aJsonObject
]
