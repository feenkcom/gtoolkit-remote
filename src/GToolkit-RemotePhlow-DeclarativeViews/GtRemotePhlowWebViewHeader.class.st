"
A serializable collection of HTTP headers applied to a web view.
"
Class {
	#name : #GtRemotePhlowWebViewHeader,
	#superclass : #GtRemotePhlowBasicViewData,
	#instVars : [
		'headers'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowWebViewHeader class >> new [
	^ self basicNew initialize
]

{ #category : #serializing }
GtRemotePhlowWebViewHeader >> asDictionaryForExport [
	^ (super asDictionaryForExport)
		at: 'headers' put: headers;
		yourself
]

{ #category : #rendering }
GtRemotePhlowWebViewHeader >> configureWebViewElement: aWebViewElement [
	self do: [ :aName :aValue | 
		aWebViewElement headerAt: aName put: aValue ]
]

{ #category : #enumerating }
GtRemotePhlowWebViewHeader >> do: aBlock [
	headers associationsDo: [ :each | 
		aBlock value: each key value: each value ]
]

{ #category : #accessing }
GtRemotePhlowWebViewHeader >> headerAt: aName put: aValue [
	headers at: aName put: aValue.
]

{ #category : #accessing }
GtRemotePhlowWebViewHeader >> headers [
	^ headers
]

{ #category : #initialization }
GtRemotePhlowWebViewHeader >> initialize [
	super initialize.
	
	headers := Dictionary new
]

{ #category : #serializing }
GtRemotePhlowWebViewHeader >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	headers := aDictionary at: 'headers' ifAbsent: [ Dictionary new ]
]

{ #category : #testing }
GtRemotePhlowWebViewHeader >> isEmpty [
	^ headers isEmpty
]

{ #category : #copying }
GtRemotePhlowWebViewHeader >> postCopy [
	super postCopy.
	
	headers := headers copy
]
