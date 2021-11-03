Extension { #name : #GtExampleResultSimplifiedFailureValue }

{ #category : #'*GToolkit-Coder-UI' }
GtExampleResultSimplifiedFailureValue >> asGtExampleResultPreviewElementFor: anExample [

	^ GtPharoLinkExampleUtility
		  resultPreviewElementWithTitle: 'Failure converted to string'
		  description: self description asString
		  background: BrGlamorousColors failureBackgroundColor
		  example: anExample
]
