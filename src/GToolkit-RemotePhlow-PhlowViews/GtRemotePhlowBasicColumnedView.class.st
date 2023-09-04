"
I provide functionality for working with columns.
"
Class {
	#name : #GtRemotePhlowBasicColumnedView,
	#superclass : #GtRemotePhlowListingView,
	#instVars : [
		'columns'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowBasicColumnedView >> column [
	<return: #GtRemotePhlowExplicitColumn>
	
	^ self explicitColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString do: aBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: aTitleString.
	aBlock value: aColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString iconName: anIconNameComputation [
	self column: aTitleString iconNameDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			iconName: anIconNameComputation ]
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString iconName: anIconNameComputation width: aNumber [
	self column: aTitleString iconNameDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			iconName: anIconNameComputation;
			width: aNumber ]
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitle iconNameDo: aBlock [
	aBlock value: (self iconNameColumn title: aTitle)
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString item: anItemComputation text: aBlock [	
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: anItemComputation;
			format: aBlock ]
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitle number: aBlock [
	self numberColumn
		title: aTitle;
		item: aBlock
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitle number: aBlock format: aFormatBlock [
	self numberColumn
		title: aTitle;
		item: aBlock;
		format: aFormatBlock
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitle numberDo: aBlock [
	aBlock value: (self numberColumn title: aTitle)
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString text: aBlock [	
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			format: aBlock ]
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: columnName text: aBlockClosure spawn: aSpawnBlock [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure spawn: aSpawnBlock.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil [
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure spawn: aSpawnBlock.
	aColumn width: aNumberOrNil.
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString text: aBlock weight: aNumber [
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			format: aBlock;
			weight: aNumber ]
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString text: aBlock width: aNumber [
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			format: aBlock;
			width: aNumber ]
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> column: aTitleString textDo: aBlock [
	aBlock value: (self textColumn title: aTitleString)
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> columnOfType: aColumnClass [
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := aColumnClass new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
]

{ #category : #accessing }
GtRemotePhlowBasicColumnedView >> columns [
	^ columns ifNil: [
		columns := OrderedCollection new ]
]

{ #category : #accessing }
GtRemotePhlowBasicColumnedView >> configureColumnsSpecificationOn: aViewSpecification [
	aViewSpecification
		columnSpecifications: (columns asArray collect: [ :aColumn | 
			| columnSpecification|
			columnSpecification := GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType;
				spawnsObjects: aColumn isSpawningObject.
			
			aColumn hasBackgroundComputation ifTrue: [ 
				columnSpecification  markAsHavingBackground ].
			columnSpecification ] )
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> explicitColumn [
	<return: #GtRemotePhlowExplicitColumn>

	^ self columnOfType: GtRemotePhlowExplicitColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> iconNameColumn [
	<return: #GtRemotePhlowThemeIconNameColumn>

	^ self columnOfType: GtRemotePhlowThemeIconNameColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> numberColumn [
	<return: #GtRemotePhlowNumberColumn>

	^ self columnOfType: GtRemotePhlowNumberColumn
]

{ #category : #'api - scripting column' }
GtRemotePhlowBasicColumnedView >> textColumn [
	<return: #GtRemotePhlowTextColumn>

	^ self columnOfType: GtRemotePhlowTextColumn
]
