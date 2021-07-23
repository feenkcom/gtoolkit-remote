Extension { #name : #GtRemotePhlowDeclarativeView }

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowDeclarativeView classSide >> globalsDictionary [
	"Answer the Smalltalk globals dictionary"

	^ Smalltalk globals
]

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowDeclarativeView classSide >> readJsonString: aString [

	^ STONJSON fromString: aString
]

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowDeclarativeView >> writeJsonString: aJsonObject [

	^ STONJSON toStringPretty: aJsonObject
]
