Extension { #name : #GtPhlowBasicColumnedViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBasicColumnedViewSpecification >> configureColumn: column fromSpecification: aColumnSpecification withIndex: aColumnIndex [
	column title: aColumnSpecification title.

	aColumnSpecification spawnsObjects
		ifTrue: [ aColumnSpecification type = #icon
				ifTrue: [ 
					column 
						iconName: [ :aColumnedNode | 
							(aColumnedNode columnValueAt: aColumnIndex) itemText ] ]
				ifFalse: [ column
						text: [ :aColumnedNode | 
							(aColumnedNode columnValueAt: aColumnIndex) itemText ]
						spawn: [ :anArray :aRowIndex | 
							self retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex ] ] ]
		ifFalse: [ aColumnSpecification type = #icon
				ifTrue: [ 
					column iconName: [ :aColumnedNode | 
						(aColumnedNode columnValueAt: aColumnIndex) itemText ] ]
				ifFalse: [ 
					column text: [ :aColumnedNode | 
						(aColumnedNode columnValueAt: aColumnIndex) itemText ] ] ].

	aColumnSpecification hasBackground ifTrue: [
		column background: [ :aText :aColumnedNode | 
			(aColumnedNode columnValueAt: aColumnIndex) background ] ].
	
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
GtPhlowBasicColumnedViewSpecification >> instantiateNodeFrom: aNodeValueDictionary [
	^ GtRemotePhlowColumnedTreeNode fromJSONDictionary: aNodeValueDictionary 
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
