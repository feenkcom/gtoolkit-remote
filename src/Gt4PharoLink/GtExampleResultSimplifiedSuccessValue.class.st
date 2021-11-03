"
I represent a simplified success value in {{gtClass:GtExampleResult}}.
Such value may be represented as a string, using {{gtMethod:Object>>#printString}}.

"
Class {
	#name : #GtExampleResultSimplifiedSuccessValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'description'
	],
	#category : #'Gt4PharoLink-Example Runtime'
}

{ #category : #'api - converting' }
GtExampleResultSimplifiedSuccessValue >> asGtSimplifiedExampleResultValue [

	"Return an example result value with a simplified value, e.g., string, number."

	^ self
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedSuccessValue >> color [

	^ Color fromHexString: #'95de64'
]

{ #category : #accessing }
GtExampleResultSimplifiedSuccessValue >> description [

	^ description
]

{ #category : #accessing }
GtExampleResultSimplifiedSuccessValue >> description: aString [

	self
		assert: [ description isNil ]
		description: [ 'Failure value can be initialized only once' ].

	description := aString
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedSuccessValue >> iconForm [

	^ ThemeIcons current iconNamed: #testGreen
]

{ #category : #'api - testing' }
GtExampleResultSimplifiedSuccessValue >> isSuccess [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedSuccessValue >> value [

	^ self description
]
