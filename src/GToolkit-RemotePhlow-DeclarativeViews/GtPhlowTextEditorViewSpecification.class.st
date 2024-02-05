Class {
	#name : #GtPhlowTextEditorViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'string',
		'textStyler',
		'dataSource'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowTextEditorViewSpecification class >> fromJSONDictionary: aDictionary [
	| editor |
	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded
		ifTrue: [ editor string: (aDictionary at: #string).
			aDictionary
				at: #textStyler
				ifPresent: [ :aTextStylerSpecificationData | 
					editor
						textStyler: (#GtRemotePhlowTextStylerSpecification asClass
								fromJSONDictionary: aTextStylerSpecificationData) ] ]
		ifFalse: [ editor dataSource: (aDictionary at: #dataSource) ].
	^ editor
]

{ #category : #converting }
GtPhlowTextEditorViewSpecification >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string.
		textStyler ifNotNil: [
			dictionary 
				at: #textStyler 
				put: textStyler asDictionaryForExport ] ].
	
	^ dictionary
]

{ #category : #accessing }
GtPhlowTextEditorViewSpecification >> dataSource [
	^ dataSource
]

{ #category : #accessing }
GtPhlowTextEditorViewSpecification >> dataSource: anObject [
	dataSource := anObject
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
GtPhlowTextEditorViewSpecification >> textStyler: aTextAttributeRuns [
	textStyler := aTextAttributeRuns
]
