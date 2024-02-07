Extension { #name : 'String' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
String class >> gtGsInspectorIconName [
	^ #stringIcon
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
String >> asRopedText [
	^ GtPhlowText forString: self
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
String >> gtDisplayOn: writeStream [
	writeStream nextPutAll: self
]
