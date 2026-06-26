Extension { #name : #GtPhlowDetailsViewSpecification }

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
		
	currentView
		actionButtonIcon: BrGlamorousVectorIcons refresh
			id: GtPhlowViewRefreshContentButtonId
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				self flushCachedData.
				aTab phlow fireViewUpdateWish ].
	
	^ currentView
]
