Extension { #name : #PharoLinkProxyObject }

{ #category : #'*Gt4PharoLink' }
PharoLinkProxyObject >> getViewProxy [
	"Answer a GtViewedProxy on the receiver"

	^ self newCommandFactory
		<< 'llCommand gtViewedObjectClass object: self';
		sendAndWait.

]
