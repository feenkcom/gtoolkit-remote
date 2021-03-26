"
GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

- Only matchParent and fixed column widths are supported

!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send

"
Class {
	#name : #GtPharoDeclarativeColumnedList,
	#superclass : #GtPharoDeclarativeView,
	#instVars : [
		'items',
		'columnTitles',
		'columnWidths'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoDeclarativeColumnedList class >> fromJSONDictionary: aDictionary [

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnTitles: (aDictionary at: #columnTitles);
		columnWidths: (aDictionary at: #columnWidths).
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : #converting }
GtPharoDeclarativeColumnedList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnTitles put: columnTitles;
		at: #columnWidths put: columnWidths;
		yourself.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: items ].
	^dictionary
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnTitles [
	^ columnTitles
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnTitles: anObject [
	columnTitles := anObject
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnWidths [
	^ columnWidths
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> columnWidths: anObject [
	columnWidths := anObject
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> data [ 

	^items
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> items [

	^ items ifNil: [ 
		(items isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ items := accessor data asArray ] ].

]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> items: anObject [
	items := anObject
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> sentItemAt: selection [ 

	^ accessor itemsBuilder value at: selection.
]

{ #category : #'building - graph' }
GtPharoDeclarativeColumnedList >> viewFor: aView [
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
		send: [ :arg :selection | accessor gtSentItemFor: methodName at: selection first ].
	^list
]

{ #category : #accessing }
GtPharoDeclarativeColumnedList >> viewName [ 

	^ #GtDeclarativeColumnedList
]
