Extension { #name : #GtRemotePhlowTextParserStylerSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowTextParserStylerSpecification >> createBlStyler [
	^ self parserClassName asClass gtStyler
]
