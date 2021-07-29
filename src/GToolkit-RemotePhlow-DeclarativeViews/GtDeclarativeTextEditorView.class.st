Class {
	#name : 'GtDeclarativeTextEditorView',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'string'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'instance creation' }
GtDeclarativeTextEditorView class >> fromJSONDictionary: aDictionary [

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
]

{ #category : 'converting' }
GtDeclarativeTextEditorView >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string ].
	^dictionary
]

{ #category : 'accessing' }
GtDeclarativeTextEditorView >> string [

	^ string "ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ]."

]

{ #category : 'accessing' }
GtDeclarativeTextEditorView >> string: anObject [
	string := anObject
]
