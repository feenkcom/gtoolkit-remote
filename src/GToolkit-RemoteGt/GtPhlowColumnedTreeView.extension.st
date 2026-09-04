Extension { #name : #GtPhlowColumnedTreeView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."
	| declarativeExpander viewSpecification |

	declarativeExpander := expander ifNotNil: [ :anExpander | 
		anExpander asDeclarativeExpander ].
	viewSpecification := GtPhlowColumnedTreeViewSpecification new
		phlowDataSource: ((GtRemotePhlowDeclarativeViewColumnedTreeDataSource forPhlowView: self)
			expander: declarativeExpander);
		expander: declarativeExpander;
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	viewSpecification columnSpecifications: self buildRemoteColumnsSpecifications.
	^ viewSpecification
]
