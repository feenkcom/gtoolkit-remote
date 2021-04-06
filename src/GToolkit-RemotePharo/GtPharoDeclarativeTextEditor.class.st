Class {
	#name : #GtPharoDeclarativeTextEditor,
	#superclass : #GtPharoDeclarativeView,
	#instVars : [
		'textBuilder'
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
		dictionary at: #string put: self data ].
	^dictionary
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> data [ 

	^ textBuilder value
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> sentItemAt: selector [ 

	^ self shouldNotImplement 
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> text: aBlockClosure [
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
]

{ #category : #accessing }
GtPharoDeclarativeTextEditor >> viewName [ 

	^ #GtDeclarativeTextEditor
]
