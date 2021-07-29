Class {
	#name : 'GtDeclarativeTreeView',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'itemTextBlock',
		'childrenBlock',
		'items'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'instance creation' }
GtDeclarativeTreeView class >> fromJSONDictionary: aDictionary [
	| view |

	view := super fromJSONDictionary: aDictionary.
	view dataTransport = self dataIncluded ifTrue: 
		[ view items: (aDictionary at: #items) ].
	view 
		itemText: [ :item | item first ];
		children: [ :item | item last ].
	^ view
]

{ #category : 'accessing' }
GtDeclarativeTreeView >> children: aBlock [ 

	childrenBlock := aBlock
]

{ #category : 'initialization' }
GtDeclarativeTreeView >> initialize [

	super initialize.
	itemTextBlock := [ :item | item asString ].

]

{ #category : 'accessing' }
GtDeclarativeTreeView >> itemText: aBlock [ 

	itemTextBlock := aBlock
]

{ #category : 'accessing' }
GtDeclarativeTreeView >> items [ 

	^ items 
]

{ #category : 'accessing' }
GtDeclarativeTreeView >> items: aBlock [ 

	items := aBlock
]
