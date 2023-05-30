"
I support a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported
"
Class {
	#name : #GtRemotePhlowColumnedListView,
	#superclass : #GtRemotePhlowBasicColumnedListView,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowColumnedListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: (columns asArray collect: [ :aColumn | 
			| columnSpecification|
			columnSpecification := GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType asString;
				spawnsObjects: aColumn isSpawningObject.
			
			aColumn hasBackgroundComputation ifTrue: [ 
				columnSpecification  markAsHavingBackground ].
			columnSpecification ] ) ;
		dataTransport: GtPhlowViewSpecification dataLazy
]
