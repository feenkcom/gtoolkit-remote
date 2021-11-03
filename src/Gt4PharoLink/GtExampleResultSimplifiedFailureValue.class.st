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
GtExampleResultSimplifiedFailureValue >> asGtExampleResultPreviewElement [

	^ BrVerticalPane new
		  alignTopLeft;
		  width: 200;
		  vFitContent;
		  constraintsDo: [ :c | c maxHeight: 200 ];
		  addChild: (BrLabel new
				   aptitude: BrGlamorousLabelAptitude new;
				   padding: (BlInsets all: 5);
				   hMatchParent;
				   vFitContent;
				   text: 'Failure converted to string';
				   background: BrGlamorousColors failureBackgroundColor);
		  addChild: (BrEditor new
				   aptitude: BrGlamorousRegularEditorAptitude;
				   text: self description asString;
				   fitContentLimited)
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
