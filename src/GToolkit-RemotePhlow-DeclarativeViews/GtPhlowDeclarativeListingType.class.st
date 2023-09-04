Class {
	#name : #GtPhlowDeclarativeListingType,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeListingType class >> forTypeLabel: aValue [ 
	^ self allSubclasses
		detect: [ :aSubclass |
			aSubclass typeLabel = aValue ]
		ifFound: [ :aSubclass | aSubclass new ]
		ifNone: [ self unknown ]
]

{ #category : #'types creation' }
GtPhlowDeclarativeListingType class >> iconName [
	^ GtPhlowThemeIconNameDeclarativeListingType new
]

{ #category : #'types creation' }
GtPhlowDeclarativeListingType class >> number [
	^ GtPhlowNumberDeclarativeListingType new
]

{ #category : #'types creation' }
GtPhlowDeclarativeListingType class >> text [
	^ GtPhlowTextDeclarativeListingType new
]

{ #category : #'types creation' }
GtPhlowDeclarativeListingType class >> textLink [
	^ GtPhlowTextLinkDeclarativeListingType new
]

{ #category : #accessing }
GtPhlowDeclarativeListingType class >> typeLabel [
	^ 'listing type'
]

{ #category : #'types creation' }
GtPhlowDeclarativeListingType class >> unknown [
	^ GtPhlowUnknownDeclarativeListingType new
]

{ #category : #testing }
GtPhlowDeclarativeListingType >> isIconNameListingType [
	^ false
]

{ #category : #testing }
GtPhlowDeclarativeListingType >> isTextLinkListingType [
	^ false
]

{ #category : #testing }
GtPhlowDeclarativeListingType >> isUnknown [
	^ false
]

{ #category : #accessing }
GtPhlowDeclarativeListingType >> typeLabel [
	^ self class typeLabel
]
