Trait {
	#name : #TGtRemoteProxyInspectorWrappedObjectAttachment,
	#traits : 'TGtRemoteProxyInspectorAttachment',
	#classTraits : 'TGtRemoteProxyInspectorAttachment classTrait',
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
TGtRemoteProxyInspectorWrappedObjectAttachment >> gtRemoteInspectorTargetObject [
	^ GtRemotePhlowViewedObjectInspectorAdaptor
		forTargetObject: self
]

{ #category : #accessing }
TGtRemoteProxyInspectorWrappedObjectAttachment >> remoteActionsFor: aView inContext: aContext from: anInspectorProxy [

	^ anInspectorProxy currentDeclarativeActionSpecifications 
		collect: [ :aViewSpecification | 
			self 
				remoteActionFromSpecification: aViewSpecification 
				for: aView 
				inContext: aContext ] 
]

{ #category : #accessing }
TGtRemoteProxyInspectorWrappedObjectAttachment >> remoteViewsFor: aView inContext: aContext from: anInspectorProxy [

	^ anInspectorProxy currentDeclarativeViewSpecifications 
		collect: [ :aViewSpecification | 
			self 
				remoteViewFromSpecification: aViewSpecification 
				for: aView 
				inContext: aContext ] 
]
