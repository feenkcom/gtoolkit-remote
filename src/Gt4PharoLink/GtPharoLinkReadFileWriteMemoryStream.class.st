Class {
	#name : #GtPharoLinkReadFileWriteMemoryStream,
	#superclass : #Object,
	#instVars : [
		'readWrite',
		'readOnly',
		'readOnlyLimit'
	],
	#category : 'Gt4PharoLink-CodeSync'
}

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream class >> readOnly: aStream readOnlyLimit: anInteger readWrite: anotherStream [

	^ self new
		  initializeReadOnly: aStream
		  readOnlyLimit: anInteger
		  readWrite: anotherStream;
		  yourself
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> atEnd [

	^ readOnly position = readOnlyLimit and: [ readWrite atEnd ]
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> close [

	readOnly close.
	readWrite close
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> closed [

	^ readOnly closed and: [ readWrite closed ]
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> discardBuffer [

	readOnly discardBuffer.
	readWrite discardBuffer
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> flush [

	readWrite flush
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> initializeReadOnly: aStream readOnlyLimit: anInteger readWrite: anotherStream [

	readOnly := aStream.
	readOnlyLimit := anInteger.
	readWrite := anotherStream
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> isBinary [

	^ readOnly isBinary and: [ readWrite isBinary ]
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> next [

	self position < readOnlyLimit ifTrue: [ ^ readOnly next ].
	^ readWrite next
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> next: anInteger putAll: aCollection startingAt: startIndex [

	| offset |
	offset := readOnlyLimit - readOnly position max: 0.
	offset > 0 ifTrue: [ 
		| read written |
		read := readOnly next: offset.
		written := aCollection
			           copyFrom: startIndex
			           to: startIndex + offset - 1.
		read = written ifFalse: [ self error: 'readOnly is immutable' ] ].
	^ readWrite
		  next: anInteger - offset
		  putAll: aCollection
		  startingAt: startIndex + offset
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> position [

	readOnly position < readOnlyLimit ifTrue: [ ^ readOnly position ].
	^ readOnlyLimit + readWrite position
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> position: anInteger [

	anInteger < readOnlyLimit
		ifTrue: [ 
			readOnly position: anInteger.
			readWrite position: 0 ]
		ifFalse: [ 
			readOnly position: readOnlyLimit.
			readWrite position: anInteger - readOnlyLimit ]
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> readInto: aCollection startingAt: startIndex count: n [

	| max read |
	max := self size - self position min: n.
	read := 0.
	readOnly position < readOnlyLimit ifTrue: [ 
		read := readOnly
			        readInto: aCollection
			        startingAt: startIndex
			        count: max ].
	read < max ifTrue: [ 
		read := read + (readWrite
			         readInto: aCollection
			         startingAt: startIndex + read
			         count: max - read) ].
	^ read
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemoryStream >> size [

	^ readOnlyLimit + readWrite size
]
