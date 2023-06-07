Class {
	#name : #PlpoGtPhlowForwardViewSpecification,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtPhlowForwardViewSpecification class >> remoteClassName [
	^ #GtPhlowForwardViewSpecification
]

{ #category : #accessing }
PlpoGtPhlowForwardViewSpecification >> getDeclarativeViewFor: aViewSelector [

	^ self
		proxyPerformSerialized: #getDeclarativeViewFor:
		withPrimitiveArguments: { aViewSelector }
]

{ #category : #accessing }
PlpoGtPhlowForwardViewSpecification >> retrieveForwardTargetDataSource [

	^ self
		proxyPerform: #retrieveForwardTargetDataSource
]

{ #category : #accessing }
PlpoGtPhlowForwardViewSpecification >> retrieveViewSpecificationForForwarding [

	^ self
		proxyPerformSerialized: #retrieveViewSpecificationForForwarding
]
