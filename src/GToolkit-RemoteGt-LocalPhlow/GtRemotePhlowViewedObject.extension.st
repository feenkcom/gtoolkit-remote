Extension { #name : #GtRemotePhlowViewedObject }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowViewedObject >> computeDeclarativeActionSpecificationsForCurrentObject [
	| specificationData specificationActionsData |
	specificationData := self getActionSpecifications.
	specificationActionsData := specificationData at: 'actions' ifAbsent: [ #() ].
	^ specificationActionsData 
		collect: [ :anActionSpecificationData |
			| actionSpecification |
			actionSpecification := GtPhlowActionSpecification 
				phlowActionFromDictionary: anActionSpecificationData.
			actionSpecification
				initializeFromInspector: self.
			actionSpecification ]
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowViewedObject >> computeDeclarativeViewSpecificationsForCurrentObject [
	| specicationData specificationViewsData |
	specicationData := self getViewsDeclarations.
	specificationViewsData := specicationData at: 'views' ifAbsent: [ #() ].
	^ specificationViewsData collect: [ :aViewSpecificationData |
		| viewSpecification |
		viewSpecification := GtPhlowViewSpecification 
			fromDictionary: aViewSpecificationData.
		viewSpecification
			initializeFromInspector: self.
		viewSpecification ] 
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowViewedObject >> declarativeActionsSpecificationsForCurrentObject [
	^ self computeDeclarativeActionSpecificationsForCurrentObject
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowViewedObject >> declarativeViewSpecificationsForCurrentObject [
	^ self computeDeclarativeViewSpecificationsForCurrentObject
]
