"
GtDeclarativeTestInspectable is a simple object that can be used to test the Gt declarative views. 

 
1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables


	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view


"
Class {
	#name : 'GtDeclarativeTestInspectable',
	#superclass : 'Object',
	#instVars : [
		'string',
		'collectionOfObjects'
	],
	#category : 'GToolkit-RemoteGt-Examples'
}

{ #category : 'accessing' }
GtDeclarativeTestInspectable >> collectionAt: anIndex put: anObject [

	^collectionOfObjects at: anIndex put: anObject
]

{ #category : 'accessing' }
GtDeclarativeTestInspectable >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : 'accessing' }
GtDeclarativeTestInspectable >> collectionOfObjects: anObject [
	collectionOfObjects := anObject
]

{ #category : 'inspecting' }
GtDeclarativeTestInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned List' translated;
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' item: [ :anObject | anObject asString ];
		column: 'Lowercase' item: [ :anObject | anObject asString asLowercase ] width: 100.
]

{ #category : 'inspecting' }
GtDeclarativeTestInspectable >> gtLargeColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large Columned List' translated;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Value' item: [ :anObject | anObject asString ];
		column: 'Value * 10' item: [ :anObject | (anObject * 10) asString asLowercase ] width: 100.
]

{ #category : 'inspecting' }
GtDeclarativeTestInspectable >> gtLargeColumnedListWithIndexFor: aView [
	<gtView>

	^aView columnedList
		title: 'Large Columned List with Index' translated;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Index' item: [ :anObject  :anIndex | anIndex ];
		column: 'Value' item: [ :anObject | anObject * 10 ].
]

{ #category : 'inspecting' }
GtDeclarativeTestInspectable >> gtLargeListFor: aView [
	<gtView>

	^aView list
		title: 'Large List' translated;
		priority: 20;
		items: [ 1 to: 1022 ];
		itemText: [ :item | item asString ]
]

{ #category : 'inspecting' }
GtDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List' translated;
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ]
]

{ #category : 'inspecting' }
GtDeclarativeTestInspectable >> gtStringFor: aView [
	<gtView>

	^aView textEditor
		title: 'String' translated;
		priority: 10;
		text: [ self string ]
]

{ #category : 'initialization' }
GtDeclarativeTestInspectable >> initialize [ 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:49.623384+02:00' readStream. }.
]

{ #category : 'accessing' }
GtDeclarativeTestInspectable >> string [

	^string
]

{ #category : 'accessing' }
GtDeclarativeTestInspectable >> string: anObject [
	string := anObject
]

{ #category : 'accessing' }
GtDeclarativeTestInspectable >> text [

	^string asRopedText 
]
