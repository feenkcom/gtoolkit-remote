"
A local/remote declarative Phlow view rendered by a GtWebViewElement.
"
Class {
	#name : #GtRemotePhlowWebBrowserView,
	#superclass : #GtRemotePhlowLocalView,
	#instVars : [
		'contentComputation',
		'staticHeaders',
		'dynamicHeadersComputation',
		'shouldLoadContentLazily'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #'instance creation' }
GtRemotePhlowWebBrowserView class >> new [
	^ self basicNew initialize
]

{ #category : #converting }
GtRemotePhlowWebBrowserView >> asGtDeclarativeView [
	| specification dataSource |
	dataSource := GtRemotePhlowDeclarativeWebBrowserViewDataSource forPhlowView: self.
	specification := GtRemotePhlowWebBrowserViewSpecification new
		phlowDataSource: dataSource;
		staticHeaders: self staticHeaders;
		hasDynamicHeaders: self hasDynamicHeaders;
		dataTransport: (self shouldLoadContentLazily
			ifTrue: [ GtPhlowViewSpecification dataLazy ]
			ifFalse: [ GtPhlowViewSpecification dataIncluded ]).
	self configureGenericViewSpecificationOn: specification.
	self shouldLoadContentLazily ifFalse: [ specification populateBrowserContent ].
	^ specification
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> byteArray: aBlock [
	self byteArray: aBlock contentType: nil
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> byteArray: aBlock contentType: aContentType [
	self content: [
		GtRemotePhlowWebViewByteArrayContent new
			content: aBlock value;
			contentType: aContentType ]
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> content: aBlock [
	self contentComputation: aBlock
]

{ #category : #accessing }
GtRemotePhlowWebBrowserView >> contentComputation [
	^ contentComputation
]

{ #category : #accessing }
GtRemotePhlowWebBrowserView >> contentComputation: aBlock [
	contentComputation := aBlock
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> dynamicHeaders: aBlock [
	dynamicHeadersComputation := aBlock.
]

{ #category : #headers }
GtRemotePhlowWebBrowserView >> dynamicHeadersComputation [
	^ dynamicHeadersComputation
]

{ #category : #headers }
GtRemotePhlowWebBrowserView >> hasDynamicHeaders [
	^ dynamicHeadersComputation isNotNil
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> headerAt: aName put: aValue [
	self staticHeaders headerAt: aName put: aValue.
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> headers: aHeader [
	staticHeaders := aHeader
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> html: aBlock [
	self content: [ GtRemotePhlowWebViewHtmlContent new html: aBlock value ]
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> includeContent [
	self shouldLoadContentLazily: false
]

{ #category : #initialization }
GtRemotePhlowWebBrowserView >> initialize [
	super initialize.
	
	staticHeaders := GtRemotePhlowWebViewHeader new.
	shouldLoadContentLazily := true
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> loadContentLazily [
	self shouldLoadContentLazily: true
]

{ #category : #accessing }
GtRemotePhlowWebBrowserView >> shouldLoadContentLazily [
	^ shouldLoadContentLazily ifNil: [ true ]
]

{ #category : #accessing }
GtRemotePhlowWebBrowserView >> shouldLoadContentLazily: aBoolean [
	shouldLoadContentLazily := aBoolean.
]

{ #category : #headers }
GtRemotePhlowWebBrowserView >> staticHeaders [
	^ staticHeaders ifNil: [ staticHeaders := GtRemotePhlowWebViewHeader new ]
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> textual: aBlock [
	self textual: aBlock contentType: nil
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> textual: aBlock contentType: aContentType [
	self content: [
		GtRemotePhlowWebViewTextualContent new
			content: aBlock value;
			contentType: aContentType ]
]

{ #category : #building }
GtRemotePhlowWebBrowserView >> url: aBlock [
	self content: [ GtRemotePhlowWebViewUrlContent new url: aBlock value ]
]
