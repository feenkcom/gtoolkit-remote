"
Shared construction examples for the web browser Phlow view.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API'
}

{ #category : #testing }
GtRemotePhlowWebBrowserViewAbstractExamples class >> isAbstract [
	^ self name = #GtRemotePhlowWebBrowserViewAbstractExamples
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> byteArrayView [
	<gtExample>
	| view content |
	view := (self createProtoView webBrowser)
		byteArray: [ #[ 1 2 3 ] ] contentType: 'application/pdf'.
	content := view asGtDeclarativeView retrieveContent.
	self assert: content fileExtension equals: 'pdf'.
	^ view
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> contentCreatesWebViewElement [
	<gtExample>
	| specification stencil element |
	specification := self urlView asGtDeclarativeView.
	stencil := specification createDeclarativeContentStencil.
	element := stencil create.
	self assert: element class equals: GtWebViewElement.
	^ element
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> contentErrorIsCaptured [
	<gtExample>
	| specification content |
	specification := ((self createProtoView webBrowser)
		content: [ Error signal: 'content error' ]) asGtDeclarativeView.
	content := specification retrieveContent.
	self assert: content isPhlowErrorData.
	self assert: content errorDescription equals: 'content error'.
	^ content
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> contentLoadsLazilyByDefault [
	<gtExample>
	| view |
	view := self urlView.
	self assert: view shouldLoadContentLazily.
	^ view
]

{ #category : #private }
GtRemotePhlowWebBrowserViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> dynamicHeaderErrorIsCaptured [
	<gtExample>
	| specification headers |
	specification := ((self createProtoView webBrowser)
		url: [ 'https://example.com' ];
		dynamicHeaders: [ :aHeader | Error signal: 'header error' ]) asGtDeclarativeView.
	headers := specification retrieveDynamicHeaders.
	self assert: headers isPhlowErrorData.
	self assert: headers errorDescription equals: 'header error'.
	^ headers
]

{ #category : #'examples - updating' }
GtRemotePhlowWebBrowserViewAbstractExamples >> flushCachedDataClearsIncludedContent [
	<gtExample>
	| specification |
	specification := self includedHtmlContent.
	self assert: (specification instVarNamed: #browserContent) isNil not.
	specification flushCachedData.
	self assert: (specification instVarNamed: #browserContent) isNil.
	self assert: (specification instVarNamed: #dynamicHeaders) isNil.
	self assert: specification browserContent html equals: '<h1>Included local HTML</h1>'.
	^ specification
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> htmlView [
	<gtExample>
	| view content |
	view := (self createProtoView webBrowser)
		html: [ '<h1>Hello</h1>' ].
	content := view asGtDeclarativeView retrieveContent.
	self assert: content html equals: '<h1>Hello</h1>'.
	^ view
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> includedHtmlContent [
	<gtExample>
	| view specification content |
	view := (self createProtoView webBrowser)
		html: [ '<h1>Included local HTML</h1>' ];
		includeContent.
	self assert: view shouldLoadContentLazily not.
	specification := view asGtDeclarativeView.
	content := specification browserContent.
	self assert: specification isWithLazyLoading not.
	self assert: content isPhlowErrorData not.
	self assert: content html equals: '<h1>Included local HTML</h1>'.
	^ specification
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> includedSpecificationContainsContentAndDynamicHeaders [
	<gtExample>
	| view specification |
	view := (self createProtoView webBrowser)
		url: [ 'https://example.com' ];
		headerAt: 'Accept' put: 'text/html';
		dynamicHeaders: [ :headers | headers headerAt: 'Authorization' put: 'token' ];
		includeContent.
	self assert: view shouldLoadContentLazily not.
	specification := view asGtDeclarativeView.
	self assert: specification isWithLazyLoading not.
	self assert: specification phlowDataSource notNil.
	self assert: specification browserContent url equals: 'https://example.com'.
	self assert: (specification dynamicHeaders headers at: 'Authorization') equals: 'token'.
	^ specification
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> lazySpecificationRetrievesContent [
	<gtExample>
	| specification content |
	specification := self urlView asGtDeclarativeView.
	self assert: specification isWithLazyLoading.
	content := specification retrieveContent.
	self assert: content isPhlowErrorData not.
	self assert: content url equals: 'https://example.com'.
	^ specification
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> pngByteArrayView [
	<gtExample>
	| view content |
	view := (self createProtoView webBrowser)
		byteArray: [ GtRemotePhlowPictureViewTestObject pictureBytes ]
		contentType: 'image/png'.
	content := view asGtDeclarativeView retrieveContent.
	self assert: content isPhlowErrorData not.
	self assert: content content equals: GtRemotePhlowPictureViewTestObject pictureBytes.
	self assert: content fileExtension equals: 'png'.
	^ view
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> specificationRoundTripWithIncludedContent [
	<gtExample>
	| specification restored |
	specification := self includedSpecificationContainsContentAndDynamicHeaders.
	restored := GtRemotePhlowWebBrowserViewSpecification fromJSONDictionary: specification asBasicViewDataForExport.
	self assert: restored browserContent url equals: 'https://example.com'.
	self assert: (restored staticHeaders headers at: 'Accept') equals: 'text/html'.
	self assert: (restored dynamicHeaders headers at: 'Authorization') equals: 'token'.
	^ restored
]

{ #category : #'examples - serialization' }
GtRemotePhlowWebBrowserViewAbstractExamples >> specificationWithoutHeaderInformationUsesDefaults [
	<gtExample>
	| specification dictionary restored |
	specification := self urlView asGtDeclarativeView.
	dictionary := specification asBasicViewDataForExport.
	dictionary removeKey: 'staticHeaders'.
	dictionary removeKey: 'hasDynamicHeaders'.
	restored := GtRemotePhlowWebBrowserViewSpecification fromJSONDictionary: dictionary.
	self assert: restored staticHeaders headers isEmpty.
	self assert: restored hasDynamicHeaders not.
	^ restored
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> staticAndDynamicHeaders [
	<gtExample>
	| specification headers |
	specification := ((self createProtoView webBrowser)
		url: [ 'https://example.com' ];
		headerAt: 'Accept' put: 'text/html';
		headerAt: 'X-Static' put: 'static value';
		dynamicHeaders: [ :aHeaders |
			aHeaders
				headerAt: 'Authorization' put: 'Bearer dynamic-token';
				headerAt: 'X-Dynamic' put: 'dynamic value' ]) asGtDeclarativeView.
	headers := specification retrieveDynamicHeaders.
	self assert: (specification staticHeaders headers at: 'Accept') equals: 'text/html'.
	self assert: (specification staticHeaders headers at: 'X-Static') equals: 'static value'.
	self assert: (headers headers at: 'Authorization') equals: 'Bearer dynamic-token'.
	self assert: (headers headers at: 'X-Dynamic') equals: 'dynamic value'.
	^ specification
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> textualView [
	<gtExample>
	| view content |
	view := (self createProtoView webBrowser)
		textual: [ '<h1>Hello</h1>' ] contentType: 'text/html'.
	content := view asGtDeclarativeView retrieveContent.
	self assert: content fileExtension equals: 'html'.
	^ view
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> urlView [
	<gtExample>
	| view |
	view := (self createProtoView webBrowser)
		title: 'Browser';
		priority: 20;
		url: [ 'https://example.com' ].
	self assert: view contentComputation value isWebViewContent.
	^ view
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> webBrowserStencilAllowsMissingHeaders [
	<gtExample>
	| element |
	element := GtRemotePhlowWebBrowserStencil new
		browserContent: (GtRemotePhlowWebViewHtmlContent new html: '<h1>No headers</h1>');
		create.
	self assert: element class equals: GtWebViewElement.
	^ element
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> webBrowserStencilContentAndHeaders [
	<gtExample>
	| stencil element |
	stencil := GtRemotePhlowWebBrowserStencil new
		html: '<h1>Browser stencil</h1>';
		headerAt: 'X-Static' put: 'static value';
		headerAt: 'X-Dynamic' put: 'dynamic value'.
	self
		assert: (stencil contentHeaders headers at: 'X-Static')
		equals: 'static value'.
	element := stencil create.
	self assert: element class equals: GtWebViewElement.
	^ stencil
]

{ #category : #examples }
GtRemotePhlowWebBrowserViewAbstractExamples >> webBrowserStencilContentConveniences [
	<gtExample>
	| urlStencil textualStencil byteArrayStencil |
	urlStencil := GtRemotePhlowWebBrowserStencil new url: 'https://example.com'.
	self assert: urlStencil create class equals: GtWebViewElement.
	textualStencil := GtRemotePhlowWebBrowserStencil new
		textual: '<h1>Textual</h1>' contentType: 'text/html'.
	self assert: textualStencil create class equals: GtWebViewElement.
	byteArrayStencil := GtRemotePhlowWebBrowserStencil new
		byteArray: #[ 1 2 3 ] contentType: 'application/octet-stream'.
	self assert: byteArrayStencil create class equals: GtWebViewElement.
	^ byteArrayStencil
]

{ #category : #'examples - stencil' }
GtRemotePhlowWebBrowserViewAbstractExamples >> webBrowserStencilRoundTrip [
	<gtExample>
	| specification stencil stencilSpecification restoredSpecification restoredStencil |
	specification := self urlView asGtDeclarativeView.
	stencil := specification createDeclarativeContentStencil.
	stencilSpecification := stencil asGtStencilSpecification.
	restoredSpecification := GtPhlowDeclarativeSpecification
		fromDictionary: stencilSpecification asDictionaryForExport.
	restoredStencil := restoredSpecification createStencil.
	self assert: restoredSpecification class equals: GtRemotePhlowDirectStencilSpecification.
	self assert: restoredStencil class equals: GtRemotePhlowWebBrowserStencil.
	self assert: restoredStencil create class equals: GtWebViewElement.
	^ restoredStencil
]
