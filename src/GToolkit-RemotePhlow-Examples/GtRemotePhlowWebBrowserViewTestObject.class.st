"
Inspectable fixture for web browser views.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewTestObject,
	#superclass : #Object,
	#instVars : [
		'currentUrl'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowWebBrowserViewTestObject class >> new [
	^ self basicNew initialize
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewTestObject >> currentUrl [
	^ currentUrl
]

{ #category : #accessing }
GtRemotePhlowWebBrowserViewTestObject >> currentUrl: aUrl [
	currentUrl := aUrl
]

{ #category : #views }
GtRemotePhlowWebBrowserViewTestObject >> gtWebBrowserFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser';
		priority: 20;
		html: [ '<h1>Web browser</h1>' ]
]

{ #category : #views }
GtRemotePhlowWebBrowserViewTestObject >> gtWebBrowserHeadersFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser headers';
		priority: 23;
		url: [ 'https://example.com' ];
		headerAt: 'Accept' put: 'text/html';
		headerAt: 'X-Static' put: 'static value';
		dynamicHeaders: [ :aHeaders |
			aHeaders
				headerAt: 'Authorization' put: 'Bearer dynamic-token';
				headerAt: 'X-Dynamic' put: 'dynamic value' ]
]

{ #category : #views }
GtRemotePhlowWebBrowserViewTestObject >> gtWebBrowserLocalDataFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser local data';
		priority: 24;
		html: [ '<h1>Included local HTML</h1>' ];
		includeContent
]

{ #category : #views }
GtRemotePhlowWebBrowserViewTestObject >> gtWebBrowserPngFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser PNG';
		priority: 22;
		byteArray: [ GtRemotePhlowPictureViewTestObject pictureBytes ]
		contentType: 'image/png'
]

{ #category : #'gt views' }
GtRemotePhlowWebBrowserViewTestObject >> gtWebBrowserUpdatingUrlFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser updating URL';
		priority: 25;
		url: [ self currentUrl ];
		actionButtonLabel: 'Change URL'
			tooltip: 'Change the URL used by this view'
			action: [ :aButton | 
				self updateCurrentUrl.
				aButton phlow fireViewUpdateWish ];
		actionButtonLabel: 'Edit URL'
			tooltip: 'Edit the url without updating the view'
			action: [ :aButton | 
				self updateCurrentUrl ]
]

{ #category : #views }
GtRemotePhlowWebBrowserViewTestObject >> gtWebBrowserUrlFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser URL';
		priority: 21;
		url: [ 'https://example.com' ]
]

{ #category : #initialization }
GtRemotePhlowWebBrowserViewTestObject >> initialize [
	super initialize.
	currentUrl := 'https://example.com'
]

{ #category : #actions }
GtRemotePhlowWebBrowserViewTestObject >> updateCurrentUrl [
	self currentUrl: 'https://example.org'
]
