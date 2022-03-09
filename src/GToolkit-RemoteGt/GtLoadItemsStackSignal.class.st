Class {
	#name : #GtLoadItemsStackSignal,
	#superclass : #ContextStackSignal,
	#instVars : [
		'startIndex',
		'chunkSize'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : #testing }
GtLoadItemsStackSignal class >> gtNormalOperationSignal [
	"Answer a Boolean indicating whether this signal is generated as part of normal operations.
	Excluding these signals makes a good starting point for application specific logging, or logging unexpected signals"

	^ true.
]

{ #category : #accessing }
GtLoadItemsStackSignal >> chunkSize [
	^ chunkSize
]

{ #category : #accessing }
GtLoadItemsStackSignal >> chunkSize: anObject [
	chunkSize := anObject
]

{ #category : #printing }
GtLoadItemsStackSignal >> printOneLineContentsOn: stream [ 
	super printOneLineContentsOn: stream.
	stream 
		nextPutAll: ' (index: ';
		nextPutAll: self startIndex asString;
		nextPutAll: ')'
]

{ #category : #accessing }
GtLoadItemsStackSignal >> startIndex [
	^ startIndex
]

{ #category : #accessing }
GtLoadItemsStackSignal >> startIndex: anObject [
	startIndex := anObject
]
