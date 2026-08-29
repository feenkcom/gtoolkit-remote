"
Inspectable fixture whose web browser content computation fails.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewErrorTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #views }
GtRemotePhlowWebBrowserViewErrorTestObject >> gtWebBrowserDynamicHeadersErrorFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser dynamic headers error';
		priority: 21;
		url: [ 'https://example.com' ];
		dynamicHeaders: [ :aHeaders | Error signal: 'web browser dynamic headers test error' ]
]

{ #category : #views }
GtRemotePhlowWebBrowserViewErrorTestObject >> gtWebBrowserFor: aView [
	<gtView>
	^ aView webBrowser
		title: 'Browser error';
		priority: 20;
		content: [ Error signal: 'web browser test error' ]
]
