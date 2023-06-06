"
GtDeclarativeTestInspectable is a simple object that can be used to test the Gt declarative views. 

 
## Internal Representation and Key Implementation Points.

### Instance Variables

	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view


"
Class {
	#name : #GtRemotePhlowDeclarativeTestInspectable,
	#superclass : #Object,
	#instVars : [
		'string',
		'collectionOfObjects'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> collectionAt: anIndex put: anObject [

	^collectionOfObjects at: anIndex put: anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects: anObject [
	collectionOfObjects := anObject
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Lowercase' text: [ :anObject | anObject asString asLowercase ] width: 100.
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListSpawnTextFor: aView [
	<gtView>

	^aView columnedList
		title: 'Spawn text columned list';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Class' 
			text: [ :anObject | anObject class name ] 
			spawn: [ :anObject | anObject class ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListWithHorizontalScrollingFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned list with scrolling' ;
		priority: 23;
		items: [ 1 to: 500 ];
		withHorizontalScrolling;
		column: 'Value' text: [ :anInteger | anInteger ] width: 250;
		column: 'Value + 1' text: [ :anInteger | anInteger + 1 ] width: 250;
		column: 'Value + 2' text: [ :anInteger | anInteger + 2 ] width: 250;
		column: 'Value + 3' text: [ :anInteger | anInteger + 3 ] width: 250;
		column: 'Value + 4' text: [ :anInteger | anInteger + 4 ] width: 250.
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedTreeFor: aView [
	<gtView>

	^aView columnedTree
		title: 'Columned Tree';
		priority: 35;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtForwardListFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List';
		priority: 45;
		object: [ self ];
		view: #gtListFor:
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtForwardListTwiceFor: aView [
	<gtView>

	^aView forward
		title: 'Forward List Twice';
		priority: 46;
		object: [ self ];
		view: #gtForwardListFor:
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtItemsWithBackgroundFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'background: usage';
		priority: 50;
		items: [ {
			'Bob' -> -43.
			'Alice' -> 27.
			'Mike' -> 0.
			'Jane' -> -32.
			'Ben' -> 12
		} ];
		column: 'name' text: [ :x | x key ];
		column: 'value' do: [ :aColumn |
			aColumn
				text: [ :x | x value ];
				background: [ :v |
					v > 0
						ifTrue: [ 
							GtPhlowColor named: #green alpha: 0.3 ]
						ifFalse: [ v < 0
							ifTrue: [ 
								GtPhlowColor named: #red alpha: 0.3 ]
							ifFalse: [ 
								GtPhlowColor named: #gray alpha: 0.3] ] ] ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large columned list' ;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Value * 10' text: [ :anObject | (anObject * 10) asString asLowercase ] width: 100.
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeColumnedListWithIndexFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large columned list with index';
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Index' text: [ :anObject  :anIndex | anIndex ];
		column: 'Value' text: [ :anObject | anObject ].
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeListFor: aView [
	<gtView>

	^aView list
		title: 'Large list';
		priority: 20;
		items: [ 1 to: 1022 ];
		itemText: [ :item | item  ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtStringFor: aView [
	<gtView>

	^aView textEditor
		title: 'String';
		priority: 10;
		text: [ self string ]
]

{ #category : #inspecting }
GtRemotePhlowDeclarativeTestInspectable >> gtTreeFor: aView [
	<gtView>

	^aView tree
		title: 'Tree';
		priority: 30;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number']
]

{ #category : #initialization }
GtRemotePhlowDeclarativeTestInspectable >> initialize [ 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:49.623384+02:00' readStream }.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> printStringFor: anObject [
	^ anObject printString
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> string [

	^string
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> string: anObject [
	string := anObject
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTestInspectable >> text [

	^string asRopedText 
]
