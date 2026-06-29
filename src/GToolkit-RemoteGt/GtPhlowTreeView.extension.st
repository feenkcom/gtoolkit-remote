Extension { #name : #GtPhlowTreeView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."
	| viewSpecification |

	viewSpecification := GtPhlowTreeViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeViewTreeDataSource
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
