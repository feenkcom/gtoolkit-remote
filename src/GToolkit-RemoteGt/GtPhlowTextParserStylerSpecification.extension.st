Extension { #name : #GtPhlowTextParserStylerSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextParserStylerSpecification >> convertToSerializableSpecificationForText: aText [
	^ GtRemotePhlowTextParserStylerSpecification new 
		parserClassName: parserClassName
]
