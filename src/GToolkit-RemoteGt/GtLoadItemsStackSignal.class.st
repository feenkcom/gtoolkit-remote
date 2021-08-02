Class {
	#name : 'GtLoadItemsStackSignal',
	#superclass : 'ContextStackSignal',
	#instVars : [
		'startIndex',
		'chunkSize'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : 'accessing' }
GtLoadItemsStackSignal >> chunkSize [
	^ chunkSize
]

{ #category : 'accessing' }
GtLoadItemsStackSignal >> chunkSize: anObject [
	chunkSize := anObject
]

{ #category : 'printing' }
GtLoadItemsStackSignal >> printOneLineContentsOn: stream [ 
	super printOneLineContentsOn: stream.
	stream 
		nextPutAll: ' (index: ';
		nextPutAll: self startIndex asString;
		nextPutAll: ')'
]

{ #category : 'accessing' }
GtLoadItemsStackSignal >> startIndex [
	^ startIndex
]

{ #category : 'accessing' }
GtLoadItemsStackSignal >> startIndex: anObject [
	startIndex := anObject
]
