Class {
	#name : #GtRemoteTextStylerComputableSpecification,
	#superclass : #GtRemotePhlowTextStylerSpecification,
	#instVars : [
		'stylerComputation'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #converting }
GtRemoteTextStylerComputableSpecification >> convertToSerializableSpecificationForText: aText [
	| computedStyler styledText |
	
	computedStyler := self stylerComputation value.
	styledText := computedStyler style: aText.
	^ GtRemotePhlowTextAttributeRunsStylerSpecification new
		attributeRuns: styledText extractRemotePhlowRuns
]

{ #category : #accessing }
GtRemoteTextStylerComputableSpecification >> stylerComputation [
	^ stylerComputation
]

{ #category : #accessing }
GtRemoteTextStylerComputableSpecification >> stylerComputation: aComputation [
	stylerComputation := aComputation
]
