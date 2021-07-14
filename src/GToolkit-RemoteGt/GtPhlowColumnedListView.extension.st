Extension { #name : 'GtPhlowColumnedListView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeColumnedList new 
		title: self title;
		priority: self priority;
		items: (self itemsBuilder value withIndexCollect: [ :row :rowIndex | 
			(columns withIndexCollect: [ :column :columnIndex | 
				(column rowStencil ifNil: 
					[ column itemComputation 
						phlowValue: row 
						withEnoughArguments: { row. rowIndex. columnIndex. nil. self. } ]
				ifNotNil: [ :rowStencil |
					rowStencil
						cull: (column itemComputation phlowValue: row  withEnoughArguments: { row . rowIndex })
						cull: column ]) gtDisplayString ]) asArray ]) asArray;
		columnTitles: (columns collect: [ :each | each title ] as: Array);
		columnWidths: (columns collect: [ :each | each cellWidth ifNotNil: [ :cellWidth |
				cellWidth class = BrColumnFixedWidth
					ifTrue: [cellWidth width]
					ifFalse: [nil]]] as: Array);
		dataTransport: GtDeclarativeView dataIncluded.
]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowColumnedListView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^true
]
