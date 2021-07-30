Class {
	#name : 'GtDeclarativeListingView',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'totalItemsCount'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'initialization' }
GtDeclarativeListingView >> initializeFromInspector: anInspector [
	self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)
]

{ #category : 'api - accessing' }
GtDeclarativeListingView >> retrieveItems: anItemsCount fromIndex: anIndex [
	^ self phlowDataSource 
		retrieveItems: anItemsCount fromIndex: anIndex
]

{ #category : 'accessing' }
GtDeclarativeListingView >> retrieveItemsFromIndex: anIndex [
	^ self retrieveItems: 100 fromIndex: anIndex
]

{ #category : 'api - accessing' }
GtDeclarativeListingView >> retrieveTotalItemsCount [
	^ self phlowDataSource retrieveTotalItemsCount
]

{ #category : 'accessing' }
GtDeclarativeListingView >> retriveFormattedItems [
	^ self phlowDataSource 
		retrieveItems: self totalItemsCount fromIndex: 1
]

{ #category : 'api - accessing' }
GtDeclarativeListingView >> retriveSentItemAt: aSelectionIndex [
	^ self phlowDataSource retriveSentItemAt: aSelectionIndex
]

{ #category : 'accessing' }
GtDeclarativeListingView >> totalItemsCount [
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self phlowDataSource retrieveTotalItemsCount ]
]
