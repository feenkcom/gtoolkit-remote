Class {
	#name : 'GtViewCache',
	#superclass : 'Object',
	#instVars : [
		'viewedObject',
		'viewSelector',
		'view',
		'declarativeView',
		'cachedData'
	],
	#category : 'GToolkit-RemoteGt-Server'
}

{ #category : 'instance creation' }
GtViewCache class >> viewedObject: aGtViewedObject selector: viewSelector [

	^ self new 
		viewedObject: aGtViewedObject;
		viewSelector: viewSelector;
		yourself
]

{ #category : 'accessing' }
GtViewCache >> cachedData [
	^ cachedData ifNil: [ 
		cachedData := Dictionary new ]
]

{ #category : 'accessing' }
GtViewCache >> catcheAt: aKey	ifAbsentPut: aPutBlock [
	^ self cachedData 
		at: aKey ifAbsentPut: aPutBlock
]

{ #category : 'accessing' }
GtViewCache >> declarativeView [

	^ declarativeView ifNil: [ 
		| concreteView |
		concreteView := self view.
		declarativeView := concreteView asGtDeclarativeView
			"accessor: concreteView;"
			yourself ]
]

{ #category : 'accessing' }
GtViewCache >> object [

	^ self viewedObject object
]

{ #category : 'accessing' }
GtViewCache >> retriveFormattedItems [
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self view itemsBuilder value ].
	^ (viewItems collect: [ :each | 
		(self view itemText value: each) gtDisplayString ]) asArray
]

{ #category : 'accessing' }
GtViewCache >> view [

	^ view ifNil: [ 
		view := self object 
			perform: viewSelector 
			with: GtPhlowEmptyView new ]
]

{ #category : 'accessing' }
GtViewCache >> viewSelector [
	^ viewSelector
]

{ #category : 'accessing' }
GtViewCache >> viewSelector: anObject [
	viewSelector := anObject
]

{ #category : 'accessing' }
GtViewCache >> viewedObject [
	^ viewedObject
]

{ #category : 'accessing' }
GtViewCache >> viewedObject: anObject [
	viewedObject := anObject
]
