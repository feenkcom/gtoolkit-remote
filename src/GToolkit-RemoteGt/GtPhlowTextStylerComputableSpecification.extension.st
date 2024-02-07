Extension { #name : #GtPhlowTextStylerComputableSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextStylerComputableSpecification >> convertToSerializableSpecificationForText: aText [
	| computedStyler styledText |
	
	computedStyler := self stylerComputation value.
	styledText := computedStyler style: aText.
	^ GtRemotePhlowTextAttributeRunsStylerSpecification new
		attributeRuns: styledText extractRemotePhlowRuns
]
