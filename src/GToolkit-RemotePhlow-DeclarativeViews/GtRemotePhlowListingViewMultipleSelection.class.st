Class {
	#name : #GtRemotePhlowListingViewMultipleSelection,
	#superclass : #GtRemotePhlowListingViewSelection,
	#instVars : [
		'selectionItems'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #converting }
GtRemotePhlowListingViewMultipleSelection >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'selectionItems' put: (self selectionItems collect: [ :each | each asDictionaryForExport ]).
	^ specificationData
]

{ #category : #initialization }
GtRemotePhlowListingViewMultipleSelection >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	aDictionary
		at: 'selectionItems' ifPresent: [ :anArray |
			self selectionItems: (anArray collect: [ :each |
				GtRemotePhlowListingViewSelectionItem fromDictionary: each ]) ]
]

{ #category : #testing }
GtRemotePhlowListingViewMultipleSelection >> isMultipleSelection [
	^ true
]

{ #category : #accessing }
GtRemotePhlowListingViewMultipleSelection >> selectionItems [
	^ selectionItems ifNil: [ selectionItems := #() ]
]

{ #category : #accessing }
GtRemotePhlowListingViewMultipleSelection >> selectionItems: aCollectionOfSelectionItems [
	selectionItems := aCollectionOfSelectionItems
]

{ #category : #accessing }
GtRemotePhlowListingViewMultipleSelection >> size [
	^ selectionItems 
		ifNil: [0] 
		ifNotNil: [:aCollection | aCollection size ]
]
