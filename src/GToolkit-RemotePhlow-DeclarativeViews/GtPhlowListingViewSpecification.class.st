Class {
	#name : #GtPhlowListingViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'totalItemsCount'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> flushItemsIterator [ 

	phlowDataSource flushItemsIterator
]

{ #category : #initialization }
GtPhlowListingViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> retrieveItems: anItemsCount fromIndex: anIndex [
	^ self phlowDataSource 
		retrieveItems: anItemsCount fromIndex: anIndex
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> retrieveItemsFromIndex: anIndex [
	^ self retrieveItems: 100 fromIndex: anIndex
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> retrieveTotalItemsCount [
	^ self phlowDataSource retrieveTotalItemsCount
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> retriveFormattedItems [
	^ self phlowDataSource 
		retrieveItems: self totalItemsCount fromIndex: 1
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> retriveSentItemAt: aSelectionIndex [
	^ self phlowDataSource retriveSentItemAt: aSelectionIndex
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> totalItemsCount [
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self phlowDataSource retrieveTotalItemsCount ]
]
