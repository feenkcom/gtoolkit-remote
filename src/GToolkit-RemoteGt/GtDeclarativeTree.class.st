Class {
	#name : #GtDeclarativeTree,
	#superclass : #GtDeclarativeView,
	#instVars : [
		'itemTextBlock',
		'childrenBlock',
		'items'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : #'instance creation' }
GtDeclarativeTree class >> fromJSONDictionary: aDictionary [
	| view |

	view := super fromJSONDictionary: aDictionary.
	view dataTransport = self dataIncluded ifTrue: 
		[ view items: (aDictionary at: #items) ].
	view 
		itemText: [ :item | item first ];
		children: [ :item | item last ].
	^ view
]

{ #category : #accessing }
GtDeclarativeTree >> children: aBlock [ 

	childrenBlock := aBlock
]

{ #category : #accessing }
GtDeclarativeTree >> data [ 

	^ items
]

{ #category : #initialization }
GtDeclarativeTree >> initialize [

	super initialize.
	itemTextBlock := [ :item | item asString ].

]

{ #category : #accessing }
GtDeclarativeTree >> itemText: aBlock [ 

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtDeclarativeTree >> items [ 

	^ items 
]

{ #category : #accessing }
GtDeclarativeTree >> items: aBlock [ 

	items := aBlock
]

{ #category : #accessing }
GtDeclarativeTree >> sentItemAt: selection [ 
	"Answer the raw value at the supplied index"

	^ accessor itemsBuilder value at: selection.
]

{ #category : #'building - graph' }
GtDeclarativeTree >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^ aView tree
		title: title;
		priority: priority;
		items: [ items ];
		itemText: itemTextBlock;
		children: childrenBlock;
		send: [ :item :selection | accessor gtSentItemFor: methodName at: item second ]
]
