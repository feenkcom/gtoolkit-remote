"
GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

- Only matchParent and fixed column widths are supported

1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables

	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send


"
Class {
	#name : 'GtPhlowDeclarativeColumnedListView',
	#superclass : 'GtPhlowDeclarativeListingView',
	#instVars : [
		'columnTitles',
		'columnWidths',
		'columnTypes',
		'columnSpawnsObjects'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'instance creation' }
GtPhlowDeclarativeColumnedListView class >> fromJSONDictionary: aDictionary [

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnTitles: (aDictionary at: #columnTitles);
		columnWidths: (aDictionary at: #columnWidths);
		columnTypes: (aDictionary at: #columnTypes);
		columnSpawnsObjects: (aDictionary at: #columnSpawnsObjects).
	"list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ]."
	^list
]

{ #category : 'converting' }
GtPhlowDeclarativeColumnedListView >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnTitles put: columnTitles;
		at: #columnWidths put: columnWidths;
		at: #columnTypes put: columnTypes;
		at: #columnSpawnsObjects put: columnSpawnsObjects;
		yourself.
	"self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: items ]."
	^dictionary
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnSpawnsObjects [

	^ columnSpawnsObjects
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnSpawnsObjects: anObject [

	columnSpawnsObjects := anObject
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnTitles [
	^ columnTitles
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnTitles: anObject [
	columnTitles := anObject
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnTypes [
	^ columnTypes
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnTypes: anObject [
	columnTypes := anObject
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnWidths [
	^ columnWidths
]

{ #category : 'accessing' }
GtPhlowDeclarativeColumnedListView >> columnWidths: anObject [
	columnWidths := anObject
]

{ #category : 'api - accessing' }
GtPhlowDeclarativeColumnedListView >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [	
	^ self phlowDataSource retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex
]
