"
Creates a web view element from browser content and its static and dynamic headers.
"
Class {
	#name : #GtRemotePhlowWebBrowserStencil,
	#superclass : #GtPhlowStencil,
	#instVars : [
		'browserContent',
		'contentHeaders'
	],
	#category : #'GToolkit-RemotePhlow-Stencils'
}

{ #category : #serialization }
GtRemotePhlowWebBrowserStencil >> asDictionaryForExport [
	| dictionary |
	
	dictionary := super asDictionaryForExport.
	
	dictionary at: 'browserContent' put: browserContent asDictionaryForExport.
	contentHeaders ifNotNil: [ :headers |
		dictionary at: 'contentHeaders' put: headers asDictionaryForExport ].
		
	^ dictionary
]

{ #category : #accessing }
GtRemotePhlowWebBrowserStencil >> browserContent: aContent [
	browserContent := aContent
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> byteArray: aByteArray contentType: aContentType [
	self content: (GtRemotePhlowWebViewByteArrayContent new
		content: aByteArray;
		contentType: aContentType)
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> content: aContent [
	self assert: aContent isWebViewContent.
	browserContent := aContent
]

{ #category : #accessing }
GtRemotePhlowWebBrowserStencil >> contentHeaders [
	^ contentHeaders ifNil: [ contentHeaders := GtRemotePhlowWebViewHeader new ]
]

{ #category : #accessing }
GtRemotePhlowWebBrowserStencil >> contentHeaders: aHeader [
	contentHeaders := aHeader
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> headerAt: aName put: aValue [
	self contentHeaders headerAt: aName put: aValue
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> headers: aHeader [
	self contentHeaders: aHeader
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> html: aString [
	self content: (GtRemotePhlowWebViewHtmlContent new html: aString)
]

{ #category : #initialization }
GtRemotePhlowWebBrowserStencil >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self browserContent: (GtRemotePhlowBasicViewData 
		fromDictionary: (aDictionary at: 'browserContent')).
	(aDictionary at: 'contentHeaders' ifAbsent: [ nil ])
		ifNotNil: [ :headers |
			self contentHeaders: (GtRemotePhlowBasicViewData fromDictionary: headers) ]
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> textual: aString contentType: aContentType [
	self content: (GtRemotePhlowWebViewTextualContent new
		content: aString;
		contentType: aContentType)
]

{ #category : #building }
GtRemotePhlowWebBrowserStencil >> url: aUrl [
	self content: (GtRemotePhlowWebViewUrlContent new url: aUrl)
]
