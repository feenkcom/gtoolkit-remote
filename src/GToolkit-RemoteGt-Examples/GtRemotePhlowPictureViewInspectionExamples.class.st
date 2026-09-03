Class {
	#name : #GtRemotePhlowPictureViewInspectionExamples,
	#superclass : #Object,
	#traits : 'TGtRemotePhlowLocalInspectionAssertions',
	#classTraits : 'TGtRemotePhlowLocalInspectionAssertions classTrait',
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #testing }
GtRemotePhlowPictureViewInspectionExamples class >> isAbstract [
	^ self name = #GtRemotePhlowPictureViewInspectionExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> altClickOnErrorTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (self createErrorTestObject gtDefaultInspectorTool)).
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture Error';
		assertSelectedTabWithName: 'Picture Error';
		play.
	scripter clickStep: 
			[:s |
			s
				modifiers: BlKeyModifiers alt;
				label: 'Alt+click on Picture Error tab';
				onPagerPaneWithIndex: 1;
				// GtPhlowCompositeViewElementId;
				// BrTab;
				@ [:aTab | aTab label asString = 'Picture Error']].
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
		
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> altClickOnPictureTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (self createTestObject gtDefaultInspectorTool)).
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture';
		assertSelectedTabWithName: 'Picture';
		play.
	scripter clickStep: 
			[:s |
			s
				modifiers: BlKeyModifiers alt;
				label: 'Alt+click on Picture tab';
				onPagerPaneWithIndex: 1;
				// GtPhlowCompositeViewElementId;
				// BrTab;
				@ [:aTab | aTab label asString = 'Picture']].
	(scripter treePager)
		assertNumberOfPaneElements: 2;
		play.
	
	^scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewInspectionExamples >> createErrorTestObject [
	<gtExample>
	^GtRemotePhlowPictureViewErrorTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowPictureViewTestObject new
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> errorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture Error';
		assertSelectedTabWithName: 'Picture Error';
		play.
	
	self 
		assertPhlowViewHasErrorWithMessage: 'Test picture computation error' 
		in: scripter.
		
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> heightErrorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObjectInPager.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture Height Error';
		assertSelectedTabWithName: 'Picture Height Error';
		play.

	self 
		assertPhlowViewHasErrorWithMessage: 'Height computation error' 
		in: scripter.
	
	^scripter
]

{ #category : #'examples - rendering' }
GtRemotePhlowPictureViewInspectionExamples >> objectViewsRenderWithoutErrors [
	<gtExample>
	| testObject |
	testObject := self createTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^testObject
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> pictureFullSizeViewHasCorrectSize [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (full size)';
		assertSelectedTabWithName: 'Picture (full size)';
		play.
	scripter checkStep: [:aStep |
			aStep
				label: 'Picture element exists';
				exists;
				// GtLocalPhlowPictureElementId ].
	scripter checkStep: [:aStep |
			aStep
				label: 'Image has correct width';
				value: [:anElement | anElement width] equals: [1164];
				// GtLocalPhlowPictureElementId;
				// BlSpartaBufferedImageElement ].
	scripter checkStep: [:aStep |
			aStep
				label:'Image has correct height';
				value: [:anElement | anElement height] equals: [560];
				// GtLocalPhlowPictureElementId;
				// BlSpartaBufferedImageElement ].
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> pictureFullSizeViewShowsPictureElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (full size)';
		assertSelectedTabWithName: 'Picture (full size)';
		play.
	scripter checkStep: [:aStep |
			aStep
				label: 'Assert picture element exists';
				exists;
				// GtLocalPhlowPictureElementId ].
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewInspectionExamples >> pictureViewShowsPictureElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture';
		assertSelectedTabWithName: 'Picture';
		play.
	scripter checkStep: [:aStep |
			aStep
				label:'Assert picture element exists';
				exists;
				// GtLocalPhlowPictureElementId ].
	^scripter
]

{ #category : #utils }
GtRemotePhlowPictureViewInspectionExamples >> remoteErrorPrefix: aString [
	 ^ aString withoutPrefix: 'Error: '
]

{ #category : #'examples - scripter setup' }
GtRemotePhlowPictureViewInspectionExamples >> scripterOnErrorTestObjectInPager [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter extent: 1200 @ 800.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (self createErrorTestObject gtDefaultInspectorTool)).
	^scripter
]

{ #category : #'examples - scripter setup' }
GtRemotePhlowPictureViewInspectionExamples >> scripterOnTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := (self createTestObject gtDefaultInspectorTool) asElement.
	element size: 1200 @ 800.
	scripter element: element.
	^scripter
]
