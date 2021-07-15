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

{ #category : 'accessing' }
TPlpoGtRemoteViewedObjectProxy >> retriveFormattedItemsForViewSelector: methodName [
	"Pass the #retriveItemsForViewSelector:  request on to the receiver's object, which is a GtViewedObject"
	| message |

	self assert: (PharoLinkRegistry isPrimitive: methodName).

	message := String streamContents: [ :stream |
		stream 
			<< 'self retriveFormattedItemsForViewSelector: #';
			<< methodName ].
	^ self evaluateSourceSequence: message
]
