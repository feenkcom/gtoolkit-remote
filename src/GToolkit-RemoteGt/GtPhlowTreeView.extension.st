Extension { #name : #GtPhlowTreeView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView."
	| declarativeExpander viewSpecification |

	declarativeExpander := expander ifNotNil: [ :anExpander | 
		anExpander asDeclarativeExpander ].
	viewSpecification := GtPhlowTreeViewSpecification new
		phlowDataSource: ((GtRemotePhlowDeclarativeViewTreeDataSource forPhlowView: self)
			expander: declarativeExpander);
		expander: declarativeExpander;
		dataTransport: GtPhlowViewSpecification dataLazy.
		
	self configureGenericViewSpecificationOn: viewSpecification.
	
	viewSpecification hasMultipleSelection: self hasMultipleSelection.
	viewSpecification hasContextActionSpecifications: self contextMenuActions notEmpty.
	
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
