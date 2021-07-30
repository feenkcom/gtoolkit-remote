"
GtDeclarativeList supports a subset of the possible configurations of ${class:name=GtPhlowListView}.

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	itemsBuilder: 	<BlockClosure> - A BlockClosure that will return the (unformatted) list of items to be displayed.
	items:				<Array> - The formatted items to display (not the raw values held in the list)
	itemTextBlock: 	<BlockClosure> - A BlockClosure (or Symbol) that converts each item to its displayed format.  The result of the BlockClosure must be a JSON primitive type, effectively a string or number.


!!!Implementation Points
"
Class {
	#name : 'GtRemotePhlowDeclarativeList',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'itemsBuilder',
		'itemTextBlock',
		'sendBlock'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'converting' }
GtRemotePhlowDeclarativeList >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowDeclarativeView dataLazy.
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeList >> itemText [
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ] 
]

{ #category : 'api - scripting' }
GtRemotePhlowDeclarativeList >> itemText: aBlockClosure [

	itemTextBlock := aBlockClosure
]

{ #category : 'api - scripting' }
GtRemotePhlowDeclarativeList >> items: aBlockClosure [
	"Set the block closure that will be used to construct the items.
	Note that this doesn't set the items instance variable (as one might expect)"

	itemsBuilder := aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeList >> itemsBuilder [
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ { } ] ]
]

{ #category : 'api - scripting' }
GtRemotePhlowDeclarativeList >> send: aBlock [

	self
		assert: [ aBlock isNotNil ]
		description: [ 'Send transformation block must be non-nil'  ].
	aBlock isSymbol ifTrue: [ 
		self 
			assert: [ aBlock isUnary ]
			description: [ 'Send transformation symbol must be unary' ] ].
	sendBlock := aBlock.
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeList >> transformation [ 	
	^ sendBlock ifNil: [ 
		sendBlock := [ :object | object ] ]
]
