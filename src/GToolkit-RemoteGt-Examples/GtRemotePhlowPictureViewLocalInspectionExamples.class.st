Class {
	#name : #GtRemotePhlowPictureViewLocalInspectionExamples,
	#superclass : #GtRemotePhlowPictureViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
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
	self 
		assertSecondPaneHasLocalMethodWithSelector: #gtViewPictureErrorFor: 
		in: scripter.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewLocalInspectionExamples >> altClickOnPictureTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnPictureTabOpensDefinition.
	self 
		assertSecondPaneHasLocalMethodWithSelector: #gtViewPictureFor: 
		in: scripter.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewLocalInspectionExamples >> errorViewShowsDebuggableElement_debugButton [
	<gtExample>
	| scripter |
	scripter := self errorViewShowsDebuggableElement.
	
	scripter checkStep: [:aStep |
			aStep
				label: 'Inspect exception button present';
				value: [:aButton | aButton label asString ]
					equals: [ 'Open debugger' ];
				// GtPhlowExceptionId;
				// BrDebuggableElementOpenDebuggerButtonId ].
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewLocalInspectionExamples >> heightErrorViewShowsDebuggableElement_debugButton [
	<gtExample>
	| scripter |
	scripter := self heightErrorViewShowsDebuggableElement.
	
	scripter checkStep: [:aStep |
			aStep
				label: 'Inspect exception button present';
				value: [:aButton | aButton label asString ]
					equals: [ 'Open debugger' ];
				// GtPhlowExceptionId;
				// BrDebuggableElementOpenDebuggerButtonId ].
]
