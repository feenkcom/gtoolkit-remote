Extension { #name : #GtPhlowTextViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextViewSpecification >> configureForLazyDataView: aTextView [
	aTextView text: [ 
		(GtRemotePhlowStylableText 
			fromJSONDictionary: self getText) createStyledText ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextViewSpecification >> viewFor: aView [
	| currentView |
	"Answer the GtPhlowView for the receiver"

	currentView := aView text 
		title: title;
		priority: priority;
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				aTab viewContentElement phlow update ].
	
	self configureForLazyDataView: currentView .
		
	^ currentView
]
