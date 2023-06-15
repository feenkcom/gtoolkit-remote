Extension { #name : #GtPhlowViewWithError }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewWithError >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."

	^GtPhlowViewErrorViewSpecification new 
		title: self title;
		priority: self priority;
		errorMessage: self error printString;
		dataTransport: GtPhlowViewSpecification dataIncluded.
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewWithError >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
