Class {
	#name : #GtRemotePhlowListingViewSingleSelection,
	#superclass : #GtRemotePhlowListingViewSelection,
	#instVars : [
		'selectionItem'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #converting }
GtRemotePhlowListingViewSingleSelection >> asDictionaryForExport [
	| specificationData |
	specificationData := super asDictionaryForExport.
	specificationData at: 'selectionItem' put: self selectionItem asDictionaryForExport.
	^ specificationData
]

{ #category : #initialization }
GtRemotePhlowListingViewSingleSelection >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	aDictionary
		at: 'selectionItem' ifPresent: [ :aDict |
			self selectionItem: (GtRemotePhlowListingViewSelectionItem fromDictionary: aDict) ]
]

{ #category : #accessing }
GtRemotePhlowListingViewSingleSelection >> selectionItem [
	^ selectionItem
]

{ #category : #accessing }
GtRemotePhlowListingViewSingleSelection >> selectionItem: aSelectionItem [
	selectionItem := aSelectionItem
]

{ #category : #accessing }
GtRemotePhlowListingViewSingleSelection >> selectionItems [
	^ { self selectionItem }
]

{ #category : #accessing }
GtRemotePhlowListingViewSingleSelection >> size [
	^ 1
]
