Class {
	#name : #GtRemotePhlowPictureViewAbstractExamples,
	#superclass : #Object,
	#category : 'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #testing }
GtRemotePhlowPictureViewAbstractExamples class >> isAbstract [
	^self name = #GtRemotePhlowPictureViewAbstractExamples
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
	self assert: data isPhlowErrorData.
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

{ #category : #support }
GtRemotePhlowPictureViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #'examples - data source' }
GtRemotePhlowPictureViewAbstractExamples >> dataSourceRetrievesData [
	<gtExample>
	| spec data |
	spec := self pictureViewSpecification.
	data := spec phlowDataSource retrieveData.
	self assert: data isPhlowErrorData not.
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
	self assert: data isPhlowErrorData.
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
	self assert: restored isPhlowErrorData.
	self assert: restored errorDescription equals: 'test error'.
	^restored
]

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> heightComputationError [
	<gtExample>
	| view spec data |
	view := (self createProtoView picture)
				title: 'Height Error';
				height: [Error signal: 'height error'];
				content: [ self pictureBytes ].
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	self assert: data isPhlowErrorData.
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

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> pictureBytes [
	^ GtRemotePhlowTestDataForExamples pictureBytes
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

{ #category : #'examples - view' }
GtRemotePhlowPictureViewAbstractExamples >> pictureView [
	<gtExample>
	| view |
	view := (self createProtoView picture)
				title: 'Picture';
				priority: 20;
				content: [ self pictureBytes ].
	self assert: view title equals: 'Picture'.
	self assert: view priority equals: 20.
	self assert: view renderingStencilName
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
				content: [ self pictureBytes ].
	spec := view asGtDeclarativeView.
	self assert: spec renderingStencilName
		equals: #GtLocalPhlowPictureFullSizeViewStencil.
	data := spec phlowDataSource retrieveData.
	element := (spec createDeclarativeStencilForViewData: data) asElement.
	^element
]

{ #category : #'examples - specification' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewSpecification [
	<gtExample>
	| view spec |
	view := self pictureView.
	spec := view asGtDeclarativeView.
	self assert: spec renderingStencilName
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
				content: [ self pictureBytes ].
	self assert: view title equals: 'Picture With Extent'.
	self assert: view widthComputation equals: 500.
	self assert: view heightComputation equals: 1000.
	self assert: view renderingStencilName
		equals: #GtLocalPhlowPictureScaledViewStencil.
	^view
]

{ #category : #'examples - rendering' }
GtRemotePhlowPictureViewAbstractExamples >> pictureViewWithExtentRendersScalableElement [
	<gtExample>
	| spec data element |
	spec := self pictureViewWithExtentSpecification.
	data := spec phlowDataSource retrieveData.
	element := (spec createDeclarativeStencilForViewData: data) asElement.
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
	self assert: spec renderingStencilName
		equals: #GtLocalPhlowPictureScaledViewStencil.
		
	^spec
]

{ #category : #'examples - specification' }
GtRemotePhlowPictureViewAbstractExamples >> renderingStencilSpecificationSerializationRoundTrip [
	<gtExample>
	| spec exported restored |
	spec := self pictureViewWithExtentSpecification.
	exported := spec asBasicViewDataForExport.
	restored := GtRemotePhlowPictureViewSpecification
				fromJSONDictionary: exported.
	self assert: restored renderingStencilName
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
	self assert: restored isPhlowErrorData.
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

{ #category : #'examples - error' }
GtRemotePhlowPictureViewAbstractExamples >> widthComputationError [
	<gtExample>
	| view spec data |
	view := (self createProtoView picture)
				title: 'Width Error';
				width: [Error signal: 'width error'];
				content: [ self pictureBytes ].
	spec := view asGtDeclarativeView.
	data := spec phlowDataSource retrieveData.
	self assert: data isPhlowErrorData.
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
