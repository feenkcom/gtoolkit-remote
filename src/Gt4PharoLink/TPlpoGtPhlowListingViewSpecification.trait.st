Trait {
	#name : #TPlpoGtPhlowListingViewSpecification,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
TPlpoGtPhlowListingViewSpecification >> flushItemsIterator [

	^ self
		proxyPerform: #flushItemsIterator
]

{ #category : #accessing }
TPlpoGtPhlowListingViewSpecification >> retrieveItems: anItemsCount fromIndex: anIndex [

	^ self
		proxyPerformSerialized: #retrieveItems:fromIndex:
		withPrimitiveArguments: { anItemsCount . anIndex  }
]

{ #category : #accessing }
TPlpoGtPhlowListingViewSpecification >> retrieveTotalItemsCount [
	^ self
		proxyPerform: #retrieveTotalItemsCount
]

{ #category : #accessing }
TPlpoGtPhlowListingViewSpecification >> retriveSentItemAt: aSelectionIndex [ 
	^ self
		proxyPerform: #retriveSentItemAt:
		withPrimitiveArguments: { aSelectionIndex }
]
