Extension { #name : #GtExampleResultFailureValue }

{ #category : #'*Gt4PharoLink' }
GtExampleResultFailureValue >> asGtSimplifiedExampleResultValue [

	^ GtExampleResultSimplifiedFailureValue new description:
		  self failure printString
]
