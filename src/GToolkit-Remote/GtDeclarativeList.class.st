Class {
	#name : #GtDeclarativeList,
	#superclass : #GtDeclarativeView,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #'instance creation' }
GtDeclarativeList class >> fromJSONDictionary: aDictionary [
	| list |

	list := super fromJSONDictionary: aDictionary.
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : #converting }
GtDeclarativeList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: items ].
	^dictionary
]

{ #category : #accessing }
GtDeclarativeList >> data [ 

	^items
]

{ #category : #accessing }
GtDeclarativeList >> items [

	^items ifNil: [ 
		(items isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ items := accessor data ] ].

]

{ #category : #accessing }
GtDeclarativeList >> items: anObject [
	items := anObject
]

{ #category : #'building - graph' }
GtDeclarativeList >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView list 
		title: title;
		priority: priority;
		items: [ self items collect: #asRopedText ].
	list
		send: [ :arg :selection | accessor sentItemAt: selection from ].
	^list
]
