Extension { #name : #GtPhlowDetailsViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> viewFor: aView [
	| currentView |
	
	currentView := aView details.
	currentView title: title.
	currentView priority: priority.
	
	rowSpecifications do: [ :eachRow |
		currentView
			row: eachRow name
			value: [ self retrieveRowValueAt: eachRow index ]
			text: [ :eachValue | self retrieveRowTextAt: eachRow index ] ].
	
	^ currentView
]
