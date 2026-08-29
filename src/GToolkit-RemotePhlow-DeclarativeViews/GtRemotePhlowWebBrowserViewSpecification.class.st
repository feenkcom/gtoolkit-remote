"
Declarative specification for a remote web browser view.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'staticHeaders',
		'hasDynamicHeaders',
		'browserContent',
		'dynamicHeaders'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowWebBrowserViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	(aDictionary at: 'staticHeaders' ifAbsent: [ nil ])
		ifNotNil: [ :headers |
			specification staticHeaders: (GtRemotePhlowBasicViewData fromDictionary: headers) ].
	specification hasDynamicHeaders: (aDictionary at: 'hasDynamicHeaders' ifAbsent: [ false ]).
	specification isWithLazyLoading ifFalse: [
		(aDictionary at: 'browserContent' ifAbsent: [ nil ])
			ifNotNil: [ :content |
				specification browserContent: (GtRemotePhlowBasicViewData fromDictionary: content) ].
		(aDictionary at: 'dynamicHeaders' ifAbsent: [ nil ])
			ifNotNil: [ :headers |
				specification dynamicHeaders: (GtRemotePhlowBasicViewData fromDictionary: headers) ] ].
	^ specification
]

{ #category : #'instance creation' }
GtRemotePhlowWebBrowserViewSpecification class >> new [
	^ self basicNew initialize
]

{ #category : #exporting }
GtRemotePhlowWebBrowserViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	dictionary := super asBasicViewDataForExport.
	dictionary
		at: 'staticHeaders' put: self staticHeaders asDictionaryForExport;
		at: 'hasDynamicHeaders' put: self hasDynamicHeaders.
	self isWithLazyLoading ifFalse: [
		dictionary
			at: 'browserContent' put: self browserContent asDictionaryForExport;
			at: 'dynamicHeaders' put: self dynamicHeaders asDictionaryForExport ].
	^ dictionary
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> browserContent [
	^ browserContent ifNil: [ browserContent := self retrieveContent ]
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> browserContent: aContent [
	browserContent := aContent
]

{ #category : #actions }
GtRemotePhlowWebBrowserViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> dynamicHeaders [
	self hasDynamicHeaders ifFalse: [ ^ GtRemotePhlowWebViewHeader new ].
	^ dynamicHeaders ifNil: [ dynamicHeaders := self retrieveDynamicHeaders ]
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> dynamicHeaders: aHeader [
	dynamicHeaders := aHeader
]

{ #category : #updating }
GtRemotePhlowWebBrowserViewSpecification >> flushCachedData [
	browserContent := nil.
	dynamicHeaders := nil.
	self phlowDataSource ifNotNil: [ :aDataSource |
		aDataSource flushCachedData ]
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> hasDynamicHeaders [
	^ hasDynamicHeaders
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> hasDynamicHeaders: aBoolean [
	hasDynamicHeaders := aBoolean
]

{ #category : #initialization }
GtRemotePhlowWebBrowserViewSpecification >> initialize [
	super initialize.
	
	staticHeaders := GtRemotePhlowWebViewHeader new
]

{ #category : #initialization }
GtRemotePhlowWebBrowserViewSpecification >> initializeFromInspector: anInspector [
	self isWithLazyLoading ifTrue: [
		self phlowDataSource ifNil: [
			self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector) ] ]
]

{ #category : #initialization }
GtRemotePhlowWebBrowserViewSpecification >> populateBrowserContent [
	self
		browserContent: self retrieveContent;
		dynamicHeaders: self dynamicHeaders
]

{ #category : #retrieving }
GtRemotePhlowWebBrowserViewSpecification >> retrieveContent [
	^ self phlowDataSource retrieveContent
]

{ #category : #retrieving }
GtRemotePhlowWebBrowserViewSpecification >> retrieveDynamicHeaders [
	^ self phlowDataSource retrieveDynamicHeaders
]

{ #category : #retrieving }
GtRemotePhlowWebBrowserViewSpecification >> retrievePrimitiveContent [
	^ self retrieveContent asDictionaryForExport
]

{ #category : #retrieving }
GtRemotePhlowWebBrowserViewSpecification >> retrievePrimitiveDynamicHeaders [
	^ self retrieveDynamicHeaders asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> staticHeaders [
	^ staticHeaders ifNil: [ GtRemotePhlowWebViewHeader new ]
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewSpecification >> staticHeaders: aHeader [
	staticHeaders := aHeader
]
