Class {
	#name : #GtPhlowDeclarativeTreeView,
	#superclass : #GtPhlowDeclarativeView,
	#instVars : [
		'itemTextBlock',
		'childrenBlock',
		'items'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeTreeView class >> fromJSONDictionary: aDictionary [
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
GtPhlowDeclarativeTreeView >> children: aBlock [ 

	childrenBlock := aBlock
]

{ #category : #initialization }
GtPhlowDeclarativeTreeView >> initialize [

	super initialize.
	itemTextBlock := [ :item | item asString ].

]

{ #category : #accessing }
GtPhlowDeclarativeTreeView >> itemText: aBlock [ 

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtPhlowDeclarativeTreeView >> items [ 

	^ items 
]

{ #category : #accessing }
GtPhlowDeclarativeTreeView >> items: aBlock [ 

	items := aBlock
]
