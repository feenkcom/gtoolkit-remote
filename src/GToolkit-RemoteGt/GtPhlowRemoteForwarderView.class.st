Class {
	#name : #GtPhlowRemoteForwarderView,
	#superclass : #GtPhlowBasicForwarderView,
	#category : #'GToolkit-RemoteGt-Phlow'
}

{ #category : #accessing }
GtPhlowRemoteForwarderView class >> contentId [
	^ #'phlow--remote-forwarder-content' asBlocElementId
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> computeTargetViewForObject: aForwardedObject [
	| computedView |
	computedView := nil.
	 
	aForwardedObject object viewProxyDo: [ :remoteInspectorProxy |
		| forwarderViewData forwarderSpecification |
		"Using #getViewDeclaration: has the disadvantage that
		it creates all views of the remote object. Ideally we should introduce a new
		method, like #getStandaloneViewDeclarationFor:, that only creates
		the indicated view. A bigger change would be to ask for a proxy
		object initialized only with some views."
		forwarderViewData := remoteInspectorProxy 
			getViewDeclaration: self viewSymbol.
			"getStandaloneViewDeclarationFor: self viewSymbol".
		forwarderSpecification := GtPhlowViewSpecification 
			fromDictionary: forwarderViewData.
		forwarderSpecification initializeFromInspector: remoteInspectorProxy.
				
		computedView := forwarderSpecification viewFor: GtPhlowView empty .
		
		self hasTransformation ifTrue: [ 
			"This does not support #sendTool: for remote forwarder views, as it sets
			directly a #send: block. Ideally we should ask the existing transformation
			to create a new transformation where the block is updated to retrieve
			the proxy object."
			forwarderSpecification 
				configureViewSendFor: computedView 
				withLocalTransformation: [ :anObject :aSelectionIndices |
					self transformation 
						transformedValueFrom: anObject 
						selection: aSelectionIndices ] ] ].
		
	^ computedView
]

{ #category : #accessing }
GtPhlowRemoteForwarderView >> defaultTitle [
	^ 'Remote Forwarded'
]
