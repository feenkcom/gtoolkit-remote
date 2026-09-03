Extension { #name : #GtPhlowDetailsViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> configureRowSpecificationsFor: aView [
	rowSpecifications do: [ :aRowSpecification |
		aView
			row: aRowSpecification name
			value: [ aRowSpecification ]
			text: [ :eachValue |
				self retrieveRowTextAt: aRowSpecification index ] ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> viewFor: aView [
	| currentView |
	
	currentView := aView details.
	
	self configureBasicLocalView: currentView for: aView.
	self configureRowSpecificationsFor: aView.
	self configureViewActionsFor: currentView.
	
	currentView localSend: [ :aPhlowRow :aRowSpecification |
		self retrieveRowNodeRawValueAtRowIndex: aRowSpecification index].
	
	^ currentView
]
