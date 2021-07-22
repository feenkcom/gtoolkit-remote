Class {
	#name : 'GtDeclarativeTable',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'items'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : 'instance creation' }
GtDeclarativeTable class >> fromJSONDictionary: aDictionary [

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
]

{ #category : 'converting' }
GtDeclarativeTable >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
]

{ #category : 'accessing' }
GtDeclarativeTable >> data [ 

	^ items
]

{ #category : 'accessing' }
GtDeclarativeTable >> items [
	^ items
]

{ #category : 'accessing' }
GtDeclarativeTable >> items: anObject [
	items := anObject
]

{ #category : 'building - graph' }
GtDeclarativeTable >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| table |

	table := aView table 
		title: title;
		priority: priority;
		items: [ self data ];
		forCollectionOfCollection.
	"table
		send: [ :arg :selection | accessor gtSentItemFor: methodName at: selection from ]."
	^table
]
