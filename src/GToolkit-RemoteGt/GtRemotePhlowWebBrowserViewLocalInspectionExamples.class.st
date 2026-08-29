"
Shared local and simulation inspector examples for the web browser view.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewLocalInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserViewInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
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
