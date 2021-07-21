Class {
	#name : 'GtMockedRemoteItemsProvider',
	#superclass : 'Object',
	#instVars : [
		'items',
		'chunkSize'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : 'accessing' }
GtMockedRemoteItemsProvider >> chunkSize [
	^ chunkSize
]

{ #category : 'accessing' }
GtMockedRemoteItemsProvider >> chunkSize: anObject [
	chunkSize := anObject
]

{ #category : 'testing' }
GtMockedRemoteItemsProvider >> hasItemsAfterIndex: anIndex [
	^ anIndex < self items size
]

{ #category : 'api - accessing' }
GtMockedRemoteItemsProvider >> initialItems [
	^ items first: self chunkSize
]

{ #category : 'accessing' }
GtMockedRemoteItemsProvider >> items [
	^ items
]

{ #category : 'accessing' }
GtMockedRemoteItemsProvider >> items: anObject [
	items := anObject
]

{ #category : 'api - accessing' }
GtMockedRemoteItemsProvider >> loadNewItemsFromIndex: anIndex [
	
	^ items 
		copyFrom: anIndex
		to: ((anIndex + self chunkSize - 1) min: self items size)
]
