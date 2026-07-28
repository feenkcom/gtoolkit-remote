Class {
	#name : #GtRemotePhlowPictureViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'renderingStencilSpecification'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowPictureViewSpecification class >> fromJSONDictionary: aDictionary [
	| specification |
	specification := super fromJSONDictionary: aDictionary.
	specification
		renderingStencilSpecification: (GtRemotePhlowAbstractStencilSpecification
				fromDictionary: (aDictionary at: 'renderingStencilSpecification')).
	^specification
]

{ #category : #converting }
GtRemotePhlowPictureViewSpecification >> asBasicViewDataForExport [
	| dictionary |
	dictionary := super asBasicViewDataForExport.
	dictionary at: 'renderingStencilSpecification'
		put: self renderingStencilSpecification asDictionaryForExport.
	^dictionary
]

{ #category : #initialization }
GtRemotePhlowPictureViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource
		ifNil: 
			[self
				phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)]
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> renderingStencilSpecification [
	^renderingStencilSpecification
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> renderingStencilSpecification: aStencilSpecification [
	renderingStencilSpecification := aStencilSpecification
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> retrieveData [
	^self phlowDataSource retrieveData
]

{ #category : #accessing }
GtRemotePhlowPictureViewSpecification >> retrievePrimitiveData [
	^self retrieveData asDictionaryForExport
]
