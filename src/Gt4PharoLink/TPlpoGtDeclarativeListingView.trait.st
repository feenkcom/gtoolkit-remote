Trait {
	#name : #TPlpoGtDeclarativeListingView,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
TPlpoGtDeclarativeListingView >> flushItemsIterator [

	^ self
		proxyPerform: #flushItemsIterator
]

{ #category : #accessing }
TPlpoGtDeclarativeListingView >> retrieveItems: anItemsCount fromIndex: anIndex [

	^ self evaluateSourceSequence: (String streamContents: [ :stream | 
		stream
			<< 'PharoLinkAnswerByValue setByValueOnly.'; lf;
			<< 'self retrieveItems: ';
			print: anItemsCount;
			<< ' fromIndex: ';
			print: anIndex ]).
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
