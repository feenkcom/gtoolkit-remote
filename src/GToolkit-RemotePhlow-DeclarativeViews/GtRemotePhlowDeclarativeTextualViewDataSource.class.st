Class {
	#name : #GtRemotePhlowDeclarativeTextualViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeTextualViewDataSource >> computeText [
	| computedText stylerSpecification highlight |
	computedText := self phlowView textBuilder value asRopedText.
	stylerSpecification := self
			createRemotePhlowStylerSpecificationForText: computedText.

	stylerSpecification
		ifNil: [ stylerSpecification := GtRemotePhlowTextAttributeRunsStylerSpecification new
					attributeRuns: computedText extractRemotePhlowRuns ].

	self phlowView highlighterSpecification
		ifNotNil: [ :spec | highlight := spec value ].

	^ GtRemotePhlowStylableText new
		string: computedText asString;
		stylerSpecification: stylerSpecification;
		highlight: highlight
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
