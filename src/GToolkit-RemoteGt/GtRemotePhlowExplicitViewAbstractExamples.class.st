Class {
	#name : #GtRemotePhlowExplicitViewAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #testing }
GtRemotePhlowExplicitViewAbstractExamples class >> isAbstract [
	^self name = #GtRemotePhlowExplicitViewAbstractExamples
]

{ #category : #support }
GtRemotePhlowExplicitViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromErrorTestObjectWithStencilDataError [
	<gtExample>
	| provider viewSpecification data |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewErrorTestObject new.
	viewSpecification := provider
				getDeclarativeViewFor: #gtExplicitPictureViewWithStencilDataFor:.
	data := viewSpecification retrieveStencilData.
	self assert: data isPhlowErrorData.
	self assert: data errorDescription
		equals: 'Stencil data computation with exception'.
	^data
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromErrorTestObjectWithStencilError [
	<gtExample>
	| provider viewSpecification stencilSpec |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewErrorTestObject new.
	viewSpecification := provider
				getDeclarativeViewFor: #gtExplicitPictureViewWithStencilErrorFor:.
	stencilSpec := viewSpecification retrieveStencilSpecification.
	self assert: stencilSpec notNil.
	^stencilSpec
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromSerializationTestObjectWithDirectProxy [
	<gtExample>
	| provider viewDictionary viewSpecification |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewWithSerializationTestObject new.
	viewDictionary := provider
				getViewDeclaration: #gtExplicitPictureViewDirectProxySerializationFor:.
	viewSpecification := GtPhlowViewSpecification
				fromDictionary: viewDictionary.
	self assert: viewSpecification class
		equals: GtRemotePhlowExplicitViewSpecification.
	self assert: viewSpecification title equals: 'Direct proxy'.
	self assert: viewSpecification priority equals: 15.
	^viewSpecification
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromSerializationTestObjectWithManualDictionary [
	<gtExample>
	| provider viewDictionary viewSpecification |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewWithSerializationTestObject new.
	viewDictionary := provider
				getViewDeclaration: #gtExplicitPictureViewManualDictionarySerializationFor:.
	viewSpecification := GtPhlowViewSpecification
				fromDictionary: viewDictionary.
	self assert: viewSpecification class
		equals: GtRemotePhlowExplicitViewSpecification.
	self assert: viewSpecification title equals: 'Manual dictionary'.
	self assert: viewSpecification priority equals: 5.
	^viewSpecification
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromSerializationTestObjectWithWireEncoding [
	<gtExample>
	| provider viewDictionary viewSpecification |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewWithSerializationTestObject new.
	viewDictionary := provider
				getViewDeclaration: #gtExplicitPictureViewWireEncodingSerializationFor:.
	viewSpecification := GtPhlowViewSpecification
				fromDictionary: viewDictionary.
	self assert: viewSpecification class
		equals: GtRemotePhlowExplicitViewSpecification.
	self assert: viewSpecification title equals: 'Wire encoding'.
	self assert: viewSpecification priority equals: 10.
	^viewSpecification
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromTestObjectWithDirectlySerializableStencil [
	<gtExample>
	| provider viewDictionary viewSpecification |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewTestObject new.
	viewDictionary := provider
				getViewDeclaration: #gtExplicitPictureViewWithDirectlySerializableFor:.
	viewSpecification := GtPhlowViewSpecification
				fromDictionary: viewDictionary.
	self assert: viewSpecification class
		equals: GtRemotePhlowExplicitViewSpecification.
	self assert: viewSpecification title equals: 'Remote/local stencil'.
	self assert: viewSpecification priority equals: 10.
	^viewSpecification
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromTestObjectWithLocalStencilNameApi [
	<gtExample>
	| provider viewDictionary viewSpecification |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewTestObject new.
	viewDictionary := provider
				getViewDeclaration: #gtExplicitPictureViewWithGenericPhlowStencilWithDirectDataUsingDedicatedApiFor:.
	viewSpecification := GtPhlowViewSpecification
				fromDictionary: viewDictionary.
	self assert: viewSpecification class
		equals: GtRemotePhlowExplicitViewSpecification.
	self assert: viewSpecification title equals: 'GT-Side stencil v1'.
	self assert: viewSpecification priority equals: 20.
	^viewSpecification
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewFromTestObjectWithNamedStencil [
	<gtExample>
	| provider viewDictionary viewSpecification |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewTestObject new.
	viewDictionary := provider
				getViewDeclaration: #gtExplicitPictureViewWithGenericPhlowStencilWithDirectDataFor:.
	viewSpecification := GtPhlowViewSpecification
				fromDictionary: viewDictionary.
	self assert: viewSpecification class
		equals: GtRemotePhlowExplicitViewSpecification.
	self assert: viewSpecification title equals: 'GT-Side stencil v2'.
	self assert: viewSpecification priority equals: 25.
	^viewSpecification
]

{ #category : #'examples - specification' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewSpecificationWithDirectlySerializableStencil [
	<gtExample>
	| view spec |
	view := self explicitViewWithDirectlySerializableStencil.
	spec := view asGtDeclarativeView.
	self assert: spec class equals: GtRemotePhlowExplicitViewSpecification.
	self assert: spec title equals: 'Remote/local stencil'.
	self assert: spec priority equals: 10.
	^spec
]

{ #category : #'examples - specification' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewSpecificationWithLocalStencilNameApi [
	<gtExample>
	| view spec |
	view := self explicitViewWithLocalStencilNameApi.
	spec := view asGtDeclarativeView.
	self assert: spec class equals: GtRemotePhlowExplicitViewSpecification.
	self assert: spec title equals: 'Local stencil name API'.
	self assert: spec priority equals: 25.
	^spec
]

{ #category : #'examples - specification' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewSpecificationWithNamedStencil [
	<gtExample>
	| view spec |
	view := self explicitViewWithNamedStencil.
	spec := view asGtDeclarativeView.
	self assert: spec class equals: GtRemotePhlowExplicitViewSpecification.
	self assert: spec title equals: 'GT-Side stencil'.
	self assert: spec priority equals: 20.
	^spec
]

{ #category : #'examples - view' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewWithDirectlySerializableStencil [
	<gtExample>
	| view |
	view := (self createProtoView explicit)
				title: 'Remote/local stencil';
				priority: 10;
				declarativeStencil: 
						[GtPhlowPictureWithDirectDataExampleStencil new
							contentBytes: self pictureBytes].
	self assert: view title equals: 'Remote/local stencil'.
	self assert: view priority equals: 10.
	^view
]

{ #category : #'examples - view' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewWithLocalStencilNameApi [
	<gtExample>
	| view |
	view := (self createProtoView explicit)
				title: 'Local stencil name API';
				priority: 25;
				localStencilName: #GtLocalPhlowPictureFullSizeViewStencil
					stencilData: [GtRemotePhlowPictureViewData new content: self pictureBytes].
	self assert: view title equals: 'Local stencil name API'.
	self assert: view priority equals: 25.
	^view
]

{ #category : #'examples - view' }
GtRemotePhlowExplicitViewAbstractExamples >> explicitViewWithNamedStencil [
	<gtExample>
	| view |
	view := (self createProtoView explicit)
				title: 'GT-Side stencil';
				priority: 20;
				declarativeStencil: 
						[(GtPhlowNamedStencil new)
							stencilClassName: #GtLocalPhlowPictureFullSizeViewStencil;
							stencilData: (GtRemotePhlowPictureViewData new content: self pictureBytes)].
	self assert: view title equals: 'GT-Side stencil'.
	self assert: view priority equals: 20.
	^view
]

{ #category : #support }
GtRemotePhlowExplicitViewAbstractExamples >> pictureBytes [
	^GtRemotePhlowTestDataForExamples pictureBytes
]

{ #category : #'examples - serialization' }
GtRemotePhlowExplicitViewAbstractExamples >> primitiveStencilDataRetrieval [
	<gtExample>
	| spec primitiveData |
	spec := self explicitViewSpecificationWithNamedStencil.
	primitiveData := spec retrievePrimitiveStencilData.
	self assert: primitiveData class equals: Dictionary.
	^primitiveData
]

{ #category : #'examples - serialization' }
GtRemotePhlowExplicitViewAbstractExamples >> primitiveStencilSpecificationDataRetrieval [
	<gtExample>
	| spec primitiveData |
	spec := self explicitViewSpecificationWithNamedStencil.
	primitiveData := spec retrievePrimitiveStencilSpecificationData.
	self assert: primitiveData class equals: Dictionary.
	^primitiveData
]

{ #category : #'examples - serialization' }
GtRemotePhlowExplicitViewAbstractExamples >> specificationSerializationRoundTrip [
	<gtExample>
	| spec exported restored |
	spec := self explicitViewSpecificationWithNamedStencil.
	exported := spec asBasicViewDataForExport.
	self assert: (exported at: 'viewName') equals: spec viewName.
	self assert: (exported at: 'title') equals: 'GT-Side stencil'.
	self assert: (exported at: 'priority') equals: 20.
	restored := GtPhlowViewSpecification fromDictionary: exported.
	self assert: restored class equals: GtRemotePhlowExplicitViewSpecification.
	self assert: restored title equals: 'GT-Side stencil'.
	self assert: restored priority equals: 20.
	^restored
]

{ #category : #'examples - error' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilComputationError [
	<gtExample>
	| view spec |
	view := (self createProtoView explicit)
				title: 'Error';
				priority: 30;
				declarativeStencil: [Error signal: 'stencil computation error'].
	spec := view asGtDeclarativeView.
	self assert: spec class equals: GtRemotePhlowExplicitViewSpecification.
	^spec
]

{ #category : #'examples - error' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilComputationErrorProducesErrorSpecification [
	<gtExample>
	| spec stencilSpec |
	spec := self stencilComputationError.
	stencilSpec := spec retrieveStencilSpecification.
	self assert: stencilSpec notNil.
	^stencilSpec
]

{ #category : #'examples - error' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilDataComputationError [
	<gtExample>
	| view spec data |
	view := (self createProtoView explicit)
				title: 'Data Error';
				priority: 35;
				localStencilName: #GtLocalPhlowPictureFullSizeViewStencil
					stencilData: [Error signal: 'stencil data error'].
	spec := view asGtDeclarativeView.
	data := spec retrieveStencilData.
	self assert: data isPhlowErrorData.
	self assert: data errorDescription equals: 'stencil data error'.
	^data
]

{ #category : #'examples - data' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilDataFromTestObjectWithDirectlySerializableStencil [
	<gtExample>
	| provider viewSpecification stencilSpec stencilData |
	provider := GtRemotePhlowViewedObject
		object: GtRemotePhlowExplicitViewTestObject new.
	viewSpecification := provider
		getDeclarativeViewFor: #gtExplicitPictureViewWithDirectlySerializableFor:.
	stencilSpec := viewSpecification retrieveStencilSpecification.
	stencilData := stencilSpec stencilData.
	self assert: stencilSpec class equals: GtRemotePhlowDirectStencilSpecification.
	self assert: stencilSpec stencilClassName equals: #GtPhlowPictureWithDirectDataExampleStencil.
	self assert: stencilData class equals: Dictionary.
	self assert: (stencilData at: '__typeName') equals: #GtPhlowPictureWithDirectDataExampleStencil.
	self assert: (stencilData at: 'contentBytes') class equals: ByteArray.
	self assert: (stencilData at: 'contentBytes') notEmpty.
	^ stencilSpec
]

{ #category : #'examples - test object integration' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilDataFromTestObjectWithNamedStencil [
	<gtExample>
	| provider viewSpecification data |
	provider := GtRemotePhlowViewedObject
				object: GtRemotePhlowExplicitViewTestObject new.
	viewSpecification := provider
				getDeclarativeViewFor: #gtExplicitPictureViewWithGenericPhlowStencilWithDirectDataFor:.
	data := viewSpecification retrieveStencilData.
	self assert: data notNil.
	self assert: data isPhlowErrorData not.
	self assert: data class equals: GtRemotePhlowPictureViewData.
	self assert: data content notEmpty.
	^data
]

{ #category : #'examples - data' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilDataRetrievalForDirectlySerializableStencil [
	<gtExample>
	| spec data |
	spec := self explicitViewSpecificationWithDirectlySerializableStencil.
	data := spec retrieveStencilData.
	self assert: data isPhlowErrorData.
	self assert: data errorDescription
		equals: 'Message not understood: GtPhlowPictureWithDirectDataExampleStencil >> #stencilData'.
	^ data
]

{ #category : #'examples - stencil data' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilDataRetrievalForLocalStencilNameApi [
	<gtExample>
	| spec data |
	spec := self explicitViewSpecificationWithLocalStencilNameApi.
	data := spec retrieveStencilData.
	self assert: data notNil.
	self assert: data isPhlowErrorData not.
	self assert: data class equals: GtRemotePhlowPictureViewData.
	self assert: data content class equals: ByteArray.
	self assert: data content notEmpty.
	^data
]

{ #category : #'examples - stencil data' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilDataRetrievalForNamedStencil [
	<gtExample>
	| spec data |
	spec := self explicitViewSpecificationWithNamedStencil.
	data := spec retrieveStencilData.
	self assert: data notNil.
	self assert: data isPhlowErrorData not.
	self assert: data class equals: GtRemotePhlowPictureViewData.
	self assert: data content class equals: ByteArray.
	self assert: data content notEmpty.
	^data
]

{ #category : #'examples - specification' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilSpecificationRetrievalForDirectlySerializableStencil [
	<gtExample>
	| spec stencilSpec stencilData |
	spec := self explicitViewSpecificationWithDirectlySerializableStencil.
	stencilSpec := spec retrieveStencilSpecification.
	stencilData := stencilSpec stencilData.
	self assert: stencilSpec class equals: GtRemotePhlowDirectStencilSpecification.
	self assert: stencilSpec stencilClassName equals: #GtPhlowPictureWithDirectDataExampleStencil.
	self assert: stencilData class equals: Dictionary.
	self assert: (stencilData at: '__typeName') equals: #GtPhlowPictureWithDirectDataExampleStencil.
	self assert: (stencilData at: 'contentBytes') class equals: ByteArray.
	self assert: (stencilData at: 'contentBytes') notEmpty.
	^ stencilSpec
]

{ #category : #'examples - specification' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilSpecificationRetrievalForLocalStencilNameApi [
	<gtExample>
	| spec stencilSpec |
	spec := self explicitViewSpecificationWithLocalStencilNameApi.
	stencilSpec := spec retrieveStencilSpecification.
	self assert: stencilSpec class equals: GtRemotePhlowForwardStencilSpecification.
	self assert: stencilSpec stencilClassName equals: #GtLocalPhlowPictureFullSizeViewStencil.
	self assert: stencilSpec stencilData class equals: GtRemotePhlowPictureViewData.
	self assert: stencilSpec stencilData content class equals: ByteArray.
	self assert: stencilSpec stencilData content notEmpty.
	^ stencilSpec
]

{ #category : #'examples - specification' }
GtRemotePhlowExplicitViewAbstractExamples >> stencilSpecificationRetrievalForNamedStencil [
	<gtExample>
	| spec stencilSpec |
	spec := self explicitViewSpecificationWithNamedStencil.
	stencilSpec := spec retrieveStencilSpecification.
	self assert: stencilSpec class equals: GtRemotePhlowForwardStencilSpecification.
	self assert: stencilSpec stencilClassName equals: #GtLocalPhlowPictureFullSizeViewStencil.
	self assert: stencilSpec stencilData class equals: GtRemotePhlowPictureViewData.
	self assert: stencilSpec stencilData content class equals: ByteArray.
	self assert: stencilSpec stencilData content notEmpty.
	^ stencilSpec
]
