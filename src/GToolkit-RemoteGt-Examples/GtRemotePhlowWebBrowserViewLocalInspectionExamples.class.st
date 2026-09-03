"
Shared local and simulation inspector examples for the web browser view.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewLocalInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #testing }
GtRemotePhlowWebBrowserViewLocalInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowWebBrowserViewLocalInspectionExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewLocalInspectionExamples >> altClickOnErrorTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnErrorTabOpensDefinition.
	self 
		assertSecondPaneHasLocalMethodWithSelector: #gtWebBrowserFor: 
		in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewLocalInspectionExamples >> altClickOnWebBrowserTabOpensDefinition_methodOpenedInSecondPane [
	<gtExample>
	| scripter |
	scripter := self altClickOnWebBrowserTabOpensDefinition.
	self 
		assertSecondPaneHasLocalMethodWithSelector: #gtWebBrowserFor: 
		in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewLocalInspectionExamples >> dynamicHeadersErrorViewShowsDebuggableElement_debugButton [
	<gtExample>
	| scripter |
	scripter := self dynamicHeadersErrorViewShowsDebuggableElement.
	
	scripter checkStep: [:aStep |
			aStep
				label: 'Inspect exception button present';
				value: [:aButton | aButton label asString ]
					equals: [ 'Open debugger' ];
				// GtPhlowExceptionId;
				// BrDebuggableElementOpenDebuggerButtonId ].
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewLocalInspectionExamples >> errorViewShowsDebuggableElement_debugButton [
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
