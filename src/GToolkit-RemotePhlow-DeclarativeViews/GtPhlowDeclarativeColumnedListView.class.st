"
GtDeclarativeColumnedList supports a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported

# Internal Representation and Key Implementation Points.


## Instance Variables

	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send


"
Class {
	#name : #GtPhlowDeclarativeColumnedListView,
	#superclass : #GtPhlowDeclarativeListingView,
	#instVars : [
		'columnSpecifications'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeColumnedListView class >> fromJSONDictionary: aDictionary [

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnSpecifications: ((aDictionary at: #columnSpecifications)
			collect: [ :aColumnSpecificationJson |
				GtRemotePhlowColumnSpecification 
					fromJSONDictionary: aColumnSpecificationJson ]).
	
	^list
]

{ #category : #converting }
GtPhlowDeclarativeColumnedListView >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnSpecifications put: (self columnSpecifications
			collect: [ :aColumnSpecification |
				aColumnSpecification asDictionaryForExport ]);
		yourself.

	^dictionary
]

{ #category : #accessing }
GtPhlowDeclarativeColumnedListView >> columnSpecifications [
	^ columnSpecifications
]

{ #category : #accessing }
GtPhlowDeclarativeColumnedListView >> columnSpecifications: anObject [
	columnSpecifications := anObject
]

{ #category : #accessing }
GtPhlowDeclarativeColumnedListView >> columnTitles [
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification title ]
]

{ #category : #accessing }
GtPhlowDeclarativeColumnedListView >> columnTypes [
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification type ]
]

{ #category : #accessing }
GtPhlowDeclarativeColumnedListView >> columnWidths [
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification cellWidth ]
]

{ #category : #accessing }
GtPhlowDeclarativeColumnedListView >> retrieveItems: anItemsCount fromIndex: anIndex [
	^ (super retrieveItems: anItemsCount fromIndex: anIndex) 
			"collect: [ :cellValuesDictionary |
				cellValuesDictionary collect: [ :aCellValueDictionary |
					GtRemotePhlowItemValues fromJSONDictionary: aCellValueDictionary ] ]"
]

{ #category : #'api - accessing' }
GtPhlowDeclarativeColumnedListView >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [	
	^ self phlowDataSource 
		retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex
]
