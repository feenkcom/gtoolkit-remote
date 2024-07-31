Trait {
	#name : #TGtRemoteProxySpecificViews,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtMetaFor: aView [
	<gtProxyView>

	^ super gtMetaFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtPrintFor: aView [
	<gtProxyView>

	^ super gtPrintFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteProxySpecificViews >> gtRawFor: aView [
	<gtProxyView>

	^ super gtRawFor: aView
]

{ #category : #'as yet unclassified' }
TGtRemoteProxySpecificViews >> gtRemoteInspectorSpecificationsFor: aView [
	<gtProxyView>
	
	^ aView forward
		title: 'Remote specification';
		priority: 10002;
		object: [ GtJson
			forJsonString: (NeoJSONWriter 
				toStringPretty:  self getLocalProxyInspector getViewsDeclarations) ];
		view: #gtJsonStringFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Json'
			tooltip: 'Inspect the JSON object'
			action: [ :aButton |
				aButton phlow 
					spawnObject: aButton phlow forwardViewObjectFromViewAction ]
]
