Class {
	#name : #PlpoGtDeclarativeColumnedListView,
	#superclass : #PharoLinkProxyObject,
	#traits : 'TPlpoGtDeclarativeListingView',
	#classTraits : 'TPlpoGtDeclarativeListingView classTrait',
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtDeclarativeColumnedListView class >> remoteClassName [

	^ #GtPhlowDeclarativeColumnedListView
]

{ #category : #accessing }
PlpoGtDeclarativeColumnedListView >> retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex [
	^ self
		proxyPerform: #retriveSpawnedObjectAtRow:column:
		withPrimitiveArguments: { aRowIndex . aColumnIndex }
]
