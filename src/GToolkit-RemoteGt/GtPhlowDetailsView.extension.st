Extension { #name : #GtPhlowDetailsView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"
	| rowSpecifications |
	
	rowSpecifications := OrderedCollection new.
	self phlowDetailRows withIndexDo:  [ :each :anIndex |
		rowSpecifications add: (GtRemotePhlowDetailsRowSpecification 
			fromPhlowRow: each withIndex: anIndex) ].
	
	^ GtPhlowDetailsViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewDetailsDataSource 
			forPhlowView: self);
		rowSpecifications: rowSpecifications;
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowDetailsView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ true
]
