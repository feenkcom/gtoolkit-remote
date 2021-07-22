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
		title: 'Columned List' translated;
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' item: [ :anObject | anObject asString ];
		column: 'Lowercase' item: [ :anObject | anObject asString asLowercase ] width: 100.
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtListFor: aView [
	<gtView>

	^aView list
		title: 'List' translated;
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ]
]

{ #category : 'inspecting' }
GtRemotePhlowDeclarativeTestInspectable >> gtStringFor: aView [
	<gtView>

	^aView textEditor
		title: 'String' translated;
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
		DateAndTime readFrom: '2021-04-06T14:43:49.623384+02:00' readStream. }.
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
