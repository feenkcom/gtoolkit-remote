"
Abstract content materialized into a local temporary file before it configures a web view.
"
Class {
	#name : #GtRemotePhlowWebViewExplicitContent,
	#superclass : #GtRemotePhlowWebViewContent,
	#instVars : [
		'content',
		'contentType',
		'fileUrlString'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #testing }
GtRemotePhlowWebViewExplicitContent class >> isAbstract [
	^ self name = #GtRemotePhlowWebViewExplicitContent
]

{ #category : #serializing }
GtRemotePhlowWebViewExplicitContent >> asDictionaryForExport [
	| dictionary |
	dictionary := super asDictionaryForExport.
	
	dictionary at: 'content' put: content.
	contentType ifNotNil: [ 
		dictionary at: 'contentType' put: contentType ].
		
	^ dictionary
]

{ #category : #configuring }
GtRemotePhlowWebViewExplicitContent >> configureWebViewElement: aWebViewElement [
	aWebViewElement url: self fileUrlString
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> content [
	^ content
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> content: anObject [
	content := anObject
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> contentType [
	^ contentType
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> contentType: aString [
	contentType := aString
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> contentTypeToFileExtensionMappings [
	^ #(
			('text/html' 'html')
			('text/plain' 'txt')
			('application/json' 'json')
			('application/pdf' 'pdf')
			('image/png' 'png')
			('image/svg+xml' 'svg')
			('text/css' 'css')
			('text/javascript' 'js')
			('application/javascript' 'js'))
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> defaultContentType [
	self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> defaultFileExtension [
	self subclassResponsibility
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> effectiveContentType [
	^ contentType ifNil: [ self defaultContentType ]
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> fileExtension [
	| normalized |
	
	normalized := self effectiveContentType asLowercase.
	
	^ self contentTypeToFileExtensionMappings
		detect: [ :each | each first = normalized ]
		ifFound: [ :each | each second ]
		ifNone: [  self defaultFileExtension ]
]

{ #category : #accessing }
GtRemotePhlowWebViewExplicitContent >> fileUrlString [
	^ fileUrlString ifNil: [
		fileUrlString := GtRemotePhlowWebViewExplicitContentFileWriter new 
				writeContent: self ]
]

{ #category : #serializing }
GtRemotePhlowWebViewExplicitContent >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self
		content: (aDictionary at: 'content');
		contentType: (aDictionary at: 'contentType' ifAbsent: [ nil ])
]

{ #category : #rendering }
GtRemotePhlowWebViewExplicitContent >> writeContentTo: aFileReference [
	self subclassResponsibility
]
