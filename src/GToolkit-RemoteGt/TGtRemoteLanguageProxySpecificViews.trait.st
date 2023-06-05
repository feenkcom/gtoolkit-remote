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
	
	^ aView columnedList
		title: 'Remote view specifications';
		priority: 10001;
		items: [ self declarativeViews ];
		column: 'Title' text: [ :aViewAccessor | aViewAccessor title ];
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] width: 120;
		send: [ :aDeclarativeView | aDeclarativeView ]
]
