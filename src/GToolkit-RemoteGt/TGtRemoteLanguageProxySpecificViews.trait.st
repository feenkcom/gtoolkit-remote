Trait {
	#name : #TGtRemoteLanguageProxySpecificViews,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #'gt - extensions' }
TGtRemoteLanguageProxySpecificViews >> gtMetaFor: aView [
	<gtProxy>

	^ super gtMetaFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteLanguageProxySpecificViews >> gtPrintFor: aView [
	<gtProxy>

	^ super gtPrintFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteLanguageProxySpecificViews >> gtRawFor: aView [
	<gtProxy>

	^ super gtRawFor: aView
]

{ #category : #'gt - extensions' }
TGtRemoteLanguageProxySpecificViews >> gtRemoteViewSpecificationsFor: aView [
	<gtProxy>
	
	^ aView list
		title: 'Remote view specifications';
		priority: 10001;
		items: [ self declarativeViews ];
		itemText: [ :aViewAccessor | aViewAccessor title ];
		send: [ :aDeclarativeView | aDeclarativeView ]
]
