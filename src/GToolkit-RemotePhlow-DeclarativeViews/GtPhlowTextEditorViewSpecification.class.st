Class {
	#name : #GtPhlowTextEditorViewSpecification,
	#superclass : #GtPhlowTextualViewSpecification,
	#instVars : [
		'string',
		'dataSource',
		'textStylerSpecification'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowTextEditorViewSpecification class >> fromJSONDictionary: aDictionary [
	| editorViewSpecification |
	
	editorViewSpecification := super fromJSONDictionary: aDictionary.
	
	editorViewSpecification dataTransport = self dataIncluded
		ifTrue: [ 
			editorViewSpecification string: (aDictionary at: 'string').
			aDictionary
				at: 'textStylerSpecification'
				ifPresent: [ :aTextStylerSpecificationData | 
					editorViewSpecification
						textStylerSpecification: (#GtRemotePhlowTextStylerSpecification asClass
								fromJSONDictionary: aTextStylerSpecificationData) ] ]
		ifFalse: [ 
			(aDictionary includesKey: 'dataSource') ifTrue: [
				editorViewSpecification phlowDataSource: (aDictionary at: 'dataSource')] ].
	
	^ editorViewSpecification
]

{ #category : #converting }
GtPhlowTextEditorViewSpecification >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: 'string' put: string.
		textStylerSpecification ifNotNil: [
			dictionary 
				at: 'textStylerSpecification'
				put: textStylerSpecification asDictionaryForExport ] ].
	
	^ dictionary
]

{ #category : #accessing }
GtPhlowTextEditorViewSpecification >> string [

	^ string "ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ]."

]

{ #category : #accessing }
GtPhlowTextEditorViewSpecification >> string: anObject [
	string := anObject
]

{ #category : #accessing }
GtPhlowTextEditorViewSpecification >> textStylerSpecification: aTextAttributeRuns [
	textStylerSpecification := aTextAttributeRuns
]
