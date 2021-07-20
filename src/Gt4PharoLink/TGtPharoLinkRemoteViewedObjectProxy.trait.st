Trait {
	#name : 'TGtPharoLinkRemoteViewedObjectProxy',
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : 'accessing' }
TGtPharoLinkRemoteViewedObjectProxy >> getGtViewMethodNames [
	^ self proxyPerform: #getGtViewMethodNames
]

{ #category : 'accessing' }
TGtPharoLinkRemoteViewedObjectProxy >> getViewDeclaration: aViewSelector [ 
	^ self evaluateSourceSequence: 'self getViewDeclaration: #', aViewSelector
]

{ #category : 'accessing' }
TGtPharoLinkRemoteViewedObjectProxy >> retriveFormattedItemsForViewSelector: methodName [
	"Pass the #retriveItemsForViewSelector:  request on to the receiver's object, which is a GtViewedObject"
	| message |

	self assert: (PharoLinkRegistry isPrimitive: methodName).

	message := String streamContents: [ :stream |
		stream 
			<< 'self retriveFormattedItemsForViewSelector: #';
			<< methodName ].
	^ self evaluateSourceSequence: message
]

{ #category : 'accessing' }
TGtPharoLinkRemoteViewedObjectProxy >> retriveSentItemForViewSelector: methodName atIndex: selectionIndex [
	"Pass the #retriveSentItemForViewSelector:atIndex: request on to the receiver's object, which is a GtViewedObject"
	| message |

	self assert: (PharoLinkRegistry isPrimitive: methodName).
	self assert: (PharoLinkRegistry isPrimitive: selectionIndex).

	message := String streamContents: [ :stream |
		stream 
			<< 'self retriveFormattedItemsForViewSelector: #';
			<< methodName;
			<< ' atIndex: ';
			<< selectionIndex asString ].
	^ self evaluateSourceSequence: message
]
