"
Content that navigates a web view to a URL.
"
Class {
	#name : #GtRemotePhlowWebViewUrlContent,
	#superclass : #GtRemotePhlowWebViewContent,
	#instVars : [
		'url'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #serializing }
GtRemotePhlowWebViewUrlContent >> asDictionaryForExport [
	^ (super asDictionaryForExport)
		at: 'url' put: url;
		yourself
]

{ #category : #serializing }
GtRemotePhlowWebViewUrlContent >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self url: (aDictionary at: 'url')
]

{ #category : #accessing }
GtRemotePhlowWebViewUrlContent >> url [
	^ url
]

{ #category : #accessing }
GtRemotePhlowWebViewUrlContent >> url: aString [
	url := aString
]
