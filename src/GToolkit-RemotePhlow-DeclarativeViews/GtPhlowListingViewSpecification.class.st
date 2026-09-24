"
{{gtClass:GtPhlowListingViewSpecification}} provides support for instantiating local list, tree and column views used to show the items in remote list, tree and column views.

When the remote side is in a different environment, in the local instance of the specification,  `phlowDataSource` is going to be a proxy providing the required API for accessing items in the view. 

When the remote side is Glamorous Toolkit, Pharo and GemStone, the data source is of type {{gtClass:GtRemotePhlowDeclarativeViewListingDataSource}} in the remote instance of the specification.
"
Class {
	#name : #GtPhlowListingViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'totalItemsCount',
		'hasMultipleSelection',
		'hasContextActionSpecifications'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowListingViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	
	(aDictionary at: 'hasMultipleSelection' ifAbsent: [ nil ])
		ifNotNil: [ :aBoolean |
			specification hasMultipleSelection: aBoolean ].
	(aDictionary at: 'hasContextActionSpecifications' ifAbsent: [ nil ])
		ifNotNil: [ :aBoolean |
			specification hasContextActionSpecifications: aBoolean ].
			
	^ specification
]

{ #category : #testing }
GtPhlowListingViewSpecification class >> isAbstract [
	^ self name= #GtPhlowListingViewSpecification
]

{ #category : #converting }
GtPhlowListingViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	
	dictionary := super asBasicViewDataForExport.
	dictionary at: 'hasMultipleSelection' put: self hasMultipleSelection.
	dictionary at: 'hasContextActionSpecifications' put: self hasContextActionSpecifications.
	
	^dictionary
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> bareRetrieveSentItemAtPhlowSelectionData: aPhlowSelectionData [
	^ self phlowDataSource 
		bareRetrieveSentItemAtPhlowSelectionData: aPhlowSelectionData
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> bareRetriveContextActionSpecificationsForPhlowSelectionData: aPhlowSelectionData [
	^ self phlowDataSource 
		bareRetriveContextActionSpecificationsForPhlowSelectionData: aPhlowSelectionData
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> createViewMultipleSelectionFromNodes: aCollectionOfNodes selectionIndices: aSelectionIndexes [
	| viewSelection selectionItems|
	
	selectionItems := aCollectionOfNodes collectWithIndex: [ :aNode :anIndex |
 		aNode value createSelectionItem
 			selectionIndex: (aSelectionIndexes at: anIndex)  ].
 		
	viewSelection:= GtRemotePhlowListingViewMultipleSelection new
 		selectionItems: selectionItems.

	^ viewSelection
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> flushCachedData [
	self flushItemsIterator 
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> flushItemsIterator [ 

	phlowDataSource flushItemsIterator
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> hasContextActionSpecifications [
	^ hasContextActionSpecifications ifNil: [ false ]
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> hasContextActionSpecifications: aBoolean [
	hasContextActionSpecifications := aBoolean
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> hasMultipleSelection [
	^ hasMultipleSelection ifNil: [ false ]
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> hasMultipleSelection: aBoolean [
	hasMultipleSelection := aBoolean
]

{ #category : #initialization }
GtPhlowListingViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource ifNil: [
		self phlowDataSource: (anInspector 
			getDeclarativeViewFor: self methodSelector) ]
]

{ #category : #accessing }
GtPhlowListingViewSpecification >> retrieveFormattedItems [
	^ self phlowDataSource 
		retrieveItems: self totalItemsCount fromIndex: 1
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
GtPhlowListingViewSpecification >> retrieveSentItemAt: aSelectionIndex [
	^ self phlowDataSource retrieveSentItemAt: aSelectionIndex
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> retrieveSentItemAtPhlowSelection: aPhlowSelection [
	^ self phlowDataSource 
			retrieveSentItemAtPhlowSelection: aPhlowSelection
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> retrieveTotalItemsCount [
	^ self phlowDataSource retrieveTotalItemsCount
]

{ #category : #'api - accessing' }
GtPhlowListingViewSpecification >> retriveContextActionSpecificationsForPhlowSelection: aPhlowSelection [
	^ self phlowDataSource 
		retriveContextActionSpecificationsForPhlowSelection: aPhlowSelection
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
