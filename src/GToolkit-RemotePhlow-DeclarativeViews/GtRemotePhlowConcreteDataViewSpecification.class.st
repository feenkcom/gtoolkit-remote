Class {
	#name : #GtRemotePhlowConcreteDataViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'renderingStencilName',
		'viewData'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowConcreteDataViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	
	specification
		renderingStencilName: (aDictionary at: 'renderingStencilName').
		
	(aDictionary at: 'viewData' ifAbsent: [ nil ])
		ifNotNil: [ :viewDataDictionary |
			specification staticHeaders: (GtRemotePhlowBasicViewData 
				fromDictionary: viewDataDictionary) ].
	
	^specification
]

{ #category : #converting }
GtRemotePhlowConcreteDataViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	
	dictionary := super asBasicViewDataForExport.
	dictionary at: 'renderingStencilName' put: self renderingStencilName.
	
	self isWithLazyLoading ifFalse: [
		dictionary
			at: 'viewData' put: self viewData asDictionaryForExport ].
			
	^dictionary
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #updating }
GtRemotePhlowConcreteDataViewSpecification >> flushCachedData [
	viewData := nil.
	self phlowDataSource ifNotNil: [ :aDataSource |
		aDataSource flushCachedData ]
]

{ #category : #initialization }
GtRemotePhlowConcreteDataViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource
		ifNil: 
			[self
				phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)]
]

{ #category : #testing }
GtRemotePhlowConcreteDataViewSpecification >> isWithLazyLoading [
	^ self dataTransport = self class dataLazy
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> renderingStencilName [
	^ renderingStencilName
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> renderingStencilName: anObject [
	renderingStencilName := anObject
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> retrieveData [
	^self phlowDataSource retrieveData
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> retrievePrimitiveData [
	^self retrieveData asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> retrieveStencilData [
	^self retrieveData
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewSpecification >> viewData [
	^ viewData ifNil: [
			viewData := self retrieveData ]
]
