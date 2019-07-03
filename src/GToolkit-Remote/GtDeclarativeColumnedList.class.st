"
GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

- Selecting an item simply shows the display data
- Only matchParent and fixed column widths are supported

!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	columnTitles:		<Array of String>
	columnWidths:		<Array of Integer|nil>
	items:		<Array of Array>

"
Class {
	#name : #GtDeclarativeColumnedList,
	#superclass : #GtDeclarativeView,
	#instVars : [
		'items',
		'columnTitles',
		'columnWidths'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #'instance creation' }
GtDeclarativeColumnedList class >> fromJSONDictionary: aDictionary [

	^(super fromJSONDictionary: aDictionary)
		items: (aDictionary at: #items);
		columnTitles: (aDictionary at: #columnTitles);
		columnWidths: (aDictionary at: #columnWidths);
		yourself
]

{ #category : #converting }
GtDeclarativeColumnedList >> asDictionaryForExport [ 

	^super asDictionaryForExport 
		at: #items put: items;
		at: #columnTitles put: columnTitles;
		at: #columnWidths put: columnWidths;
		yourself
]

{ #category : #accessing }
GtDeclarativeColumnedList >> columnTitles [
	^ columnTitles
]

{ #category : #accessing }
GtDeclarativeColumnedList >> columnTitles: anObject [
	columnTitles := anObject
]

{ #category : #accessing }
GtDeclarativeColumnedList >> columnWidths [
	^ columnWidths
]

{ #category : #accessing }
GtDeclarativeColumnedList >> columnWidths: anObject [
	columnWidths := anObject
]

{ #category : #accessing }
GtDeclarativeColumnedList >> items [
	^ items
]

{ #category : #accessing }
GtDeclarativeColumnedList >> items: anObject [
	items := anObject
]

{ #category : #'building - graph' }
GtDeclarativeColumnedList >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list column |

	list := aView columnedList 
		title: title;
		priority: priority;
		items: [ self items ].
	columnTitles withIndexDo: [ :cTitle :index |
		column := list column.
		column 
			title: cTitle;
			item: [ :anArray | anArray at: index ].
		(columnWidths at: index) ifNotNil: [ :width |
			column width: width ] ].
	list
		send: [ :arg :event | accessor viewItemAt: event selection from ].
	^list
]
