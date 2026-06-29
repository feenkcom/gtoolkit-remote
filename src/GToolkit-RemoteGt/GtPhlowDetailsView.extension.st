Extension { #name : #GtPhlowDetailsView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"
	| rowSpecifications viewSpecification |
	
	rowSpecifications := OrderedCollection new.
	self phlowDetailRows withIndexDo:  [ :each :anIndex |
		rowSpecifications add: (GtRemotePhlowDetailsRowSpecification
			fromPhlowRow: each withIndex: anIndex) ].
	
	viewSpecification := GtPhlowDetailsViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeViewDetailsDataSource
			forPhlowView: self);
		rowSpecifications: rowSpecifications;
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
