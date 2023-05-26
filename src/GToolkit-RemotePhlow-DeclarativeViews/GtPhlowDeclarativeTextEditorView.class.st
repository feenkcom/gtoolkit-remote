Class {
	#name : #GtPhlowDeclarativeTextEditorView,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'string'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowDeclarativeTextEditorView class >> fromJSONDictionary: aDictionary [

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
]

{ #category : #converting }
GtPhlowDeclarativeTextEditorView >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string ].
	^dictionary
]

{ #category : #accessing }
GtPhlowDeclarativeTextEditorView >> string [

	^ string "ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ]."

]

{ #category : #accessing }
GtPhlowDeclarativeTextEditorView >> string: anObject [
	string := anObject
]
