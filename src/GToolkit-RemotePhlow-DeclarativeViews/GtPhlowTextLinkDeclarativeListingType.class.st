Class {
	#name : #GtPhlowTextLinkDeclarativeListingType,
	#superclass : #GtPhlowDeclarativeListingType,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtPhlowTextLinkDeclarativeListingType class >> typeLabel [
	^ #textLink
]

{ #category : #testing }
GtPhlowTextLinkDeclarativeListingType >> isTextLinkListingType [
	^ true
]
