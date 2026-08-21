Class {
	#name : #GtRemotePhlowPictureViewLocalInspectionExamples,
	#superclass : #GtRemotePhlowPictureViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #testing }
GtRemotePhlowPictureViewLocalInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowPictureViewLocalInspectionExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewLocalInspectionExamples >> altClickOnErrorTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnErrorTabOpensDefinition.
	
	(scripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [#gtViewPictureErrorFor:];
		play.
		
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewLocalInspectionExamples >> altClickOnPictureTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnPictureTabOpensDefinition.
		
	(scripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [#gtViewPictureFor:];
		play.
		
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewLocalInspectionExamples >> errorViewShowsDebuggableElement_debugButton [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	
	scripter 
		check: 'Inspect exception button present'
		do: [:aStep |
			(aStep check)
				value: [:aButton | aButton label asString ]
					equals: [ 'Open debugger' ];
				// GtPhlowExceptionId;
				// BrDebuggableElementOpenDebuggerButtonId;
				play].
]
