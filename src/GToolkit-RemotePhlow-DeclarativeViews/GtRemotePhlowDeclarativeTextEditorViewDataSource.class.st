Class {
	#name : #GtRemotePhlowDeclarativeTextEditorViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTextEditorViewDataSource >> computeText [ 
	| computedText stylerSpecification |
	computedText := self phlowView textBuilder value asRopedText.
	stylerSpecification := self 
		createRemotePhlowStylerSpecificationForText: computedText.
		
	stylerSpecification ifNil: [
		stylerSpecification := GtRemotePhlowTextAttributeRunsStylerSpecification new 
			attributeRuns: computedText extractRemotePhlowRuns ].

	^ GtRemotePhlowText new
		string: computedText asString;
		stylerSpecification: stylerSpecification
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextEditorViewDataSource >> createRemotePhlowStylerSpecificationForText: aText [
	| stylerSpecification |
	
	stylerSpecification := self phlowView stylerSpecification.
	stylerSpecification ifNil: [ ^ nil ].
	stylerSpecification canAffectText ifFalse: [ ^ nil ].
	
	^ stylerSpecification 
		convertToSerializableSpecificationForText: aText.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextEditorViewDataSource >> getText [ 
	^ self computeText asDictionaryForExport
]
