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

	^(super fromJSONDictionary: aDictionary)
		items: (aDictionary at: #items);
		yourself
]

{ #category : #converting }
GtDeclarativeList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: items ].
	^dictionary
]

{ #category : #private }
GtDeclarativeList >> ensureItemsLoaded [
	"Ensure that the receiver has retrieved the items from the remote"

	^items ifNil: [ items := accessor retrieve: #items ]
]

{ #category : #accessing }
GtDeclarativeList >> items [
	^ items
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
		items: [ self ensureItemsLoaded. self items collect: #asRopedText ].
	list
		send: [ :arg :selection | accessor sentItemAt: selection from ].
	^list
]
