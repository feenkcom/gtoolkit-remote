Class {
	#name : #GtRemotePhlowForwarderViewInspectionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #assertions }
GtRemotePhlowForwarderViewInspectionExamples >> assertBasicForwarderView: aView [
	| aPhlowView |
	self assert: aView priority isNumber.
	self assert: aView object isNotNil.
	self 
		assert: aView viewObject wait object class 
		equals: self targetProxyClass.
	self assert: aView actions size equals: 0.

	aPhlowView := aView phlowView wait.

	"Assertions after the forwarded view initialization"
	self assert: aPhlowView notNil.
	self assert: aView phlowView wait equals: aView phlowView wait.
	
	aView title: 'Forwarded view'.
	self assert: aView title equals: 'Forwarded view'.

	self assert: aView actions size equals: 0.
	self assert: aView allActionsFuture wait size equals: 0.
	self assert: aView actions size equals: 0.
	self assert: ((aView asElementDo: [ :anElement | anElement ]) isKindOf: BrFromFuture). 
]

{ #category : #assertions }
GtRemotePhlowForwarderViewInspectionExamples >> assertTransformedValueInListFor: aTransformedValue [ 
	self assert:  aTransformedValue = { 42 . 42 } 
]

{ #category : #accessing }
GtRemotePhlowForwarderViewInspectionExamples >> computeObject [
	<gtExample>
	<return: #GtRemoteInspectionSimulation>
	^ GtRemoteInspectionSimulation
		openOn: GtRemotePhlowDeclarativeTestInspectable new
]

{ #category : #examples }
GtRemotePhlowForwarderViewInspectionExamples >> remoteForwardedViewToListView [
	<gtExample>
	<return: #GtPhlowRemoteForwarderView>
	| forwarderView |
	forwarderView := GtPhlowRemoteForwarderView new
			title: 'Forward with send - to list';
			priority: 10;
			object: [ self computeObject ];
			view: #gtListFor:.	"Assertions before initializing forwarded phlow"
	self assert: forwarderView title equals: 'Forward with send - to list'.
	self assert: forwarderView viewSymbol equals: #gtListFor:.

	self assertBasicForwarderView: forwarderView.

	self assert: forwarderView hasTransformation not.

	^ forwarderView
]

{ #category : #examples }
GtRemotePhlowForwarderViewInspectionExamples >> remoteForwardedViewWithLocalSendToListView [
	<gtExample>
	<return: #GtPhlowRemoteForwarderView>
	| forwarderView phlowView |
	forwarderView := GtPhlowRemoteForwarderView new
			title: 'Forward with send - to list';
			priority: 10;
			object: [ self computeObject ];
			view: #gtListFor:;
			send: [ :each | 
				{each.
					each} ].	"Assertions before initializing forwarded phlow"
	self assert: forwarderView title equals: 'Forward with send - to list'.
	self assert: forwarderView viewSymbol equals: #gtListFor:.

	self assertBasicForwarderView: forwarderView.

	self assert: forwarderView hasTransformation.
	self
		assert: (forwarderView transformation transformedValueFrom: Object new selection: {1})
				size
		equals: 2.

	phlowView := forwarderView phlowView wait.
	self assert: phlowView hasTransformation.
	self
		assertTransformedValueInListFor: (phlowView transformation
				transformedValueFrom: GtRemotePhlowDataNode new
				selection: {1}).

	^ forwarderView
]

{ #category : #accessing }
GtRemotePhlowForwarderViewInspectionExamples >> targetProxyClass [
	^ GtRemoteInspectionSimulation
]
