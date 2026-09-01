Extension { #name : #GtRemotePhlowWebBrowserStencil }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowWebBrowserStencil >> create [
	| webViewElement |
	webViewElement := GtWebViewElement new.
	webViewElement id: GtRemotePhlowWebBrowserElementId new.
	contentHeaders ifNotNil: [ :headers |
		headers configureWebViewElement: webViewElement ].
	browserContent configureWebViewElement: webViewElement.
	^ webViewElement
]
