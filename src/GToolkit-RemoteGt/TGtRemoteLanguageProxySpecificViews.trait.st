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
		items: [ self declarativeViews sorted: #priority ascending];
		column: 'Title' text: [ :aViewAccessor | aViewAccessor title ];
		column: 'Selector' text: [ :aViewAccessor | aViewAccessor methodSelector ];
		column: 'View' text: [ :aViewAccessor | aViewAccessor viewName ];
		column: 'Priority' text: [ :aViewAccessor | aViewAccessor priority ] weight: 0.5;
		column: 'Transport' text: [ :aViewAccessor | aViewAccessor dataTransport ] weight: 0.5;
		send: [ :aDeclarativeView | aDeclarativeView ]
]
