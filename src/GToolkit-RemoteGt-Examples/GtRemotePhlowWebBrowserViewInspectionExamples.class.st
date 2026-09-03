"
Shared inspector examples for the local/remote web browser view.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewInspectionExamples,
	#superclass : #Object,
	#traits : 'TGtRemotePhlowLocalInspectionAssertions',
	#classTraits : 'TGtRemotePhlowLocalInspectionAssertions classTrait',
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #testing }
GtRemotePhlowWebBrowserViewInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowWebBrowserViewInspectionExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> altClickOnErrorTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: (self createErrorTestObject gtDefaultInspectorTool)).
	(scripter inspectorStep)
		clickOnTabWithName: 'Browser error';
		assertSelectedTabWithName: 'Browser error';
		play.
	scripter clickStep: [ :aStep |
		aStep
			modifiers: BlKeyModifiers alt;
			label: 'Alt+click on Browser error tab';
			onPagerPaneWithIndex: 1;
			// GtPhlowCompositeViewElementId;
			// BrTab;
			@ [ :aTab | aTab label asString = 'Browser error' ] ].
	(scripter treePager) assertNumberOfPaneElements: 2; play.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> altClickOnWebBrowserTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
		createWrappedOn: (self createTestObject gtDefaultInspectorTool)).
	(scripter inspectorStep)
		clickOnTabWithName: 'Browser';
		assertSelectedTabWithName: 'Browser';
		play.
	scripter clickStep: [ :aStep |
		aStep
			modifiers: BlKeyModifiers alt;
			label: 'Alt+click on Browser tab';
			onPagerPaneWithIndex: 1;
			// GtPhlowCompositeViewElementId;
			// BrTab;
			@ [ :aTab | aTab label asString = 'Browser' ] ].
	(scripter treePager) assertNumberOfPaneElements: 2; play.
	^ scripter
]

{ #category : #assertions }
GtRemotePhlowWebBrowserViewInspectionExamples >> assertWebViewExistsInTabNamed: aTabName in: aScripter [
	(aScripter inspectorStep)
		clickOnTabWithName: aTabName;
		assertSelectedTabWithName: aTabName;
		play.
	
	aScripter checkStep: [ :aStep |
			aStep
				label: 'Headers web view element exists';
				exists;
				// GtRemotePhlowWebBrowserElementId  ].
]

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewInspectionExamples >> createErrorTestObject [
	<gtExample>
	self subclassResponsibility
]

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewInspectionExamples >> createTestObject [
	<gtExample>
	self subclassResponsibility
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> dynamicHeadersErrorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	
	(scripter inspectorStep)
		clickOnTabWithName: 'Browser dynamic headers error';
		assertSelectedTabWithName: 'Browser dynamic headers error';
		play.
	
	self 
		assertPhlowViewHasErrorWithMessage: 'web browser dynamic headers test error' 
		in: scripter.
		
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> errorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	
	(scripter inspectorStep)
		clickOnTabWithName: 'Browser error';
		assertSelectedTabWithName: 'Browser error';
		play.
		
	self 
		assertPhlowViewHasErrorWithMessage: 'web browser test error' 
		in: scripter.
				
	^ scripter
]

{ #category : #'examples - rendering' }
GtRemotePhlowWebBrowserViewInspectionExamples >> objectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^ testObject
]

{ #category : #'examples - scripter setup' }
GtRemotePhlowWebBrowserViewInspectionExamples >> scripterOnErrorTestObjectInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter extent: 1200 @ 800.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (self createErrorTestObject gtDefaultInspectorTool)).
	^scripter
]

{ #category : #'examples - scripter setup' }
GtRemotePhlowWebBrowserViewInspectionExamples >> scripterOnTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := (self createTestObject gtDefaultInspectorTool) asElement.
	scripter element: element.
	^ scripter
]

{ #category : #'examples - scripter updating' }
GtRemotePhlowWebBrowserViewInspectionExamples >> updateActionRefreshesBrowserContent [
	<gtExample>
	| scripter  element |

	scripter := BlScripter new.
	element := (self createTestObject gtDefaultInspectorTool) asElement.
	scripter element: element.
	
	(scripter inspectorStep)
		clickOnTabWithName: 'Browser updating URL';
		assertSelectedTabWithName: 'Browser updating URL';
		play.
		
	scripter assertStep:[ :aStep |
			aStep 
				label: 'WebView has initial URL';
				// GtRemotePhlowWebBrowserElementId;
				value:[ :anElement | anElement webView url] equals: [ 'https://example.com' ] ].
	scripter clickStep: [ :aStep |
		aStep
			label: 'Change browser URL';
			// BrButton;
			@ [ :aButton | aButton label asString = 'Change URL' ] ].
	
	scripter checkStep: [ :aStep |
			aStep
				label: 'WebView has updated URL';
				// GtRemotePhlowWebBrowserElementId;
				value:[ :anElement | anElement webView url] equals: [ 'https://example.org' ] ].
	
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> webBrowserHeadersViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser headers' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> webBrowserLocalDataViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser local data' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> webBrowserPngViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser PNG' in: scripter.
	^ scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowWebBrowserViewInspectionExamples >> webBrowserViewShowsWebViewElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertWebViewExistsInTabNamed: 'Browser' in: scripter.
	^ scripter
]
