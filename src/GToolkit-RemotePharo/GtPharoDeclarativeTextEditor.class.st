Class {
	#name : #GtPharoDeclarativeTextEditor,
	#superclass : #GtPharoDeclarativeView,
	#instVars : [
		'string'
	],
	#category : #'GToolkit-RemotePharo-Server'
}

{ #category : #'instance creation' }
GtPharoDeclarativeTextEditor class >> fromJSONDictionary: aDictionary [

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
]

{ #category : #converting }
GtPharoDeclarativeTextEditor >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string ].
	^dictionary
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> data [ 

	^string
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> sentItemAt: selector [ 

	^ self shouldNotImplement 
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> string [

	^ string ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ].

]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> string: anObject [
	string := anObject
]

{ #category : #'building - graph' }
GtPharoDeclarativeTextEditor >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView textEditor 
		title: title;
		priority: priority;
		text: [ self string asRopedText ]
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> viewName [ 

	^ #GtDeclarativeTextEditor
]
