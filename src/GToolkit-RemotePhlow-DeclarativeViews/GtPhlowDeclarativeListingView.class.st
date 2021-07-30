Class {
	#name : 'GtPhlowDeclarativeListingView',
	#superclass : 'GtPhlowDeclarativeView',
	#instVars : [
		'totalItemsCount'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'initialization' }
GtPhlowDeclarativeListingView >> initializeFromInspector: anInspector [
	self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)
]

{ #category : 'api - accessing' }
GtPhlowDeclarativeListingView >> retrieveItems: anItemsCount fromIndex: anIndex [
	^ self phlowDataSource 
		retrieveItems: anItemsCount fromIndex: anIndex
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingView >> retrieveItemsFromIndex: anIndex [
	^ self retrieveItems: 100 fromIndex: anIndex
]

{ #category : 'api - accessing' }
GtPhlowDeclarativeListingView >> retrieveTotalItemsCount [
	^ self phlowDataSource retrieveTotalItemsCount
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingView >> retriveFormattedItems [
	^ self phlowDataSource 
		retrieveItems: self totalItemsCount fromIndex: 1
]

{ #category : 'api - accessing' }
GtPhlowDeclarativeListingView >> retriveSentItemAt: aSelectionIndex [
	^ self phlowDataSource retriveSentItemAt: aSelectionIndex
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingView >> totalItemsCount [
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self phlowDataSource retrieveTotalItemsCount ]
]
