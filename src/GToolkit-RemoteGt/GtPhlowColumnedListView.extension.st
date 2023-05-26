Extension { #name : #GtPhlowColumnedListView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowColumnedListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: (columns collect: [ :aColumn | 
			GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: (aColumn cellWidth ifNotNil: [ :aCellWidth |
					aCellWidth class = BrColumnFixedWidth
						ifTrue: [aCellWidth width]
						ifFalse: [nil]]);
				type: aColumn asGtDeclarativeColumnDataType asString ;
				spawnsObjects:  false;
				in: [ :aColumnSpecification |
					aColumn hasBackgroundComputation ifTrue: [ 
						aColumnSpecification  markAsHavingBackground ].
					aColumnSpecification ] ] as: Array);
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self columns allSatisfy: [ :aColumn | aColumn canBeForGtDeclarativeView ]
]
