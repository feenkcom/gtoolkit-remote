"
GtDeclarativeTestInspectable is a simple object that can be used to test the Gt declarative views. 

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view

"
Class {
	#name : 'GtRemotePhlowDeclarativeTestInspectable',
	#superclass : 'Object',
	#instVars : [
		'string',
		'collectionOfObjects'
	],
	#category : 'GToolkit-RemotePhlow-Examples'
}

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTestInspectable >> collectionAt: anIndex put: anObject [

	^collectionOfObjects at: anIndex put: anObject
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTestInspectable >> collectionOfObjects: anObject [
	collectionOfObjects := anObject
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned List';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Lowercase' text: [ :anObject | anObject asString asLowercase ] width: 100.
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large Columned List' ;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Value * 10' text: [ :anObject | (anObject * 10) asString asLowercase ] width: 100.
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeColumnedListWithIndexFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large Columned List with Index';
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Index' text: [ :anObject  :anIndex | anIndex ];
		column: 'Value' text: [ :anObject | anObject ].
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtLargeListFor: aView [
	<gtView>

	^aView list
		title: 'Large List';
		priority: 20;
		items: [ 1 to: 1022 ];
		itemText: [ :item | item  ]
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item ]
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtStringFor: aView [
	<gtView>

	^aView textEditor
		title: 'String';
		priority: 10;
		text: [ self string ]
]

{ #category : 'initialization' }
GtRemotePhlowDeclarativeTestInspectable >> initialize [ 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime now. "readFrom: '2021-04-06T14:43:49.623384+02:00' readStream." }.
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTestInspectable >> string [

	^string
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTestInspectable >> string: anObject [
	string := anObject
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTestInspectable >> text [

	^string asRopedText 
]
