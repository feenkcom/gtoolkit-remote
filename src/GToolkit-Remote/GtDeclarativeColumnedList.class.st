"
GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

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
GtDeclarativeColumnedList >> asDictionaryForExport [ 

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
GtDeclarativeColumnedList >> data [ 

	^items
]

{ #category : #accessing }
GtDeclarativeColumnedList >> items [

	^ items ifNil: [ 
		(items isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ items := accessor data asArray ] ].

]

{ #category : #accessing }
GtDeclarativeColumnedList >> items: anObject [
	items := anObject
]

{ #category : #accessing }
GtDeclarativeColumnedList >> sentItemAt: selection [ 

	^ self items at: selection.
]

{ #category : #'private - accessing' }
GtDeclarativeColumnedList >> sentItems [
	"Answer the collection of sent items of the receiver.
	This method is provided to facilitate the export of serialised view definitions by GtRemoteInspectorExporter and is not a general access method."

	^(1 to: self items size) collect:
		[ :i | accessor sentItemAt: i ]
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
		send: [ :arg :selection | accessor gtSentItemFor: methodName at: selection from ].
	^list
]
