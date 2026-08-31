Extension { #name : #GtPhlowDetailsViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> viewFor: aView [
	| currentView |
	
	currentView := aView details.
	currentView title: title.
	currentView priority: priority.
	currentView phlowViewSpecification: self.
	
	rowSpecifications do: [ :aRowSpecification |
		currentView
			row: aRowSpecification name
			value: [ aRowSpecification ]
			text: [ :eachValue |
				self retrieveRowTextAt: aRowSpecification index ] ].
	
	currentView localSend: [ :aPhlowRow :aRowSpecification |
		self retrieveRowNodeRawValueAtRowIndex: aRowSpecification index].

	self configureViewActionsFor: currentView.
	
	^ currentView
]
