Class {
	#name : #GtPhlowDetailsViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'rowSpecifications',
		'cachedRowValues',
		'cachedRowTexts'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification class >> fromJSONDictionary: aDictionary [
	| details|
	
	details := super fromJSONDictionary: aDictionary.
	
	details rowSpecifications: ((aDictionary at: 'rowSpecifications') collect: [ :eachRowSpecification | GtRemotePhlowDetailsRowSpecification fromJSONDictionary: eachRowSpecification ]).
	
	^ details
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'rowSpecifications' put: (self rowSpecifications collect: [ :eachRowSpecification | eachRowSpecification asDictionaryForExport ])
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowTextAt: anIndex [
	^ self retrieveRowTexts at: anIndex
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowTexts [
	^ cachedRowTexts ifNil: [
		self phlowDataSource retrieveRowTexts ]
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowValueAt: anIndex [
	^ self retrieveRowValues at: anIndex
]

{ #category : #'as yet unclassified' }
GtPhlowDetailsViewSpecification >> retrieveRowValues [
	^ cachedRowValues ifNil: [
		self phlowDataSource retrieveRowValues ]
]

{ #category : #accessing }
GtPhlowDetailsViewSpecification >> rowSpecifications [
	^ rowSpecifications
]

{ #category : #accessing }
GtPhlowDetailsViewSpecification >> rowSpecifications: anObject [
	rowSpecifications := anObject
]
