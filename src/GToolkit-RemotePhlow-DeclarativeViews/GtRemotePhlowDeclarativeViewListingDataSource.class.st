Class {
	#name : 'GtRemotePhlowDeclarativeViewListingDataSource',
	#superclass : 'GtRemotePhlowDeclarativeViewDataSource',
	#instVars : [
		'itemsIterator'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewListingDataSource >> formatItem: anObject atIndex: anIndex [
	self subclassResponsibility
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeViewListingDataSource >> itemsIterator [
	^ itemsIterator ifNil: [ 
		itemsIterator := self phlowView itemsProviderBuilder value ]
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveItems: anItemsCount fromIndex: startIndex [
	| formatterValues endIndex |

	formatterValues := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self itemsIterator 
		forElementsFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :anObject :anItemIndex |
			formatterValues add: (self 
				formatItem: anObject atIndex: anItemIndex)].
	^ formatterValues asArray
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retrieveTotalItemsCount [
	^ self itemsIterator totalItemsCount
]

{ #category : 'api' }
GtRemotePhlowDeclarativeViewListingDataSource >> retriveSentItemAt: aSelectionIndex [
	"Answer the raw value at the supplied index"
	
	self itemsIterator 
		forElementsFrom: aSelectionIndex 
		to: aSelectionIndex 
		withIndexDo: [ :anObject :anItemIndex |
			^ self phlowView transformation 
				transformedValueFrom: anObject
				selection: aSelectionIndex ].
	^ nil
]
