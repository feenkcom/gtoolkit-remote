"
Content that injects HTML directly into a web view.
"
Class {
	#name : #GtRemotePhlowWebViewHtmlContent,
	#superclass : #GtRemotePhlowWebViewContent,
	#instVars : [
		'html'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #serializing }
GtRemotePhlowWebViewHtmlContent >> asDictionaryForExport [
	^ (super asDictionaryForExport)
		at: 'html' put: html;
		yourself
]

{ #category : #rendering }
GtRemotePhlowWebViewHtmlContent >> configureWebViewElement: aWebViewElement [
	aWebViewElement html: self html
]

{ #category : #accessing }
GtRemotePhlowWebViewHtmlContent >> html [
	^ html
]

{ #category : #accessing }
GtRemotePhlowWebViewHtmlContent >> html: aString [
	html := aString
]

{ #category : #serializing }
GtRemotePhlowWebViewHtmlContent >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self html: (aDictionary at: 'html')
]
