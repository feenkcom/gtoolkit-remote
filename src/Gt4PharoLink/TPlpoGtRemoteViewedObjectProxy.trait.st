Trait {
	#name : 'TPlpoGtRemoteViewedObjectProxy',
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : 'accessing' }
TPlpoGtRemoteViewedObjectProxy >> getGtViewMethodNames [
	^ self proxyPerform: #getGtViewMethodNames
]

{ #category : 'accessing' }
TPlpoGtRemoteViewedObjectProxy >> getViewDeclaration: aViewSelector [ 
	^ self evaluateSourceSequence: 'self getViewDeclaration: #', aViewSelector
]
