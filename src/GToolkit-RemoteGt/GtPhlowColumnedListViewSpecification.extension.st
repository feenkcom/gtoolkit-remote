Extension { #name : #GtPhlowColumnedListViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> configureColumn: column fromSpecification: aColumnSpecification withIndex: aColumnIndex [
	column title: aColumnSpecification title.

	aColumnSpecification spawnsObjects
		ifTrue: [ aColumnSpecification type = #icon
				ifTrue: [ 
					column 
						iconName: [ :rowData | 
							(rowData at: aColumnIndex) itemText ] ]
				ifFalse: [ column
						text: [ :rowData | 
							(rowData at: aColumnIndex) itemText ]
						spawn: [ :anArray :aRowIndex | 
							self retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex ] ] ]
		ifFalse: [ aColumnSpecification type = #icon
				ifTrue: [ 
					column iconName: [ :anArray | (anArray at: aColumnIndex) itemText ] ]
				ifFalse: [ 
					column text: [ :anArray | (anArray at: aColumnIndex) itemText ] ] ].

	aColumnSpecification hasBackground ifTrue: [
		column background: [ :aText :anArray | 
			(anArray at: aColumnIndex) background ] ].
	
	^ aColumnSpecification cellWidth ifNotNil: [ :aWidth | column width: aWidth ]
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColumnedListViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| list |
	
	list := aView columnedList
			title: title;
			priority: priority;
			items: [  (GtRemoteInspectorListingBufferedStream 
				declarativeView: self) collect: [ :cellValuesDictionary |
					cellValuesDictionary collect: [ :aCellValueDictionary |
						GtRemotePhlowItemValue fromJSONDictionary: aCellValueDictionary ] ] ];
			actionButtonIcon: BrGlamorousVectorIcons refresh
				tooltip: 'Update'
				action: [ :aButton :aTab | 
					phlowDataSource flushItemsIterator.
					aTab viewContentElement phlow update ].
	columnSpecifications
		withIndexDo: [ :aColumnSpecification :aColumnIndex | 
			| column |
			column := list column.
			self
				configureColumn: column
				fromSpecification: aColumnSpecification
				withIndex: aColumnIndex ].
	
	list send: [ :arg :selection | self retriveSentItemAt: selection first ].
	^ list
]
