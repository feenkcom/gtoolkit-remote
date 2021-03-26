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
	#name : #GtPharoDeclarativeList,
	#superclass : #GtPharoDeclarativeView,
	#instVars : [
		'items',
		'itemsBuilder',
		'itemTextBlock'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoDeclarativeList class >> fromJSONDictionary: aDictionary [
	| list |

	list := super fromJSONDictionary: aDictionary.
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : #converting }
GtPharoDeclarativeList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self data ].
	^dictionary
]

{ #category : #accessing }
GtPharoDeclarativeList >> data [ 
	"Answer the list of display strings"

	^ items ifNil: [ items := itemsBuilder value collect: itemTextBlock ]
]

{ #category : #initialization }
GtPharoDeclarativeList >> initialize [ 

	super initialize.
	itemTextBlock := [ :item | item asString ]
]

{ #category : #'api - scripting' }
GtPharoDeclarativeList >> itemText: aBlockClosure [

	itemTextBlock := aBlockClosure
]

{ #category : #accessing }
GtPharoDeclarativeList >> itemTextBlock [
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock
]

{ #category : #'api - scripting' }
GtPharoDeclarativeList >> items: aBlockClosure [
	"Set the block closure that will be used to construct the items.
	Note that this doesn't set the items instance variable (as one might expect)"

	itemsBuilder := aBlockClosure
]

{ #category : #accessing }
GtPharoDeclarativeList >> sentItemAt: selection [ 
	"Answer the raw value at the supplied index"

	^ itemsBuilder value at: selection.
]

{ #category : #accessing }
GtPharoDeclarativeList >> viewName [
	"Answer the name of the receivers matching view in the Gt image"

	^ #GtDeclarativeList
]
