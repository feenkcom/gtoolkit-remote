Class {
	#name : #GtPharoLinkExampleUtility,
	#superclass : #Object,
	#category : #'Gt4PharoLink-Example Runtime'
}

{ #category : #accessing }
GtPharoLinkExampleUtility class >> resultPreviewElementWithTitle: aTitle description: aDescription background: aColor example: anExample [

	^ BrVerticalPane new
		  width: 200;
		  vFitContent;
		  constraintsDo: [ :c | c maxHeight: 200 ];
		  addChild: (BrLabel new
				   aptitude: BrGlamorousLabelAptitude new;
				   padding: (BlInsets all: 5);
				   hMatchParent;
				   vFitContent;
				   text: aTitle;
				   background: aColor;
				   constraintsDo: [ :c | c linear horizontal alignLeft ]);
		  addChild: (BrEditor new
				   aptitude: BrGlamorousRegularEditorAptitude;
				   text: aDescription;
				   fitContentLimited;
				   constraintsDo: [ :c | c linear horizontal alignLeft ]);
		  addChild:
			  ((GtCoderUIUtility exampleExecutionToolbarFor: anExample)
				   margin: (BlInsets bottom: 5);
				   constraintsDo: [ :c | c linear horizontal alignCenter ])
]
