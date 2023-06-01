Class {
	#name : #PlpoGtPhlowTreeViewSpecification,
	#superclass : #PharoLinkProxyObject,
	#traits : 'TPlpoGtPhlowListingViewSpecification + TPlpoGtPhlowTreeViewSpecification',
	#classTraits : 'TPlpoGtPhlowListingViewSpecification classTrait + TPlpoGtPhlowTreeViewSpecification classTrait',
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoGtPhlowTreeViewSpecification class >> remoteClassName [

	^ #GtPhlowTreeViewSpecification
]
