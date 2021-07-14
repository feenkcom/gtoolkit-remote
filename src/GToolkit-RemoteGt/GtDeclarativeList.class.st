"
GtDeclarativeList supports a subset of the possible configurations of ${class:name=GtPhlowListView}.

 
1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables

	items:		<Array> - The formatted items to display (not the raw values held in the list)


1. ## Implementation Points


"
Class {
	#name : 'GtDeclarativeList',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'items'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : 'instance creation' }
GtDeclarativeList class >> fromJSONDictionary: aDictionary [
	| list |

	list := super fromJSONDictionary: aDictionary.
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : 'converting' }
GtDeclarativeList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: items ].
	^dictionary
]

{ #category : 'accessing' }
GtDeclarativeList >> data [ 

	^items
]

{ #category : 'accessing' }
GtDeclarativeList >> items [

	^items ifNil: [ 
		(items isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ items := accessor data asArray ] ].

]

{ #category : 'accessing' }
GtDeclarativeList >> items: anObject [
	items := anObject
]

{ #category : 'accessing' }
GtDeclarativeList >> sentItemAt: selection [ 
	"Answer the raw value at the supplied index"

	^ accessor itemsBuilder value at: selection.
]

{ #category : 'building - graph' }
GtDeclarativeList >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView list 
		title: title;
		priority: priority;
		items: [ self items collect: #asRopedText ].
	list
		send: [ :arg :selection | accessor gtSentItemFor: methodName at: selection first ].
	^list
]
