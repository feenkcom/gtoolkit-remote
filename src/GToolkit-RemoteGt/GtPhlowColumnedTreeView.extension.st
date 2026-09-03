Extension { #name : #GtPhlowColumnedTreeView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."
	| viewSpecification |

	viewSpecification := GtPhlowColumnedTreeViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedTreeDataSource
			forPhlowView: self);
		"expander: expander;"
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	viewSpecification columnSpecifications: self buildRemoteColumnsSpecifications.
	^ viewSpecification
]
