Extension { #name : #GtPhlowActionWithError }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowActionWithError >> asGtDeclarativeAction [
	^ GtPhlowErrorActionSpecification new
		priority: self priority;
		errorMessage: self error description;
		id: self id
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowActionWithError >> canBeGtDeclarativeAction [
	^ true
]
