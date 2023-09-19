"
GtDeclarativeList supports a subset of the possible configurations of {{gtClass:name=GtPhlowListView}}.

 
## Internal Representation and Key Implementation Points.

### Instance Variables
	itemsBuilder: 	{{gtClass:BlockClosure}} - A BlockClosure that will return the (unformatted) list of items to be displayed.
	items:				{{gtClass:Array}} - The formatted items to display (not the raw values held in the list)
	itemTextBlock: 	{{gtClass:BlockClosure}} - A BlockClosure (or Symbol) that converts each item to its displayed format.  The result of the BlockClosure must be a JSON primitive type, effectively a string or number.


### Implementation Points

"
Class {
	#name : #GtRemotePhlowListView,
	#superclass : #GtRemotePhlowListingView,
	#instVars : [
		'itemTextBlock'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowListView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource 
			forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowViewSpecification dataLazy.
]

{ #category : #'private - accessing' }
GtRemotePhlowListView >> itemComputation [

	^ self itemText
]

{ #category : #accessing }
GtRemotePhlowListView >> itemText [
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ] 
]

{ #category : #'api - scripting' }
GtRemotePhlowListView >> itemText: aBlockClosure [

	itemTextBlock := aBlockClosure
]
