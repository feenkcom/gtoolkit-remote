Class {
	#name : #GtPhlowListingViewSingleItemSelection,
	#superclass : #GtPhlowListingViewSelection,
	#instVars : [
		'selectionIdentifier'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #testing }
GtPhlowListingViewSingleItemSelection class >> isAbstract [
	^ self name = #GtPhlowListingViewSingleItemSelection
]

{ #category : #comparing }
GtPhlowListingViewSingleItemSelection >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self selectionIdentifier = anObject selectionIdentifier
]

{ #category : #converting }
GtPhlowListingViewSingleItemSelection >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'selectionIdentifier' put: self selectionIdentifier asDictionaryForExport.
	^ specificationData
]

{ #category : #comparing }
GtPhlowListingViewSingleItemSelection >> hash [
	^ self selectionIdentifier hash
]

{ #category : #initialization }
GtPhlowListingViewSingleItemSelection >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'selectionIdentifier' ifPresent: [ :aDict |
			self selectionIdentifier: (GtRemotePhlowNodeIdentifier fromDictionary: aDict) ].
]

{ #category : #printing }
GtPhlowListingViewSingleItemSelection >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self selectionIdentifier descriptionOn: aStream ]
]

{ #category : #accessing }
GtPhlowListingViewSingleItemSelection >> selectionIdentifier [
	^ selectionIdentifier
]

{ #category : #accessing }
GtPhlowListingViewSingleItemSelection >> selectionIdentifier: anObject [
	selectionIdentifier := anObject
]
