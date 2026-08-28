Class {
	#name : #GtRemotePhlowExplicitViewLocalInspectionExamples,
	#superclass : #GtRemotePhlowExplicitViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #testing }
GtRemotePhlowExplicitViewLocalInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowExplicitViewLocalInspectionExamples
]

{ #category : #examples }
GtRemotePhlowExplicitViewLocalInspectionExamples >> altClickOnExplicitErrorViewTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnExplicitErrorViewTabOpensDefinition.
	
	(scripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [#gtExplicitPictureViewWithStencilErrorFor:];
		play.
		
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewLocalInspectionExamples >> altClickOnExplicitViewTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnExplicitViewTabOpensDefinition.
		
	(scripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [#gtExplicitPictureViewWithDirectlySerializableFor:];
		play.
		
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewLocalInspectionExamples >> errorTestObjectSelectStencilDataErrorView_debugButton [
	<gtExample>
	| scripter |
	scripter := self errorTestObjectSelectStencilDataErrorView.
	
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

{ #category : #examples }
GtRemotePhlowExplicitViewLocalInspectionExamples >> errorTestObjectSelectStencilErrorView_debugButton [
	<gtExample>
	| scripter |
	scripter := self errorTestObjectSelectStencilErrorView.
	
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
