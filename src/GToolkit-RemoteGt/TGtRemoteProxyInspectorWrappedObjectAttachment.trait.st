Trait {
	#name : #TGtRemoteProxyInspectorWrappedObjectAttachment,
	#traits : 'TGtRemoteProxyInspectorAttachment',
	#classTraits : 'TGtRemoteProxyInspectorAttachment classTrait',
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorWrappedObjectAttachment >> gtRemoteSideInspectorObjectHolder [
	^ self explicitRequirement
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorWrappedObjectAttachment >> gtRemoteSideInspectorTool [
	^ GtInspectorTool new 
		objectHolder: (self gtRemoteSideInspectorObjectHolder
			object: self; 
			viewSelector: #gtRemoteInspectorContentFor:)
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorWrappedObjectAttachment >> remoteActionsFor: anAction inContext: aContext from: anInspectorProxy [

	^ anInspectorProxy currentDeclarativeActionSpecifications 
		collect: [ :anActionSpecification | 
			| phlowAction |
			phlowAction := anActionSpecification actionFor: anAction.
			self 
				configurePhlowAction: phlowAction 
				withSpecification: anActionSpecification.
			phlowAction ] 
]

{ #category : #'gt - inspector' }
TGtRemoteProxyInspectorWrappedObjectAttachment >> remoteViewsFor: aView inContext: aContext from: anInspectorProxy [

	^ anInspectorProxy currentDeclarativeViewSpecifications 
		collect: [ :aViewSpecification | 
			| phlowView |
			phlowView := aViewSpecification viewFor: aView.
			self 
				configurePhlowView: phlowView 
				withSpecification: aViewSpecification.
			phlowView ] 
]
