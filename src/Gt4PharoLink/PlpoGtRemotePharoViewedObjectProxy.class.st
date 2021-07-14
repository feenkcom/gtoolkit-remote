Class {
	#name : 'PlpoGtRemotePharoViewedObjectProxy',
	#superclass : 'PharoLinkProxyObject',
	#traits : 'TPlpoGtRemoteViewedObjectProxy',
	#classTraits : 'TPlpoGtRemoteViewedObjectProxy classTrait',
	#category : 'Gt4PharoLink-Proxies'
}

{ #category : 'accessing' }
PlpoGtRemotePharoViewedObjectProxy class >> remoteClassName [

	^ #GtViewedObject
]
