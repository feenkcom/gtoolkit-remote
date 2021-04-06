Class {
	#name : #GtDeclarativeTextEditor,
	#superclass : #GtDeclarativeView,
	#instVars : [
		'string'
	],
	#category : #'GToolkit-RemoteGt-Declarative Views'
}

{ #category : #'instance creation' }
GtDeclarativeTextEditor class >> fromJSONDictionary: aDictionary [

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
]

{ #category : #converting }
GtDeclarativeTextEditor >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string ].
	^dictionary
]

{ #category : #accessing }
GtDeclarativeTextEditor >> data [ 

	^string
]

{ #category : #accessing }
GtDeclarativeTextEditor >> sentItemAt: selector [ 

	^ self shouldNotImplement 
]

{ #category : #accessing }
GtDeclarativeTextEditor >> string [

	^ string ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ].

]

{ #category : #accessing }
GtDeclarativeTextEditor >> string: anObject [
	string := anObject
]

{ #category : #'building - graph' }
GtDeclarativeTextEditor >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView textEditor 
		title: title;
		priority: priority;
		text: [ self string asRopedText ]
]
