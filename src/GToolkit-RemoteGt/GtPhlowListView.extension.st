Extension { #name : #GtPhlowListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"
	| viewSpecification |

	viewSpecification := GtPhlowListViewSpecification new
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
	self configureGenericViewSpecificationOn: viewSpecification.
	^ viewSpecification
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListView >> asRemotePhlowDeclarativeListingType [
	^ [ itemDataBinder asRemotePhlowDeclarativeListingType ]
		on: MessageNotUnderstood
		do: [ :anError | GtPhlowDeclarativeListingType unknown ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self asRemotePhlowDeclarativeListingType isUnknown not
]
