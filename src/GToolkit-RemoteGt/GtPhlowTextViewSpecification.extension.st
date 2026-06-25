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
			id: GtPhlowViewRefreshContentButtonId
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				aTab phlow fireViewUpdateWish ].
	
	self configureForLazyDataView: currentView .
		
	^ currentView
]
