"
Examples for individual web-view content classes.
"
Class {
	#name : #GtRemotePhlowWebViewContentExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #examples }
GtRemotePhlowWebViewContentExamples >> byteArrayContentWritesBytes [
	<gtExample>
	| content file bytes |
	content := GtRemotePhlowWebViewByteArrayContent new
		content: #[ 1 2 3 ];
		contentType: 'application/pdf'.
	self assert: content defaultContentType equals: 'application/octet-stream'.
	self assert: content fileExtension equals: 'pdf'.
	content configureWebViewElement: GtWebViewElement new.
	file := FileSystem root / content fileUrlString asUrl path.
	bytes := file binaryReadStreamDo: [ :aStream | aStream upToEnd ].
	self assert: bytes equals: #[ 1 2 3 ].
	^ content
]

{ #category : #examples }
GtRemotePhlowWebViewContentExamples >> headerRoundTrip [
	<gtExample>
	| headers restored |
	headers := GtRemotePhlowWebViewHeader new
		headerAt: 'Accept' put: 'text/html';
		headerAt: 'Accept' put: 'application/json'.
	restored := GtRemotePhlowBasicViewData fromDictionary: headers asDictionaryForExport.
	self assert: headers isPhlowErrorData not.
	self assert: headers headers size equals: 1.
	self assert: (restored headers at: 'Accept') equals: 'application/json'.
	^ restored
]

{ #category : #examples }
GtRemotePhlowWebViewContentExamples >> htmlContentRoundTrip [
	<gtExample>
	| content restored |
	content := GtRemotePhlowWebViewHtmlContent new html: '<h1>Hello</h1>'.
	restored := GtRemotePhlowBasicViewData fromDictionary: content asDictionaryForExport.
	self assert: content isPhlowErrorData not.
	self assert: restored html equals: '<h1>Hello</h1>'.
	^ restored
]

{ #category : #examples }
GtRemotePhlowWebViewContentExamples >> textualContentWritesUtf8HtmlFile [
	<gtExample>
	| content file bytes |
	content := GtRemotePhlowWebViewTextualContent new
		content: '<h1>Héllo</h1>';
		contentType: 'text/html; charset=utf-8'.
	self assert: content defaultContentType equals: 'text/plain'.
	self assert: content fileExtension equals: 'txt'.
	content configureWebViewElement: GtWebViewElement new.
	file := FileSystem root / content fileUrlString asUrl path.
	bytes := file binaryReadStreamDo: [ :aStream | aStream upToEnd ].
	self assert: bytes equals: '<h1>Héllo</h1>' utf8Encoded.
	^ content
]

{ #category : #examples }
GtRemotePhlowWebViewContentExamples >> urlContentRoundTrip [
	<gtExample>
	| content restored |
	content := GtRemotePhlowWebViewUrlContent new url: 'https://example.com'.
	restored := GtRemotePhlowBasicViewData fromDictionary: content asDictionaryForExport.
	self assert: content isPhlowErrorData not.
	self assert: restored isWebViewContent.
	self assert: restored url equals: 'https://example.com'.
	^ restored
]
