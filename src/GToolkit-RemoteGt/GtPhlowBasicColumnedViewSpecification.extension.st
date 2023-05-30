Extension { #name : #GtPhlowBasicColumnedViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> configureColumn: column fromSpecification: aColumnSpecification withIndex: aColumnIndex [
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
GtPhlowBasicColumnedViewSpecification >> configureColumnedViewFor: aColumnedView [

	aColumnedView 
		title: title;
		priority: priority;
		"items: [  (GtRemoteInspectorListingBufferedStream 
			declarativeView: self) collect: [ :cellValuesDictionary |
				cellValuesDictionary collect: [ :aCellValueDictionary |
					GtRemotePhlowItemValue 
						fromJSONDictionary: aCellValueDictionary ] ] ];"
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				phlowDataSource flushItemsIterator.
				aTab viewContentElement phlow update ].

	columnSpecifications
		withIndexDo: [ :aColumnSpecification :aColumnIndex | 
			| column |
			column := aColumnedView column.
			self
				configureColumn: column
				fromSpecification: aColumnSpecification
				withIndex: aColumnIndex ].
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| currentView |
	
	currentView := aView columnedList
		items: [  (GtRemoteInspectorListingBufferedStream 
			declarativeView: self) collect: [ :cellValuesDictionary |
				cellValuesDictionary collect: [ :aCellValueDictionary |
					GtRemotePhlowItemValue 
						fromJSONDictionary: aCellValueDictionary ] ] ].
	
	self configureColumnedViewFor: currentView.
	
	currentView send: [ :arg :selection | self retriveSentItemAt: selection first ].
	^ currentView
]
