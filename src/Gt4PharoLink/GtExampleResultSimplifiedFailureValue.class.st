"
I represent a simplified failure value in {{gtClass:GtExampleResult}}.
Such failure may be represented as a string, using {{gtMethod:Object>>#printString}}.

"
Class {
	#name : #GtExampleResultSimplifiedFailureValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'description'
	],
	#category : #'Gt4PharoLink-Example Runtime'
}

{ #category : #'api - converting' }
GtExampleResultSimplifiedFailureValue >> asGtExampleResultPreviewElementFor: anExample [

	^ GtPharoLinkExampleUtility
		  resultPreviewElementWithTitle: 'Failure converted to string'
		  description: self description asString
		  background: BrGlamorousColors failureBackgroundColor
		  example: anExample
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedFailureValue >> color [

	^ Color fromHexString: #ffd666
]

{ #category : #accessing }
GtExampleResultSimplifiedFailureValue >> description [

	^ description
]

{ #category : #accessing }
GtExampleResultSimplifiedFailureValue >> description: aString [

	self
		assert: [ description isNil ]
		description: [ 'Failure value can be initialized only once' ].

	description := aString
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedFailureValue >> iconForm [

	^ ThemeIcons current iconNamed: #testYellow
]

{ #category : #'api - testing' }
GtExampleResultSimplifiedFailureValue >> isFailure [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedFailureValue >> value [

	^ self description
]
