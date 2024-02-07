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
		ifTrue: [ 
			editor string: (aDictionary at: 'string').
			aDictionary
				at: 'textStyler'
				ifPresent: [ :aTextStylerSpecificationData | 
					editor
						textStyler: (#GtRemotePhlowTextStylerSpecification asClass
								fromJSONDictionary: aTextStylerSpecificationData) ] ]
		ifFalse: [ 
			(aDictionary includesKey: 'dataSource') ifTrue: [
				editor phlowDataSource: (aDictionary at: 'dataSource')] ].
	^ editor
]

{ #category : #converting }
GtPhlowTextEditorViewSpecification >> asDictionaryForExport [ 
	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: 'string' put: string.
		textStyler ifNotNil: [
			dictionary 
				at: 'textStyler'
				put: textStyler asDictionaryForExport ] ].
	
	^ dictionary
]

{ #category : #'api - accessing' }
GtPhlowTextEditorViewSpecification >> getText [
	^ self phlowDataSource getText
]

{ #category : #accessing }
GtPhlowTextEditorViewSpecification >> initializeFromInspector: anInspector [
	self dataTransport = self class dataIncluded ifTrue: [ ^ self ].
	
	phlowDataSource ifNil: [
		self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector) ]
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
