"
Inspectable fixture that provides the web browser view scenarios through GtRemotePhlowWebBrowserStencil.
"
Class {
	#name : #GtRemotePhlowWebBrowserStencilTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'gt-views' }
GtRemotePhlowWebBrowserStencilTestObject >> gtWebBrowserFor: aView [
	<gtView>
	^ aView explicit
		title: 'Browser';
		priority: 20;
		declarativeStencil: [
			GtRemotePhlowWebBrowserStencil new
				html: '<h1>Web browser</h1>' ]
]

{ #category : #'gt-views' }
GtRemotePhlowWebBrowserStencilTestObject >> gtWebBrowserHeadersFor: aView [
	<gtView>
	^ aView explicit
		title: 'Browser headers';
		priority: 23;
		declarativeStencil: [
			GtRemotePhlowWebBrowserStencil new
				url: 'https://example.com';
				headerAt: 'Accept' put: 'text/html';
				headerAt: 'X-Static' put: 'static value';
				headerAt: 'Authorization' put: 'Bearer dynamic-token';
				headerAt: 'X-Dynamic' put: 'dynamic value' ]
]

{ #category : #'gt-views' }
GtRemotePhlowWebBrowserStencilTestObject >> gtWebBrowserLocalDataFor: aView [
	<gtView>
	^ aView explicit
		title: 'Browser local data';
		priority: 24;
		declarativeStencil: [
			GtRemotePhlowWebBrowserStencil new
				html: '<h1>Included local HTML</h1>' ]
]

{ #category : #'gt-views' }
GtRemotePhlowWebBrowserStencilTestObject >> gtWebBrowserPngFor: aView [
	<gtView>
	^ aView explicit
		title: 'Browser PNG';
		priority: 22;
		declarativeStencil: [
			GtRemotePhlowWebBrowserStencil new
				byteArray: GtRemotePhlowPictureViewTestObject pictureBytes
				contentType: 'image/png' ]
]

{ #category : #'gt-views' }
GtRemotePhlowWebBrowserStencilTestObject >> gtWebBrowserUrlFor: aView [
	<gtView>
	^ aView explicit
		title: 'Browser URL';
		priority: 21;
		declarativeStencil: [
			GtRemotePhlowWebBrowserStencil new
				url: 'https://example.com' ]
]
