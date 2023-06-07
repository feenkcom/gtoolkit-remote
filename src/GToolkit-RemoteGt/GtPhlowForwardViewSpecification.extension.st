Extension { #name : #GtPhlowForwardViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwardViewSpecification >> gtComputedViewFor: aView [
	"This method acts like a fake view method that just delegates the view 
	creation to the computed specification."
	
	^ self loadViewSpecificationForForwarding viewFor: aView
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwardViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver. We use a forwarder view as
	a way to delegate the creation of the remote view back to this specification."

	| list |

	list := aView forward 
		title: title;
		priority: priority;
		object: [ self ];
		view: #gtComputedViewFor:.
		
	^list
]
