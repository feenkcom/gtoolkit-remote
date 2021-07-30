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
		'items',
		'itemsBuilder',
		'itemTextBlock',
		'totalItemsCount'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeList class >> fromJSONDictionary: aDictionary [
	| list |

	list := super fromJSONDictionary: aDictionary.
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : 'converting' }
GtRemotePhlowDeclarativeList >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtDeclarativeListView new 
		phlowDataSource: (GtPhlowDeclarativeViewListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtDeclarativeView dataLazy.
]

{ #category : 'initialization' }
GtRemotePhlowDeclarativeList >> initialize [ 

	super initialize.
	itemTextBlock := [ :item | item asString ].
	dataTransport := self class dataLazy.
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeList >> itemText [
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock
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
	^ itemsBuilder
]
