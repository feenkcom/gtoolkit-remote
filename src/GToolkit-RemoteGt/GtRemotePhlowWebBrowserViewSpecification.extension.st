Extension { #name : #GtRemotePhlowWebBrowserViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowWebBrowserViewSpecification >> createDeclarativeContentStencil [
	| content currentDynamicHeaders contentHeaders |
	content := self browserContent.
	content isPhlowErrorData ifTrue: [
		^ GtPhlowErrorStencil new stencilData: content ].
	currentDynamicHeaders := self dynamicHeaders.
	currentDynamicHeaders isPhlowErrorData ifTrue: [
		^ GtPhlowErrorStencil new stencilData: currentDynamicHeaders ].
	contentHeaders := self staticHeaders copy.
	currentDynamicHeaders do: [ :name :value |
		contentHeaders headerAt: name put: value ].
	^ GtRemotePhlowWebBrowserStencil new
		browserContent: content;
		contentHeaders: contentHeaders
]

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowWebBrowserViewSpecification >> viewFor: aView [
	| browserView |
	browserView := aView explicit
		originalView: aView;
		title: title;
		priority: priority;
		declarativeStencil: [ self createDeclarativeContentStencil ].
	self configureViewActionsFor: browserView.
	^ browserView
]
