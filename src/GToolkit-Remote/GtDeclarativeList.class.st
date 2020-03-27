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
			[ items := accessor data asArray ] ].

]

{ #category : #accessing }
GtDeclarativeList >> items: anObject [
	items := anObject
]

{ #category : #accessing }
GtDeclarativeList >> sentItemAt: selection [ 

	^ self items at: selection.
]

{ #category : #'private - accessing' }
GtDeclarativeList >> sentItems [
	"Answer the collection of sent items of the receiver.
	This method is provided to facilitate the export of serialised view definitions by GtRemoteInspectorExporter and is not a general access method."

	^(1 to: self items size) collect:
		[ :i | accessor sentItemAt: i ]
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
		send: [ :arg :selection | accessor gtSentItemFor: methodName at: selection first ].
	^list
]
