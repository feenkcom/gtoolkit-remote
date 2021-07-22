Class {
	#name : 'GtMockedViewedObject',
	#superclass : 'Object',
	#instVars : [
		'view'
	],
	#category : 'GToolkit-RemoteGt-Examples'
}

{ #category : 'accessing' }
GtMockedViewedObject >> retrieveItemsCount: anItemsCount fromIndex: anIndex forViewSelector: aViewSelector [
	| viewItems |
	viewItems := self view itemsBuilder value.
	^ ((viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size))
	 			collect: [ :each | 
					(self view itemText value: each) gtDisplayString ]) asArray
]

{ #category : 'accessing' }
GtMockedViewedObject >> retrieveTotalItemsCountForViewSelector: aViewSelector [
	^ self view itemsBuilder value size
]

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
