Class {
	#name : #GtPhlowForwardViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'api - accessing' }
GtPhlowForwardViewSpecification >> getDeclarativeViewFor: aViewSelector [
	"This provides the same API as the inspector proxy, so that view 
	specifications can define a single method for initializing the link 
	between the local and the remote instance of the specification."
	
	^ self phlowDataSource
		getDeclarativeViewFor: aViewSelector
]

{ #category : #accessing }
GtPhlowForwardViewSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource: (anInspector 
		getDeclarativeViewFor: self methodSelector)
]

{ #category : #'api - accessing' }
GtPhlowForwardViewSpecification >> loadViewSpecificationForForwarding [
	| declarativeViewData declarativeView |
	
	declarativeViewData := self retrieveViewSpecificationForForwarding.
	declarativeView := GtPhlowViewSpecification fromDictionary: declarativeViewData.
	
	"At this point we need to configure the specification for new view
	just like the inspector does it when retrieveing views. This links the
	local instance of the specification with a proxy to the remote instance."
	declarativeView
		initializeFromInspector: self.
				
	^ declarativeView
]

{ #category : #'api - accessing' }
GtPhlowForwardViewSpecification >> retrieveForwardTargetDataSource [
	"This retrieves directly the datasource for the forwarded view."
	^ self phlowDataSource
		retrieveForwardTargetDataSource
]

{ #category : #'api - accessing' }
GtPhlowForwardViewSpecification >> retrieveViewSpecificationForForwarding [
	^ self phlowDataSource
		retrieveViewSpecificationForForwarding
]
