Extension { #name : #GtPhlowDetailsViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	aView
		actionButtonIcon: BrGlamorousVectorIcons refresh
		id: GtPhlowViewRefreshContentButtonId
		tooltip: 'Update'
		action: [ :aButton :aTab |
				self flushCachedData.
				aTab phlow fireViewUpdateWish ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsViewSpecification >> viewFor: aView [
	| currentView |
	
	currentView := aView details.
	currentView title: title.
	currentView priority: priority.
	
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
