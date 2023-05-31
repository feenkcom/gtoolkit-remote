Class {
	#name : #PlpoGtPhlowColumnedListViewSpecification,
	#superclass : #PharoLinkProxyObject,
	#traits : 'TPlpoGtPhlowListingViewSpecification',
	#classTraits : 'TPlpoGtPhlowListingViewSpecification classTrait',
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtPhlowColumnedListViewSpecification class >> remoteClassName [

	^ #GtPhlowColumnedListViewSpecification
]

{ #category : #accessing }
PlpoGtPhlowColumnedListViewSpecification >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [
	^ self
		proxyPerform: #retriveSpawnedObjectAtRow:column:
		withPrimitiveArguments: { aRowIndex . aColumnIndex }
]
