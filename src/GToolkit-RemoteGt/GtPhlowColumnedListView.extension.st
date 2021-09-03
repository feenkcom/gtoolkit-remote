Extension { #name : 'GtPhlowColumnedListView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeColumnedListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnTitles: (columns collect: [ :each | each title ] as: Array);
		columnWidths: (columns collect: [ :each | each cellWidth ifNotNil: [ :cellWidth |
				cellWidth class = BrColumnFixedWidth
					ifTrue: [cellWidth width]
					ifFalse: [nil]]] as: Array);
		columnTypes: (self columns collect: [ :each | each asGtDeclarativeColumnDataType asString ]) asArray;
		columnSpawnsObjects: (self columns collect: [ :each | false ]) asArray;
		dataTransport: GtPhlowDeclarativeView dataLazy
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self columns allSatisfy: [ :aColumn | aColumn canBeForGtDeclarativeView ]
]
