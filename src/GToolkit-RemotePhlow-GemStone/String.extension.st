Extension { #name : #String }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
String >> gtDisplayOn: writeStream [
	writeStream nextPutAll: self
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
String class >> gtGsInspectorIconName [
	^ #stringIcon
]
