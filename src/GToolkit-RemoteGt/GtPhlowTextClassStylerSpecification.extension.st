Extension { #name : #GtPhlowTextClassStylerSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTextClassStylerSpecification >> convertToSerializableSpecificationForText: aText [
	^ GtRemotePhlowTextClassStylerSpecification new 
		stylerClassName: stylerClassName
]
