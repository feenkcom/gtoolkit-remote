Extension { #name : #GtRemotePhlowViewedObject }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowViewedObject >> computeDeclarativeViewSpecificationsForCurrentObject [
	| declarativeData declarativeViewDeclarations |
		
	declarativeData := self getViewsDeclarations.
	declarativeViewDeclarations := declarativeData at: 'views' ifAbsent: [ #() ].
	^ declarativeViewDeclarations collect: [ :declarativeViewData |
		| declarativeView |
		declarativeView := GtPhlowViewSpecification 
			fromDictionary: declarativeViewData.
		declarativeView
			initializeFromInspector: self.
		declarativeView ] 
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowViewedObject >> declarativeViewSpecificationsForCurrentObject [
	^ self computeDeclarativeViewSpecificationsForCurrentObject
]
