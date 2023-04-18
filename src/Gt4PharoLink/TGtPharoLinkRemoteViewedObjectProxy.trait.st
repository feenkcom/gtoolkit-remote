Trait {
	#name : #TGtPharoLinkRemoteViewedObjectProxy,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> getDeclarativeViewFor: aViewSelector [
	^ self
		proxyPerform: #getDeclarativeViewFor:
		withPrimitiveArguments: { aViewSelector asSymbol }
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> getDeclarativeViewMethodNames [
	^ self proxyPerform: #getDeclarativeViewMethodNames
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> getViewDeclaration: aViewSelector [ 
	^ self
		proxyPerform: #getViewDeclaration:
		withPrimitiveArguments: { aViewSelector asSymbol }
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> getViewsDeclarations [
	^ self newCommandFactory
		setByValueOnly;
		<< 'self getViewsDeclarations';
		sendAndWait.
]
