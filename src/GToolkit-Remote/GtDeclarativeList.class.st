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
		items: ((aDictionary at: #items) collect: [ :each | each asRopedText ]);
		yourself
]

{ #category : #converting }
GtDeclarativeList >> asDictionaryForExport [ 

	^super asDictionaryForExport 
		at: #items put: items;
		yourself
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
		items: [ self items ].
	list
		send: [ :arg :event | accessor viewItemAt: event selection from ].
	^list
]
