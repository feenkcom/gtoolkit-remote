Extension { #name : #GtPhlowViewWithError }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewWithError >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."
	| viewSpecification |

	viewSpecification := GtPhlowViewErrorViewSpecification new
		errorMessage: self error printString;
		dataTransport: GtPhlowViewSpecification dataIncluded.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowViewWithError >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
