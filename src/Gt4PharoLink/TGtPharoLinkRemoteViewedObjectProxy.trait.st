Trait {
	#name : #TGtPharoLinkRemoteViewedObjectProxy,
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> getGtViewMethodNames [
	^ self proxyPerform: #getGtViewMethodNames
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> getViewDeclaration: aViewSelector [ 
	^ self
		proxyPerform: #getViewDeclaration:
		withPrimitiveArguments: { aViewSelector asSymbol }
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> retrieveItemsCount: anItemsCount fromIndex: anIndex forViewSelector: aViewSelector [
	^ self
		proxyPerform: #retrieveItemsCount:fromIndex:forViewSelector:
		withPrimitiveArguments: { anItemsCount . anIndex . aViewSelector }
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> retrieveTotalItemsCountForViewSelector: methodName [
	^ self
		proxyPerform: #retrieveTotalItemsCountForViewSelector: 
		withPrimitiveArguments: { methodName }
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> retriveFormattedItemsForViewSelector: methodName [
	^ self
		proxyPerform: #retriveFormattedItemsForViewSelector: 
		withPrimitiveArguments: { methodName }
]

{ #category : #accessing }
TGtPharoLinkRemoteViewedObjectProxy >> retriveSentItemForViewSelector: methodName atIndex: selectionIndex [
	^ self
		proxyPerform: #retriveSentItemForViewSelector:atIndex:
		withPrimitiveArguments: { methodName . selectionIndex }
]
