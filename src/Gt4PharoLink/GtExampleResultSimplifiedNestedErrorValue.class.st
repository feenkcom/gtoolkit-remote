Class {
	#name : #GtExampleResultSimplifiedNestedErrorValue,
	#superclass : #Object,
	#traits : 'TGtExampleResultValue',
	#classTraits : 'TGtExampleResultValue classTrait',
	#instVars : [
		'description'
	],
	#category : #'Gt4PharoLink-Example Runtime'
}

{ #category : #accessing }
GtExampleResultSimplifiedNestedErrorValue class >> leJsonV4Name [ 

	^ #gtExampleResultSimplifiedNestedErrorValue
]

{ #category : #'api - converting' }
GtExampleResultSimplifiedNestedErrorValue >> asGtExampleResultPreviewElementFor: anExample [

	^ GtPharoLinkExampleUtility
		  resultPreviewElementWithTitle: 'Nested Error converted to string'
		  description: self description asString
		  background: BrGlamorousColors errorBackgroundColor
		  example: anExample
]

{ #category : #'api - converting' }
GtExampleResultSimplifiedNestedErrorValue >> asGtSimplifiedExampleResultValue [

	"Return an example result value with a simplified value, e.g., string, number."

	^ self
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedNestedErrorValue >> color [

	^ Color fromHexString: #ffd666
]

{ #category : #accessing }
GtExampleResultSimplifiedNestedErrorValue >> description [

	^ description
]

{ #category : #accessing }
GtExampleResultSimplifiedNestedErrorValue >> description: aString [

	self
		assert: [ description isNil ]
		description: [ 'Failure value can be initialized only once' ].

	description := aString
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedNestedErrorValue >> iconForm [

	^ ThemeIcons current iconNamed: #testYellow
]

{ #category : #'api - testing' }
GtExampleResultSimplifiedNestedErrorValue >> isError [

	^ true
]

{ #category : #'api - accessing' }
GtExampleResultSimplifiedNestedErrorValue >> value [

	^ self description
]
