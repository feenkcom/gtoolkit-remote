Extension { #name : 'GtPhlowColumnedListView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeColumnedListView new 
		phlowDataSource: (GtPhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnTitles: (columns collect: [ :each | each title ] as: Array);
		columnWidths: (columns collect: [ :each | each cellWidth ifNotNil: [ :cellWidth |
				cellWidth class = BrColumnFixedWidth
					ifTrue: [cellWidth width]
					ifFalse: [nil]]] as: Array);
		dataTransport: GtDeclarativeView dataLazy
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
