Class {
	#name : #GtRemotePhlowExplicitViewInspectionExamples,
	#superclass : #Object,
	#category : 'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #testing }
GtRemotePhlowExplicitViewInspectionExamples class >> isAbstract [
	^self name = #GtRemotePhlowExplicitViewInspectionExamples
]

{ #category : #examples }
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

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createEditablePersonObject [
	^GtRemotePhlowExplicitViewWithEditableUIPersonObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createErrorTestObject [
	^GtRemotePhlowExplicitViewErrorTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createSerializationTestObject [
	^GtRemotePhlowExplicitViewWithSerializationTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowExplicitViewInspectionExamples >> createTestObject [
	^GtRemotePhlowExplicitViewTestObject new
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> editablePersonObjectSelectBasicEditView [
	<gtExample>
	| scripter |
	scripter := self scripterOnEditablePersonObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Basic edit';
		assertSelectedTabWithName: 'Basic edit';
		play.
	scripter check: 'Name editor exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtRemotePhlowExplicitViewExampleNameEditorId;
				play].
	scripter check: 'Name editor shows person name'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement text asString] equals: ['John Doe'];
				// GtRemotePhlowExplicitViewExampleNameEditorId;
				play].
	scripter check: 'Age editor shows age'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement text asString] equals: ['30'];
				// GtRemotePhlowExplicitViewExampleAgeEditorId;
				play].
	scripter check: 'Address editor shows address'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement text asString] equals: ['123 Main Street'];
				// GtRemotePhlowExplicitViewExampleAddressEditorId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> editablePersonObjectSelectEditView [
	<gtExample>
	| scripter |
	scripter := self scripterOnEditablePersonObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Edit';
		assertSelectedTabWithName: 'Edit';
		play.
	scripter check: 'Name editor exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtRemotePhlowExplicitViewExampleNameEditorId;
				play].
	scripter check: 'Name editor shows person name'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement text asString] equals: ['John Doe'];
				// GtRemotePhlowExplicitViewExampleNameEditorId;
				play].
	scripter check: 'Age editor shows age'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement text asString] equals: ['30'];
				// GtRemotePhlowExplicitViewExampleAgeEditorId;
				play].
	scripter check: 'Address editor shows address'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement text asString] equals: ['123 Main Street'];
				// GtRemotePhlowExplicitViewExampleAddressEditorId;
				play].
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

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> errorTestObjectSelectStencilDataErrorView [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (stencil API)';
		assertSelectedTabWithName: 'Picture (stencil API)';
		play.
	scripter check: 'Error element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtPhlowExceptionId;
				play].
	scripter check: 'Exception has correct message'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | (anElement userData at: #exception) messageText]
					equals: ['Stencil data computation with exception'];
				// GtPhlowExceptionId;
				play].
	scripter check: 'Error label displays message'
		do: 
			[:aStep |
			(aStep check)
				value: [:aButton | self remoteErrorPrefix: aButton label asString]
					equals: ['Stencil data computation with exception'];
				// GtPhlowExceptionId;
				// BrDebuggableElementExceptionMessageId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> errorTestObjectSelectStencilErrorView [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (stencil error)';
		assertSelectedTabWithName: 'Picture (stencil error)';
		play.
	scripter check: 'Error element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtPhlowExceptionId;
				play].
	scripter check: 'Exception has correct message'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | (anElement userData at: #exception) messageText]
					equals: ['Declarative stencil computation with exception'];
				// GtPhlowExceptionId;
				play].
	scripter check: 'Error label displays message'
		do: 
			[:aStep |
			(aStep check)
				value: [:aButton | self remoteErrorPrefix: aButton label asString]
					equals: ['Declarative stencil computation with exception'];
				// GtPhlowExceptionId;
				// BrDebuggableElementExceptionMessageId;
				play].
	^scripter
]

{ #category : #'examples - rendering' }
GtRemotePhlowExplicitViewInspectionExamples >> errorTestObjectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createErrorTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^testObject
]

{ #category : #private }
GtRemotePhlowExplicitViewInspectionExamples >> remoteErrorPrefix: aString [
	^aString withoutPrefix: 'Error: '
]

{ #category : #'examples - setup' }
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
GtRemotePhlowExplicitViewInspectionExamples >> scripterOnErrorTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := self createErrorTestObject gtDefaultInspectorTool asElement.
	element size: 1200 @ 800.
	scripter element: element.
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

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectDirectProxyView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Direct proxy';
		assertSelectedTabWithName: 'Direct proxy';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectManualDictionaryView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Manual dictionary';
		assertSelectedTabWithName: 'Manual dictionary';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> serializationTestObjectSelectWireEncodingView [
	<gtExample>
	| scripter |
	scripter := self scripterOnSerializationTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Wire encoding';
		assertSelectedTabWithName: 'Wire encoding';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
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

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectGtSideStencilV1View [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'GT-Side stencil v1';
		assertSelectedTabWithName: 'GT-Side stencil v1';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectGtSideStencilV2View [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'GT-Side stencil v2';
		assertSelectedTabWithName: 'GT-Side stencil v2';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectRemoteLocalStencilView [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Remote/local stencil';
		assertSelectedTabWithName: 'Remote/local stencil';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #examples }
GtRemotePhlowExplicitViewInspectionExamples >> testObjectSelectRemoteOnlyStencilView [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Remote only stencil';
		assertSelectedTabWithName: 'Remote only stencil';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
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
