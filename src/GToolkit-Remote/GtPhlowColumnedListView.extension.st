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
		columnWidths: (columns collect: [ :each | each resizer ifNotNil: [ :resizer |
				resizer isExact
					ifTrue: [resizer size]
					ifFalse: [nil]]] as: Array);
		dataTransport: GtDeclarativeView dataIncluded.
]
