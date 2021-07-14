Class {
	#name : 'PlpoGtRemoteViewedObjectProxy',
	#superclass : 'PharoLinkProxyObject',
	#traits : 'TPlpoGtRemoteViewedObjectProxy',
	#classTraits : 'TPlpoGtRemoteViewedObjectProxy classTrait',
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : 'accessing' }
PlpoGtRemoteViewedObjectProxy class >> remoteClassName [

	^ #GtPharoViewedObject
]
