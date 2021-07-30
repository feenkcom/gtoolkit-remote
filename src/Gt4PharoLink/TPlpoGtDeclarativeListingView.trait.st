Trait {
	#name : #TPlpoGtDeclarativeListingView,
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
TPlpoGtDeclarativeListingView >> retrieveItems: anItemsCount fromIndex: anIndex [
	^ self
		proxyPerform: #retrieveItems:fromIndex:
		withPrimitiveArguments: { anItemsCount . anIndex  }
]

{ #category : #accessing }
TPlpoGtDeclarativeListingView >> retrieveTotalItemsCount [
	^ self
		proxyPerform: #retrieveTotalItemsCount
]

{ #category : #accessing }
TPlpoGtDeclarativeListingView >> retriveSentItemAt: aSelectionIndex [ 
	^ self
		proxyPerform: #retriveSentItemAt:
		withPrimitiveArguments: { aSelectionIndex }
]
