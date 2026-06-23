Class {
	#name : #GtPhlowDetailsViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'rowSpecifications',
		'cachedRowNodesByIndex'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification class >> fromJSONDictionary: aDictionary [
	| details|
	
	details := super fromJSONDictionary: aDictionary.
	
	details rowSpecifications: ((aDictionary at: 'rowSpecifications') 
		collect: [ :eachRowSpecification | 
			GtRemotePhlowDetailsRowSpecification fromJSONDictionary: eachRowSpecification ]).
	
	^ details
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'rowSpecifications' put: (self rowSpecifications 
			collect: [ :eachRowSpecification | eachRowSpecification asDictionaryForExport ]
			as: Array);
		yourself
]

{ #category : #views }
GtPhlowDetailsViewSpecification >> gtViewRowSpecificationsFor: aView [
	<gtView>
	rowSpecifications ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Row specifications';
		priority: 5;
		items: [ rowSpecifications ];
		column: 'Row Index' text: [ :each | each index ];
		column: 'Row Name' text: [ :each | each name ]
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowNodes [
	^ self phlowDataSource retrieveRowNodes
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowNodesById [
	^ cachedRowNodesByIndex ifNil: [
			(self phlowDataSource retrieveRowNodes collect: [ :each |
				each nodeId -> each ]) asDictionary ]
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowTextAt: aRowIndex [
	^ (self retrieveRowNodesById at: aRowIndex) nodeValue itemText
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowValueAt: aRowIndex [
	^ (self retrieveRowNodesById at: aRowIndex) nodeValue rowValue
]

{ #category : #accessing }
GtPhlowDetailsViewSpecification >> rowSpecifications [
	^ rowSpecifications
]

{ #category : #accessing }
GtPhlowDetailsViewSpecification >> rowSpecifications: anObject [
	rowSpecifications := anObject
]
