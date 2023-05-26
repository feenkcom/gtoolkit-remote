Class {
	#name : #GtPhlowTreeViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'itemTextBlock',
		'childrenBlock',
		'items'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowTreeViewSpecification class >> fromJSONDictionary: aDictionary [
	| view |

	view := super fromJSONDictionary: aDictionary.
	view dataTransport = self dataIncluded ifTrue: 
		[ view items: (aDictionary at: #items) ].
	view 
		itemText: [ :item | item first ];
		children: [ :item | item last ].
	^ view
]

{ #category : #converting }
GtPhlowTreeViewSpecification >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self items ].
	^ dictionary
]

{ #category : #accessing }
GtPhlowTreeViewSpecification >> children: aBlock [ 

	childrenBlock := aBlock
]

{ #category : #initialization }
GtPhlowTreeViewSpecification >> initialize [

	super initialize.
	itemTextBlock := [ :item | item asString ].

]

{ #category : #accessing }
GtPhlowTreeViewSpecification >> itemText: aBlock [ 

	itemTextBlock := aBlock
]

{ #category : #accessing }
GtPhlowTreeViewSpecification >> items [ 

	^ items 
]

{ #category : #accessing }
GtPhlowTreeViewSpecification >> items: aBlock [ 

	items := aBlock
]
