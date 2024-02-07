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
		priority: priority.
	
	self configureForLazyDataView: currentView .
		
	^ currentView
]
