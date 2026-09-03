Class {
	#name : #GtRemotePhlowExplicitViewInspectionExamples,
	#superclass : #Object,
	#traits : 'TGtRemotePhlowLocalInspectionAssertions',
	#classTraits : 'TGtRemotePhlowLocalInspectionAssertions classTrait',
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #testing }
GtRemotePhlowExplicitViewInspectionExamples class >> isAbstract [
	^self name = #GtRemotePhlowExplicitViewInspectionExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> altClickOnExplicitErrorViewTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: self createErrorTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (stencil error)';
		assertSelectedTabWithName: 'Picture (stencil error)';
		play.
	scripter clickStep: 
			[:s |
			s
				modifiers: BlKeyModifiers alt;
				label: 'Alt+click on Picture (stencil error) tab';
				onPagerPaneWithIndex: 1;
				// GtPhlowCompositeViewElementId;
				// BrTab;
				@ [:aTab | aTab label asString = 'Picture (stencil error)']].
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> altClickOnExplicitViewTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: self createTestObject gtDefaultInspectorTool).
	(scripter inspectorStep)
		clickOnTabWithName: 'Remote/local stencil';
		assertSelectedTabWithName: 'Remote/local stencil';
		play.
	scripter clickStep: 
			[:s |
			s
				modifiers: BlKeyModifiers alt;
				label: 'Alt+click on Remote/local stencil tab';
				onPagerPaneWithIndex: 1;
				// GtPhlowCompositeViewElementId;
				// BrTab;
				@ [:aTab | aTab label asString = 'Remote/local stencil']].
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	^scripter
]

{ #category : #assertions }
GtRemotePhlowExplicitViewInspectionExamples >> assertPictureElementViewExistsInTabNamed: aTabName in: aScripter [ 
	(aScripter inspectorStep)
		clickOnTabWithName: aTabName;
		assertSelectedTabWithName: aTabName;
		play.
	
	aScripter checkStep: [:aStep |
		aStep 
			label: 'Picture element exists';
			// GtLocalPhlowPictureElementId;
			exists ].
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createEditablePersonObject [
	<gtExample>
	^GtRemotePhlowExplicitViewWithEditableUIPersonObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createErrorTestObject [
	<gtExample>
	^GtRemotePhlowExplicitViewErrorTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createSerializationTestObject [
	<gtExample>
	^GtRemotePhlowExplicitViewWithSerializationTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createTestObject [
	<gtExample>
	^GtRemotePhlowExplicitViewTestObject new
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> editablePersonObjectSelectBasicEditView [
	<gtExample>
	| scripter |
	scripter := self scripterOnEditablePersonObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Basic edit';
		assertSelectedTabWithName: 'Basic edit';
		play.
	scripter checkStep: [:aStep |
		aStep
			label: 'Name editor exists';
			exists;
			// GtRemotePhlowExplicitViewExampleNameEditorId].
	scripter checkStep: [:aStep |
		aStep
			label: 'Name editor shows person name';
			value: [:anElement | anElement text asString] equals: ['John Doe'];
			// GtRemotePhlowExplicitViewExampleNameEditorId ].
	scripter checkStep: [:aStep |
		aStep
			label: 'Age editor shows age';
			value: [:anElement | anElement text asString] equals: ['30'];
			// GtRemotePhlowExplicitViewExampleAgeEditorId ].
	scripter checkStep: [:aStep |
		aStep
			label: 'Address editor shows address';
			value: [:anElement | anElement text asString] equals: ['123 Main Street'];
			// GtRemotePhlowExplicitViewExampleAddressEditorId ].
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> editablePersonObjectSelectEditView [
	<gtExample>
	| scripter |
	scripter := self scripterOnEditablePersonObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Edit';
		assertSelectedTabWithName: 'Edit';
		play.
	scripter checkStep: [:aStep |
			aStep 
				label:'Name editor exists';
				exists;
				// GtRemotePhlowExplicitViewExampleNameEditorId ].
	scripter checkStep: [:aStep |
			aStep
				label: 'Name editor shows person name';
				value: [:anElement | anElement text asString] equals: ['John Doe'];
				// GtRemotePhlowExplicitViewExampleNameEditorId ].
	scripter checkStep: [:aStep |
			aStep
				label: 'Age editor shows age';
				value: [:anElement | anElement text asString] equals: ['30'];
				// GtRemotePhlowExplicitViewExampleAgeEditorId ].
	scripter checkStep: [:aStep |
			aStep
				label: 'Address editor shows address';
				value: [:anElement | anElement text asString] equals: ['123 Main Street'];
				// GtRemotePhlowExplicitViewExampleAddressEditorId ].
	^scripter
]

{ #category : #'examples - rendering' }
GtRemotePhlowExplicitViewInspectionExamples >> editablePersonObjectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createEditablePersonObject.
	self assertObjectPhlowViewsFor: testObject.
	^testObject
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> errorTestObjectSelectStencilDataErrorView [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (stencil API)';
		assertSelectedTabWithName: 'Picture (stencil API)';
		play.
	
	self 
		assertPhlowViewHasErrorWithMessage: 'Stencil data computation with exception' 
		in: scripter.
		
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> errorTestObjectSelectStencilErrorView [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (stencil error)';
		assertSelectedTabWithName: 'Picture (stencil error)';
		play.
		
	self 
		assertPhlowViewHasErrorWithMessage: 'Declarative stencil computation with exception' 
		in: scripter.
				
	^scripter
]

{ #category : #private }
GtRemotePhlowExplicitViewInspectionExamples >> remoteErrorPrefix: aString [
	^aString withoutPrefix: 'Error: '
]

{ #category : #'examples - scripter setup' }
GtRemotePhlowExplicitViewInspectionExamples >> scripterOnEditablePersonObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := self createEditablePersonObject gtDefaultInspectorTool
				asElement.
	element size: 1200 @ 800.
	scripter element: element.
	^scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> scripterOnErrorTestObjectInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter extent: 1200 @ 800.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (self createErrorTestObject gtDefaultInspectorTool)).
	^scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> scripterOnSerializationTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := self createSerializationTestObject gtDefaultInspectorTool
				asElement.
	element size: 1200 @ 800.
	scripter element: element.
	^scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> scripterOnTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := self createTestObject gtDefaultInspectorTool asElement.
	element size: 1200 @ 800.
	scripter element: element.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectDirectProxyExplicitComputationView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	self assertPictureElementViewExistsInTabNamed: 'Direct proxy - explicit block' in: scripter. 
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectDirectProxyView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	self assertPictureElementViewExistsInTabNamed: 'Direct proxy' in: scripter. 
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectManualDictionaryView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	self assertPictureElementViewExistsInTabNamed: 'Manual dictionary' in: scripter. 
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectWireEncodingView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	self assertPictureElementViewExistsInTabNamed: 'Wire encoding' in: scripter. 
	^scripter
]

{ #category : #'examples - rendering' }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createSerializationTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^testObject
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectGtSideStencilV1View [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertPictureElementViewExistsInTabNamed: 'GT-Side stencil v1' in: scripter. 
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectGtSideStencilV2View [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertPictureElementViewExistsInTabNamed: 'GT-Side stencil v2' in: scripter. 
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectRemoteLocalStencilView [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertPictureElementViewExistsInTabNamed: 'Remote/local stencil' in: scripter. 
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectRemoteOnlyStencilView [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	self assertPictureElementViewExistsInTabNamed: 'Remote only stencil' in: scripter. 
	^scripter
]

{ #category : #'examples - rendering' }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^testObject
]
