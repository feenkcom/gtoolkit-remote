Class {
	#name : #GtRemotePhlowExplicitViewWithSerializationTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowExplicitViewWithSerializationTestObject class >> pictureBytes [
	^ GtRemotePhlowTestDataForExamples pictureBytes
]

{ #category : #'as yet unclassified' }
GtRemotePhlowExplicitViewWithSerializationTestObject >> gtExplicitPictureViewDirectProxySerializationFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Direct proxy';
		priority: 15;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtLocalPhlowPictureFullSizeViewStencil;
				stencilData: ((GtRemotePhlowPictureViewData new)
						content: self class pictureBytes);
				dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy 
					forDirectProxy  ]
]

{ #category : #'as yet unclassified' }
GtRemotePhlowExplicitViewWithSerializationTestObject >> gtExplicitPictureViewManualDictionarySerializationFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Manual dictionary';
		priority: 5;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtLocalPhlowPictureFullSizeViewStencil;
				stencilData: ((GtRemotePhlowPictureViewData new)
						content: self class pictureBytes);
				dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy 
					forManualDictionary  ]
]

{ #category : #'as yet unclassified' }
GtRemotePhlowExplicitViewWithSerializationTestObject >> gtExplicitPictureViewWireEncodingSerializationFor: aView [
	<gtView>
	
	^(aView explicit)
		title: 'Wire encoding';
		priority: 10;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtLocalPhlowPictureFullSizeViewStencil;
				stencilData: ((GtRemotePhlowPictureViewData new)
						content: self class pictureBytes);
				dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy 
					forWireEncoding  ]
]
