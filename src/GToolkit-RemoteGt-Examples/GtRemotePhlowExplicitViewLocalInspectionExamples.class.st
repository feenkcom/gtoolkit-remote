Class {
	#name : #GtRemotePhlowExplicitViewLocalInspectionExamples,
	#superclass : #GtRemotePhlowExplicitViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #testing }
GtRemotePhlowExplicitViewLocalInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowExplicitViewLocalInspectionExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewLocalInspectionExamples >> altClickOnExplicitErrorViewTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnExplicitErrorViewTabOpensDefinition.
	self 
		assertSecondPaneHasLocalMethodWithSelector: #gtExplicitPictureViewWithStencilErrorFor: 
		in: scripter.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewLocalInspectionExamples >> altClickOnExplicitViewTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnExplicitViewTabOpensDefinition.
	self 
		assertSecondPaneHasLocalMethodWithSelector: #gtExplicitPictureViewWithDirectlySerializableFor: 
		in: scripter.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewLocalInspectionExamples >> errorTestObjectSelectStencilDataErrorView_debugButton [
	<gtExample>
	| scripter |
	scripter := self errorTestObjectSelectStencilDataErrorView.
	
	scripter checkStep: [ :aStep | 
		aStep
			label: 'Debug exception button present';
			value: [:aButton | aButton label asString ]
					equals: [ 'Open debugger' ];
			// GtPhlowExceptionId;
			// BrDebuggableElementOpenDebuggerButtonId ]
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewLocalInspectionExamples >> errorTestObjectSelectStencilErrorView_debugButton [
	<gtExample>
	| scripter |
	scripter := self errorTestObjectSelectStencilErrorView.
	
	scripter checkStep: [ :aStep | 
		aStep
			label: 'Debug exception button present';
			value: [:aButton | aButton label asString ]
					equals: [ 'Open debugger' ];
			// GtPhlowExceptionId;
			// BrDebuggableElementOpenDebuggerButtonId ]
]
