Class {
	#name : 'GtRemotePhlowDeclarativeTextEditor',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'textBuilder'
	],
	#category : 'GToolkit-RemotePhlow'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeTextEditor class >> fromJSONDictionary: aDictionary [

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
]

{ #category : 'converting' }
GtRemotePhlowDeclarativeTextEditor >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: self data ].
	^dictionary
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTextEditor >> data [ 

	^ textBuilder value
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTextEditor >> sentItemAt: selector [ 

	^ self shouldNotImplement 
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTextEditor >> text: aBlockClosure [
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTextEditor >> viewName [ 

	^ #GtDeclarativeTextEditor
]
