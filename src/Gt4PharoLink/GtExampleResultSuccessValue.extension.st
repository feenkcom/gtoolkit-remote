Extension { #name : #GtExampleResultSuccessValue }

{ #category : #'*Gt4PharoLink' }
GtExampleResultSuccessValue >> asGtSimplifiedExampleResultValue [

	^ GtExampleResultSimplifiedSuccessValue new description:
		  self value printString
]
