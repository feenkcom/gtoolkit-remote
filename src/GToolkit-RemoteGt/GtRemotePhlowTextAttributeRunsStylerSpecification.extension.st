Extension { #name : #GtRemotePhlowTextAttributeRunsStylerSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowTextAttributeRunsStylerSpecification >> createBlStyler [
	^ GtRemotePhlowLocalTextAttributeRunsStyler new 
		attributeRuns:  attributeRuns
]
