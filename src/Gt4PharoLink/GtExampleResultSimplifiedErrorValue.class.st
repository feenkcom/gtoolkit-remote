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
GtExampleResultSimplifiedErrorValue >> asGtExampleResultPreviewElement [

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
				   text: 'Error converted to string';
				   background: BrGlamorousColors errorBackgroundColor);
		  addChild: (BrEditor new
				   aptitude: BrGlamorousRegularEditorAptitude;
				   text: self description asString;
				   fitContentLimited)
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
