Class {
	#name : #GtRemotePhlowPictureViewAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #testing }
GtRemotePhlowPictureViewAbstractExamples class >> isAbstract [
	^self name = #GtRemotePhlowPictureViewAbstractExamples
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> altClickOnErrorTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (GtInspectorTool forObject: self createErrorTestObject)).
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
	(scripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [#gtViewPictureErrorFor:];
		play.
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> altClickOnPictureTabOpensDefinition [
	<gtExample>
	| scripter |
	scripter := BlScripter new.
	scripter element: (GtPagerSettings usedPager
				createWrappedOn: (GtInspectorTool forObject: self createTestObject)).
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
	(scripter multipleViewsToolStep)
		label: 'Second pane has method definition';
		onPagerPaneWithIndex: 2;
		onMultipleViewsToolElement;
		assertToolObjectOfType: RGMethodDefinition;
		assertToolObjectValueFor: [:aMethodDefinition | aMethodDefinition selector]
			equals: [#gtViewPictureFor:];
		play.
	^scripter
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> contentComputationError [
	<gtExample>
	| view spec data |
	view := (self createProtoView picture)
				title: 'Error';
				content: [Error signal: 'content error'].
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	self assert: data isError.
	self assert: data errorDescription equals: 'content error'.
	^data
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> contentErrorProducesDebuggableElement [
	<gtExample>
	| data element |
	data := self contentComputationError.
	element := data asDebuggableElement.
	self assert: element id asSymbol equals: GtPhlowExceptionId new asSymbol.
	^element
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewAbstractExamples >> createErrorTestObject [
	<gtExample>
	^GtRemotePhlowPictureViewErrorTestObject new
]

{ #category : #support }
GtRemotePhlowPictureViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewAbstractExamples >> createTestObject [
	<gtExample>
	^GtRemotePhlowPictureViewTestObject new
]

{ #category : #'examples - data source' }
GtRemotePhlowPictureViewAbstractExamples >> dataSourceRetrievesData [
	<gtExample>
	| spec data |
	spec := self pictureViewSpecification.
	data := spec phlowDataSource retrieveData.
	self assert: data isError not.
	self assert: data isPictureData.
	self assert: data content class equals: ByteArray.
	self assert: data content notEmpty.
	^data
]

{ #category : #'examples - data source' }
GtRemotePhlowPictureViewAbstractExamples >> dataSourceRetrievesErrorData [
	<gtExample>
	| view spec data |
	view := (self createProtoView picture)
				title: 'Error';
				priority: 25;
				content: [Error signal: 'test error'].
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	self assert: data isError.
	self assert: data isPictureData not.
	self assert: data errorDescription equals: 'test error'.
	^data
]

{ #category : #'examples - data serialization' }
GtRemotePhlowPictureViewAbstractExamples >> errorDataSerializationRoundTrip [
	<gtExample>
	| data dictionary restored |
	data := self dataSourceRetrievesErrorData.
	dictionary := data asDictionaryForExport.
	self assert: (dictionary at: '__typeName')
		equals: 'GtRemotePhlowViewErrorData'.
	self assert: (dictionary at: 'errorDescription') equals: 'test error'.
	restored := GtRemotePhlowBasicViewData fromDictionary: dictionary.
	self assert: restored isError.
	self assert: restored errorDescription equals: 'test error'.
	^restored
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> errorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture Error';
		assertSelectedTabWithName: 'Picture Error';
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
					equals: ['Test picture computation error'];
				// GtPhlowExceptionId;
				play].
	scripter check: 'Error label displays message'
		do: 
			[:aStep |
			(aStep check)
				value: [:aButton | self remoteErrorPrefix: aButton label asString ]
					equals: [ 'Test picture computation error' ];
				// GtPhlowExceptionId;
				// BrDebuggableElementExceptionMessageId;
				play].
	^scripter
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> heightComputationError [
	<gtExample>
	| view spec data |
	view := (self createProtoView picture)
				title: 'Height Error';
				height: [Error signal: 'height error'];
				content: [self createTestObject pictureBytes].
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	self assert: data isError.
	self assert: data errorDescription equals: 'height error'.
	^data
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> heightErrorProducesDebuggableElement [
	<gtExample>
	| data element |
	data := self heightComputationError.
	element := data asDebuggableElement.
	self assert: element id asSymbol equals: GtPhlowExceptionId new asSymbol.
	^element
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> heightErrorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture Height Error';
		assertSelectedTabWithName: 'Picture Height Error';
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
					equals: ['Height computation error'];
				// GtPhlowExceptionId;
				play].
	scripter check: 'Error label displays message'
		do: 
			[:aStep |
			(aStep check)
				value: [:aButton | self remoteErrorPrefix: aButton label asString]
					equals: ['Height computation error'];
				// GtPhlowExceptionId;
				// BrDebuggableElementExceptionMessageId;
				play].
	^scripter
]

{ #category : #'examples - data serialization' }
GtRemotePhlowPictureViewAbstractExamples >> pictureDataSerializationRoundTrip [
	<gtExample>
	| data dictionary restored |
	data := self dataSourceRetrievesData.
	dictionary := data asDictionaryForExport.
	self assert: (dictionary at: '__typeName')
		equals: 'GtRemotePhlowPictureViewData'.
	self assert: (dictionary at: 'content') equals: data content.
	restored := GtRemotePhlowBasicViewData fromDictionary: dictionary.
	self assert: restored isPictureData.
	self assert: restored content equals: data content.
	^restored
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> pictureFullSizeViewHasCorrectSize [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (full size)';
		assertSelectedTabWithName: 'Picture (full size)';
		play.
	scripter check: 'Picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	scripter check: 'Image has correct width'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement width] equals: [1164];
				// GtLocalPhlowPictureElementId;
				// BlSpartaBufferedImageElement;
				play].
	scripter check: 'Image has correct height'
		do: 
			[:aStep |
			(aStep check)
				value: [:anElement | anElement height] equals: [560];
				// GtLocalPhlowPictureElementId;
				// BlSpartaBufferedImageElement;
				play].
	^scripter
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> pictureFullSizeViewShowsPictureElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture (full size)';
		assertSelectedTabWithName: 'Picture (full size)';
		play.
	scripter check: 'Assert picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #'examples - view' }
GtRemotePhlowPictureViewAbstractExamples >> pictureView [
	<gtExample>
	| view |
	view := (self createProtoView picture)
				title: 'Picture';
				priority: 20;
				content: [self createTestObject pictureBytes].
	self assert: view title equals: 'Picture'.
	self assert: view priority equals: 20.
	self assert: view renderingStencilSpecification class
		equals: GtRemotePhlowTypedStencilSpecification.
	self assert: view renderingStencilSpecification stencilClassName
		equals: #GtLocalPhlowPictureScaledViewStencil.
	^view
]

{ #category : #'examples - rendering' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewNoScaleWithExtentRendersImageElement [
	<gtExample>
	| view spec data element |
	view := (self createProtoView picture)
				title: 'Pannable With Extent';
				width: 300;
				height: 50;
				renderingStencilName: #GtLocalPhlowPictureFullSizeViewStencil;
				content: [self createTestObject pictureBytes].
	spec := view asGtDeclarativeView.
	self assert: spec renderingStencilSpecification stencilClassName
		equals: #GtLocalPhlowPictureFullSizeViewStencil.
	data := spec phlowDataSource retrieveData.
	element := spec buildPictureElementFor: data.
	^element
]

{ #category : #'examples - rendering' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewRendersElement [
	<gtExample>
	| testObject |
	testObject := self createTestObject.
	self assertObjectPhlowViewsFor: testObject.
	^testObject
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewShowsPictureElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture';
		assertSelectedTabWithName: 'Picture';
		play.
	scripter check: 'Assert picture element exists'
		do: 
			[:aStep |
			(aStep check)
				exists;
				// GtLocalPhlowPictureElementId;
				play].
	^scripter
]

{ #category : #'examples - specification' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewSpecification [
	<gtExample>
	| view spec |
	view := self pictureView.
	spec := view asGtDeclarativeView.
	self assert: spec renderingStencilSpecification stencilClassName
		equals: #GtLocalPhlowPictureScaledViewStencil.
	^spec
]

{ #category : #'examples - view' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewWithExtent [
	<gtExample>
	| view |
	view := (self createProtoView picture)
				title: 'Picture With Extent';
				priority: 35;
				width: 500;
				height: 1000;
				content: [self createTestObject pictureBytes].
	self assert: view title equals: 'Picture With Extent'.
	self assert: view widthComputation equals: 500.
	self assert: view heightComputation equals: 1000.
	self assert: view renderingStencilSpecification stencilClassName
		equals: #GtLocalPhlowPictureScaledViewStencil.
	^view
]

{ #category : #'examples - rendering' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewWithExtentRendersScalableElement [
	<gtExample>
	| spec data element |
	spec := self pictureViewWithExtentSpecification.
	data := spec phlowDataSource retrieveData.
	element := spec buildPictureElementFor: data.
	self assert: element class equals: BlScalableElement.
	^element
]

{ #category : #'examples - specification' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewWithExtentSpecification [
	<gtExample>
	| view spec data |
	
	view := self pictureViewWithExtent.
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	
	self assert: data width equals: 500.
	self assert: data height equals: 1000.
	self assert: spec renderingStencilSpecification stencilClassName
		equals: #GtLocalPhlowPictureScaledViewStencil.
		
	^spec
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> remoteErrorPrefix: aString [
	 ^ aString withoutPrefix: 'Error: '
]

{ #category : #'examples - specification' }
GtRemotePhlowPictureViewAbstractExamples >> renderingStencilSpecificationSerializationRoundTrip [
	<gtExample>
	| spec exported restored |
	spec := self pictureViewWithExtentSpecification.
	exported := spec asBasicViewDataForExport.
	restored := GtRemotePhlowPictureViewSpecification
				fromJSONDictionary: exported.
	self assert: restored renderingStencilSpecification class
		equals: GtRemotePhlowTypedStencilSpecification.
	self assert: restored renderingStencilSpecification stencilClassName
		equals: #GtLocalPhlowPictureScaledViewStencil.
	^restored
]

{ #category : #'examples - data serialization' }
GtRemotePhlowPictureViewAbstractExamples >> retrievePrimitiveDataForError [
	<gtExample>
	| view spec dictionary restored |
	view := (self createProtoView picture)
				title: 'Error';
				priority: 25;
				content: [Error signal: 'test error'].
	spec := view asGtDeclarativeView.
	dictionary := spec retrievePrimitiveData.
	self assert: (dictionary at: '__typeName')
		equals: 'GtRemotePhlowViewErrorData'.
	restored := GtRemotePhlowBasicViewData fromDictionary: dictionary.
	self assert: restored isError.
	^restored
]

{ #category : #'examples - data serialization' }
GtRemotePhlowPictureViewAbstractExamples >> retrievePrimitiveDataForPicture [
	<gtExample>
	| spec dictionary restored |
	spec := self pictureViewSpecification.
	dictionary := spec retrievePrimitiveData.
	self assert: (dictionary at: '__typeName')
		equals: 'GtRemotePhlowPictureViewData'.
	self assert: (dictionary at: 'content') class equals: ByteArray.
	restored := GtRemotePhlowBasicViewData fromDictionary: dictionary.
	self assert: restored isPictureData.
	^restored
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewAbstractExamples >> scripterOnErrorTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := GtInspector createOn: self createErrorTestObject.
	element size: 1200 @ 800.
	scripter element: element.
	^scripter
]

{ #category : #'examples - setup' }
GtRemotePhlowPictureViewAbstractExamples >> scripterOnTestObject [
	<gtExample>
	| scripter element |
	scripter := BlScripter new.
	element := GtInspector createOn: self createTestObject.
	element size: 1200 @ 800.
	scripter element: element.
	^scripter
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> widthComputationError [
	<gtExample>
	| view spec data |
	view := (self createProtoView picture)
				title: 'Width Error';
				width: [Error signal: 'width error'];
				content: [self createTestObject pictureBytes].
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	self assert: data isError.
	self assert: data errorDescription equals: 'width error'.
	^data
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> widthErrorProducesDebuggableElement [
	<gtExample>
	| data element |
	data := self widthComputationError.
	element := data asDebuggableElement.
	self assert: element id asSymbol equals: GtPhlowExceptionId new asSymbol.
	^element
]

{ #category : #'examples - scripter' }
GtRemotePhlowPictureViewAbstractExamples >> widthErrorViewShowsDebuggableElement [
	<gtExample>
	| scripter |
	scripter := self scripterOnErrorTestObject.
	(scripter inspectorStep)
		clickOnTabWithName: 'Picture Width Error';
		assertSelectedTabWithName: 'Picture Width Error';
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
					equals: ['Width computation error'];
				// GtPhlowExceptionId;
				play].
	scripter check: 'Error label displays message'
		do: 
			[:aStep |
			(aStep check)
				value: [:aButton | self remoteErrorPrefix: aButton label asString]
					equals: ['Width computation error'];
				// GtPhlowExceptionId;
				// BrDebuggableElementExceptionMessageId;
				play].
	^scripter
]
