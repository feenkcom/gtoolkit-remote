Extension { #name : #GtPhlowColumnedListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	| viewSpecification |
	viewSpecification := GtPhlowColumnedListViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource
			forPhlowView: self);
		horizontalScrollingEnabled: horizontalScrollingEnabled;
		dataTransport: GtPhlowViewSpecification dataLazy.
		
	self configureGenericViewSpecificationOn: viewSpecification.
	
	viewSpecification columnSpecifications: self buildRemoteColumnsSpecifications.
	viewSpecification hasMultipleSelection: self hasMultipleSelection.
	viewSpecification hasContextActionSpecifications: self contextMenuActions notEmpty.
	
	^ viewSpecification
]
