Class {
	#name : 'GtRemotePhlowViewCache',
	#superclass : 'Object',
	#instVars : [
		'viewedObject',
		'viewSelector',
		'view',
		'declarativeView',
		'cachedData'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : 'instance creation' }
GtRemotePhlowViewCache class >> viewedObject: aGtViewedObject selector: viewSelector [

	^ self new 
		viewedObject: aGtViewedObject;
		viewSelector: viewSelector;
		yourself
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> cachedData [
	^ cachedData ifNil: [ 
		cachedData := Dictionary new ]
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> catcheAt: aKey	ifAbsentPut: aPutBlock [
	^ self cachedData 
		at: aKey ifAbsentPut: aPutBlock
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> declarativeView [

	^ declarativeView ifNil: 
		[ declarativeView := (self object perform: viewSelector with: GtRemotePhlowDeclarativeProtoView new) ]
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> object [

	^ self viewedObject object
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> retrieveItems: anItemsCount fromIndex: anIndex [
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ ((viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size))
	 			collect: [ :each | 
					(self declarativeView itemTextBlock value: each) gtDisplayString ]) asArray
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> retrieveTotalItemsCount [
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ viewItems size
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> retriveFormattedItems [
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ (viewItems collect: [ :each | 
		(self declarativeView itemTextBlock value: each) gtDisplayString ]) asArray
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> retriveSentItemAtIndex: aSelectionIndex [
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ viewItems at: aSelectionIndex
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> viewSelector [
	^ viewSelector
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> viewSelector: anObject [
	viewSelector := anObject
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> viewedObject [
	^ viewedObject
]

{ #category : 'accessing' }
GtRemotePhlowViewCache >> viewedObject: anObject [
	viewedObject := anObject
]
