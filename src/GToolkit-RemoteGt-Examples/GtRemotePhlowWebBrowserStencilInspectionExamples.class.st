"
Inspector examples for web browser views built directly with GtRemotePhlowWebBrowserStencil.
"
Class {
	#name : #GtRemotePhlowWebBrowserStencilInspectionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #testing }
GtRemotePhlowWebBrowserStencilInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowWebBrowserStencilInspectionExamples
]

{ #category : #assertions }
GtRemotePhlowWebBrowserStencilInspectionExamples >> assertWebViewExistsInTabNamed: aTabName in: aScripter [
	(aScripter inspectorStep)
		clickOnTabWithName: aTabName;
		assertSelectedTabWithName: aTabName;
		play.
	
	aScripter checkStep: [ :aStep |
			aStep
				label: 'Headers web view element exists';
				exists;
				// GtRemotePhlowWebBrowserElementId ].
]

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> createTestObject [
	<gtExample>
	self subclassResponsibility
]

{ #category : #'examples - rendering' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> objectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^ testObject
]

{ #category : #'examples - scripter setup' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> scripterOnTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := (self createTestObject gtDefaultInspectorTool) asElement.
	scripter element: element.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> webBrowserHeadersViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser headers' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> webBrowserLocalDataViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser local data' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> webBrowserPngViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser PNG' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> webBrowserUrlViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser URL' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserStencilInspectionExamples >> webBrowserViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser' in: scripter.
	^ scripter
]
