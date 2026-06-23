Class {
	#name : #GtRemotePhlowDetailsView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'rows'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowDetailsView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"
	| rowSpecifications |
	
	rowSpecifications := OrderedCollection new.
	self phlowDetailRows withIndexDo:  [ :each :anIndex |
		rowSpecifications add: (GtRemotePhlowDetailsRowSpecification 
			fromPhlowRow: each withIndex: anIndex) ].
	
	^ GtPhlowDetailsViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewDetailsDataSource 
			forPhlowView: self);
		rowSpecifications: rowSpecifications;
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #views }
GtRemotePhlowDetailsView >> gtRowsFor: aView [
	<gtView>
	rows ifNil: [^aView empty].
	^(aView columnedList)
		title: 'Rows';
		priority: 11;
		items: [rows];
		column: 'Name' text: [:each | each name ];
		column: 'Value' text: [:each | each valueComputation ];
		column: 'Text' text: [:each | each textComputation ]
]

{ #category : #initialization }
GtRemotePhlowDetailsView >> initialize [
	super initialize.
	
	rows := OrderedCollection new
]

{ #category : #'as yet unclassified' }
GtRemotePhlowDetailsView >> phlowDetailRows [
	^ rows
]

{ #category : #'api - scripting' }
GtRemotePhlowDetailsView >> row: aString value: aBlockClosure [
	rows add: (GtRemotePhlowDetailsRow new
		name: aString;
		valueComputation: aBlockClosure)
]

{ #category : #'api - scripting' }
GtRemotePhlowDetailsView >> row: aString value: aValueComputation text: aTextComputation [
	rows add: (GtRemotePhlowDetailsRow new
		name: aString;
		valueComputation: aValueComputation;
		textComputation: aTextComputation)
]
