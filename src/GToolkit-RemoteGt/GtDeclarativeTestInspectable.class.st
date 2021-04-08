"
GtDeclarativeTestInspectable is a simple object that can be used to test the Gt declarative views. 

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view

"
Class {
	#name : #GtDeclarativeTestInspectable,
	#superclass : #Object,
	#instVars : [
		'string',
		'collectionOfObjects'
	],
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
GtDeclarativeTestInspectable >> collectionAt: anIndex put: anObject [

	^collectionOfObjects at: anIndex put: anObject
]

{ #category : #accessing }
GtDeclarativeTestInspectable >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : #accessing }
GtDeclarativeTestInspectable >> collectionOfObjects: anObject [
	collectionOfObjects := anObject
]

{ #category : #inspecting }
GtDeclarativeTestInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned List' translated;
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' item: [ :anObject | anObject asString ];
		column: 'Lowercase' item: [ :anObject | anObject asString asLowercase ] width: 100.
]

{ #category : #inspecting }
GtDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List' translated;
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ]
]

{ #category : #inspecting }
GtDeclarativeTestInspectable >> gtStringFor: aView [
	<gtView>

	^aView textEditor
		title: 'String' translated;
		priority: 10;
		text: [ self string ]
]

{ #category : #initialization }
GtDeclarativeTestInspectable >> initialize [ 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:49.623384+02:00' readStream. }.
]

{ #category : #accessing }
GtDeclarativeTestInspectable >> string [

	^string
]

{ #category : #accessing }
GtDeclarativeTestInspectable >> string: anObject [
	string := anObject
]

{ #category : #accessing }
GtDeclarativeTestInspectable >> text [

	^string asRopedText 
]
