Extension { #name : #GtPhlowDetailsViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> viewFor: aView [
	| currentView |
	
	currentView := aView details.
	currentView title: title.
	currentView priority: priority.
	
	rowSpecifications doWithIndex: [ :eachRow :index |
		currentView
			row: eachRow name
			value: [ self retrieveRowValueAt: index ]
			text: [ :eachValue | self retrieveRowTextAt: index ] ].
	
	^ currentView
]
