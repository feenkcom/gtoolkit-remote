Class {
	#name : #GtPhlowTextualViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'api - accessing' }
GtPhlowTextualViewSpecification >> getText [
	^ self phlowDataSource getText
]

{ #category : #initialization }
GtPhlowTextualViewSpecification >> initializeFromInspector: anInspector [
	self dataTransport = self class dataIncluded ifTrue: [ ^ self ].
	
	phlowDataSource ifNil: [
		self phlowDataSource: (anInspector 
			getDeclarativeViewFor: self methodSelector) ]
]

{ #category : #'api - accessing' }
GtPhlowTextualViewSpecification >> retrieveStylableText [
	^ self phlowDataSource retrieveStylableText
]
