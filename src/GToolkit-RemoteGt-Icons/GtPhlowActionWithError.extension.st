Extension { #name : #GtPhlowActionWithError }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowActionWithError >> asGtDeclarativeAction [
	^ GtPhlowErrorActionSpecification new
		priority: self priority;
		errorMessage: self error description
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowActionWithError >> canBeGtDeclarativeAction [
	^ true
]
