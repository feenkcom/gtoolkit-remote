Extension { #name : #GtPhlowColumnedListView }

{ #category : #'*GToolkit-Remote' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeColumnedList new 
		title: self title;
		priority: self priority;
		items: (self itemsBuilder value withIndexCollect: [ :row :index | 
			columns collect: [ :column | 
				(column rowStencil 
					cull: (column itemComputation phlowValue: row  withEnoughArguments: { row . index })
					cull: column) gtDisplayString ] as: Array ]) asArray;
		columnTitles: (columns collect: [ :each | each title ] as: Array);
		columnWidths: (columns collect: [ :each | each cellWidth ifNotNil: [ :cellWidth |
				cellWidth class = BrColumnFixedWidth
					ifTrue: [cellWidth width]
					ifFalse: [nil]]] as: Array);
		dataTransport: GtDeclarativeView dataIncluded.
]

{ #category : #'*GToolkit-Remote' }
GtPhlowColumnedListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
