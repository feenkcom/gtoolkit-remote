"
I represent a simplified error value in {{gtClass:GtExampleResult}}.
Such error may be represented as a string, using {{gtMethod:Object>>#printString}}.

"
Class {
	#name : #GtExampleResultSimplifiedErrorValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'description'
	],
	#category : #'Gt4PharoLink-Example Runtime'
}

{ #category : #'api - converting' }
GtExampleResultSimplifiedErrorValue >> asGtExampleResultPreviewElementFor: anExample [

	^ GtPharoLinkExampleUtility
		  resultPreviewElementWithTitle: 'Error converted to string'
		  description: self description asString
		  background: BrGlamorousColors errorBackgroundColor
		  example: anExample
]

{ #category : #'api - converting' }
GtExampleResultSimplifiedErrorValue >> asGtSimplifiedExampleResultValue [

	"Return an example result value with a simplified value, e.g., string, number."

	^ self
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedErrorValue >> color [

	^ Color fromHexString: #ffd666
]

{ #category : #accessing }
GtExampleResultSimplifiedErrorValue >> description [

	^ description
]

{ #category : #accessing }
GtExampleResultSimplifiedErrorValue >> description: aString [

	self
		assert: [ description isNil ]
		description: [ 'Failure value can be initialized only once' ].

	description := aString
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedErrorValue >> iconForm [

	^ ThemeIcons current iconNamed: #testYellow
]

{ #category : #'api - testing' }
GtExampleResultSimplifiedErrorValue >> isError [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedErrorValue >> value [

	^ self description
]
