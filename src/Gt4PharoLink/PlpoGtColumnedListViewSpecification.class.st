Class {
	#name : #PlpoGtColumnedListViewSpecification,
	#superclass : #PharoLinkProxyObject,
	#traits : 'TPlpoGtDeclarativeListingView',
	#classTraits : 'TPlpoGtDeclarativeListingView classTrait',
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtColumnedListViewSpecification class >> remoteClassName [

	^ #GtPhlowColumnedListViewSpecification
]

{ #category : #accessing }
PlpoGtColumnedListViewSpecification >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [
	^ self
		proxyPerform: #retriveSpawnedObjectAtRow:column:
		withPrimitiveArguments: { aRowIndex . aColumnIndex }
]
