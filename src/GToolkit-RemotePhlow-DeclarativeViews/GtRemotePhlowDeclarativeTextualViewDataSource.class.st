Class {
	#name : #GtRemotePhlowDeclarativeTextualViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTextualViewDataSource >> computeText [ 
	| computedText stylerSpecification |
	computedText := self phlowView textBuilder value asRopedText.
	stylerSpecification := self 
		createRemotePhlowStylerSpecificationForText: computedText.
		
	stylerSpecification ifNil: [
		stylerSpecification := GtRemotePhlowTextAttributeRunsStylerSpecification new 
			attributeRuns: computedText extractRemotePhlowRuns ].

	^ GtRemotePhlowStylableText new
		string: computedText asString;
		stylerSpecification: stylerSpecification
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextualViewDataSource >> createRemotePhlowStylerSpecificationForText: aText [
	| stylerSpecification |
	
	stylerSpecification := self phlowView stylerSpecification.
	stylerSpecification ifNil: [ ^ nil ].
	stylerSpecification canAffectText ifFalse: [ ^ nil ].
	
	^ stylerSpecification 
		convertToSerializableSpecificationForText: aText.
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextualViewDataSource >> getText [ 
	^ self computeText asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextualViewDataSource >> retrieveStylableText [ 
	^ self computeText asDictionaryForExport
]
