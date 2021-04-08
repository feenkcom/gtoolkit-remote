"
GtDeclarativeTestInspectable is a simple object that can be used to test the Gt declarative views. 

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view

"
Class {
	#name : #GtPharoDeclarativeTestInspectable,
	#superclass : #Object,
	#instVars : [
		'string',
		'collectionOfObjects'
	],
	#category : #'GToolkit-RemotePharo-Examples'
}

{ #category : #accessing }
GtPharoDeclarativeTestInspectable >> collectionAt: anIndex put: anObject [

	^collectionOfObjects at: anIndex put: anObject
]

{ #category : #accessing }
GtPharoDeclarativeTestInspectable >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : #accessing }
GtPharoDeclarativeTestInspectable >> collectionOfObjects: anObject [
	collectionOfObjects := anObject
]

{ #category : #inspecting }
GtPharoDeclarativeTestInspectable >> gtColumnedListFor: aView [
	<gtView>

	^aView columnedList
		title: 'Columned List' translated;
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' item: [ :anObject | anObject asString ];
		column: 'Lowercase' item: [ :anObject | anObject asString asLowercase ] width: 100.
]

{ #category : #inspecting }
GtPharoDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List' translated;
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ]
]

{ #category : #inspecting }
GtPharoDeclarativeTestInspectable >> gtStringFor: aView [
	<gtView>

	^aView textEditor
		title: 'String' translated;
		priority: 10;
		text: [ self string ]
]

{ #category : #initialization }
GtPharoDeclarativeTestInspectable >> initialize [ 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:49.623384+02:00' readStream. }.
]

{ #category : #accessing }
GtPharoDeclarativeTestInspectable >> string [

	^string
]

{ #category : #accessing }
GtPharoDeclarativeTestInspectable >> string: anObject [
	string := anObject
]

{ #category : #accessing }
GtPharoDeclarativeTestInspectable >> text [

	^string asRopedText 
]
