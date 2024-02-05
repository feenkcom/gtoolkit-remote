Extension { #name : #GtRemotePhlowTextAttributeRunsStylerSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowTextAttributeRunsStylerSpecification >> createBlStyler [
	^ GtRemotePhlowLocalTextAttributeRunsStyler new 
		attributedRuns:  attributedRuns
]
