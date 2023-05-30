Class {
	#name : #GtPhlowBasicColumnedViewSpecification,
	#superclass : #GtPhlowListingViewSpecification,
	#instVars : [
		'columnSpecifications'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowBasicColumnedViewSpecification class >> fromJSONDictionary: aDictionary [

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
GtPhlowBasicColumnedViewSpecification >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnSpecifications put: (self columnSpecifications
			collect: [ :aColumnSpecification |
				aColumnSpecification asDictionaryForExport ]);
		yourself.

	^ dictionary
]

{ #category : #accessing }
GtPhlowBasicColumnedViewSpecification >> columnSpecifications [
	^ columnSpecifications
]

{ #category : #accessing }
GtPhlowBasicColumnedViewSpecification >> columnSpecifications: anObject [
	columnSpecifications := anObject
]

{ #category : #accessing }
GtPhlowBasicColumnedViewSpecification >> columnTitles [
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification title ]
]

{ #category : #accessing }
GtPhlowBasicColumnedViewSpecification >> columnTypes [
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification type ]
]

{ #category : #accessing }
GtPhlowBasicColumnedViewSpecification >> columnWidths [
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification cellWidth ]
]

{ #category : #'api - accessing' }
GtPhlowBasicColumnedViewSpecification >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [	
	^ self phlowDataSource 
		retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex
]
