Class {
	#name : #GtPhlowUnknownDeclarativeListingType,
	#superclass : #GtPhlowDeclarativeListingType,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtPhlowUnknownDeclarativeListingType class >> typeLabel [
	^ #unknown
]

{ #category : #testing }
GtPhlowUnknownDeclarativeListingType >> isUnknown [
	^ true
]
