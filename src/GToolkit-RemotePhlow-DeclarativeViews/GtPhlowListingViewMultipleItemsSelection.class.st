Class {
	#name : #GtPhlowListingViewMultipleItemsSelection,
	#superclass : #GtPhlowListingViewSelection,
	#instVars : [
		'selectionIdentifiers'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #testing }
GtPhlowListingViewMultipleItemsSelection class >> isAbstract [
	^ self name = #GtPhlowListingViewMultipleItemsSelection
]

{ #category : #comparing }
GtPhlowListingViewMultipleItemsSelection >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self selectionIdentifiers = anObject selectionIdentifiers
]

{ #category : #converting }
GtPhlowListingViewMultipleItemsSelection >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'selectionIdentifiers' put: (self selectionIdentifiers collect: [ :each | each asDictionaryForExport ]).
	^ specificationData
]

{ #category : #'gt - extensions' }
GtPhlowListingViewMultipleItemsSelection >> gtSelectionIdentifiersFor: aView [
	<gtView>
	^ aView list
		title: 'Selection identifiers';
		priority: 10;
		items: [ self selectionIdentifiers ]
]

{ #category : #comparing }
GtPhlowListingViewMultipleItemsSelection >> hash [
	^ self selectionIdentifiers hash
]

{ #category : #initialization }
GtPhlowListingViewMultipleItemsSelection >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary
		at: 'selectionIdentifiers' ifPresent: [ :anArray |
			self selectionIdentifiers: (anArray collect: [ :each |
				GtRemotePhlowNodeIdentifier fromDictionary: each ]) ].
]

{ #category : #printing }
GtPhlowListingViewMultipleItemsSelection >> printOn: aStream [
	super printOn: aStream.
	aStream parenthesize: [
		self selectionIdentifiers 
			do: [ :each | each descriptionOn: aStream ]
			separatedBy: [ aStream nextPutAll: ', ' ] ]
]

{ #category : #accessing }
GtPhlowListingViewMultipleItemsSelection >> selectionIdentifiers [
	^ selectionIdentifiers
]

{ #category : #accessing }
GtPhlowListingViewMultipleItemsSelection >> selectionIdentifiers: anObject [
	selectionIdentifiers := anObject
]
