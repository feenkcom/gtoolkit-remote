Class {
	#name : #GtRemotePhlowPictureViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'renderingStencilName'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowPictureViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	specification
		renderingStencilName: (aDictionary at: 'renderingStencilName').
	^specification
]

{ #category : #converting }
GtRemotePhlowPictureViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	dictionary := super asBasicViewDataForExport.
	dictionary at: 'renderingStencilName' put: self renderingStencilName.
	^dictionary
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> configureViewActionsFor: aView [
	super configureViewActionsFor: aView.
	
	self configureDefaultRefreshActionFor: aView.
]

{ #category : #initialization }
GtRemotePhlowPictureViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource
		ifNil: 
			[self
				phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)]
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> renderingStencilName [
	^ renderingStencilName
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> renderingStencilName: anObject [
	renderingStencilName := anObject
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> retrieveData [
	^self phlowDataSource retrieveData
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> retrievePrimitiveData [
	^self retrieveData asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> retrieveStencilData [
	^self retrieveData
]
