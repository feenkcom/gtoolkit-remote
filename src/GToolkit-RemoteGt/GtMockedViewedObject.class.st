Class {
	#name : 'GtMockedViewedObject',
	#superclass : 'Object',
	#instVars : [
		'view'
	],
	#category : 'GToolkit-RemoteGt-Examples'
}

{ #category : 'accessing' }
GtMockedViewedObject >> retriveFormattedItemsForViewSelector: aSelector [
	^ (self view itemsBuilder value collect: [ :each | 
		(self view itemText value: each) gtDisplayString ]) asArray
]

{ #category : 'accessing' }
GtMockedViewedObject >> view [
	^ view
]

{ #category : 'accessing' }
GtMockedViewedObject >> view: anObject [
	view := anObject
]
