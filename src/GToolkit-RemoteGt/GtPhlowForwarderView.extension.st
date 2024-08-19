Extension { #name : #GtPhlowForwarderView }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwarderView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"


	^ GtPhlowForwardViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeForwardViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwarderView >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self phlowView asAsyncPromise wait canBeGtDeclarativeView
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowForwarderView >> computeForwardedView [
	| targetObject computedView |
	
	[ targetObject := self object value ] 
		on: Error do: [ :anError |
			^ self 
				phlowErrorViewWithException: anError ].
				
	computedView := self on: targetObject perform: self viewSymbol.
	
	computedView class = self class ifTrue: [
		"If this forward is to another forward view we follow the chain
		to reach the first view that is now a forward view."
		^ computedView computeForwardedView ].
		
	^ computedView
]
